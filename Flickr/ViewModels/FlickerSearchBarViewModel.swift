//
//  FlickerSearchBarViewModel.swift
//  Flickr
//
//  Created by Ramesh Maddali on 7/1/24.
//

import Foundation

import Combine

class FlickrSearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var searchResults: [FlickrFeed.FlickrItem] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] searchText in
                self?.searchPhotos(query: searchText)
            }
            .store(in: &cancellables)
    }
    
    private func searchPhotos(query: String) {
        guard let url = URL(string: "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=\(searchText.lowercased())") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(FlickrFeed.self, from: data)
                DispatchQueue.main.async {
                    self.searchResults = result.items
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
}
