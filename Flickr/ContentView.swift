//
//  ContentView.swift
//  Flickr
//
//  Created by Ramesh Maddali on 7/1/24.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    @StateObject var viewModel = FlickrSearchViewModel()
    @State private var isShowingDetail: Bool = false
    @State private var selectedPhoto: FlickrFeed.FlickrItem? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText)
                    .padding(.horizontal)
                
                if !viewModel.searchResults.isEmpty {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                            ForEach(viewModel.searchResults, id: \.id) { photo in
                                Button {
                                    selectedPhoto = photo
                                    isShowingDetail = true
                                } label: {
                                    AsyncImage(url: URL(string: photo.media.m)) { phase in
                                        switch phase {
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                        case .failure:
                                            Image(systemName: "photo")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                        case .empty:
                                            ProgressView()
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    .frame(height: 150)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .padding()
                    }
                } else {
                    Spacer()
                    Text("No photos found")
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            .navigationTitle("Flickr Photo Search")
            .sheet(isPresented: $isShowingDetail) {
                            if let selectedPhoto = selectedPhoto {
                                NavigationView {
                                    ImageDetailView(photo: selectedPhoto)
                                }
                            }
                        }
        }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
