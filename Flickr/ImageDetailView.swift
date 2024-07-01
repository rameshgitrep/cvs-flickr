//
//  ImageDetailView.swift
//  Flickr
//
//  Created by Ramesh Maddali on 7/1/24.
//

import SwiftUI

struct ImageDetailView: View {
    let photo: FlickrFeed.FlickrItem
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: true, content: {
                AsyncImage(url: URL(string: photo.media.m)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    case .empty:
                        ProgressView()
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                

                HStack {
                    Text("Title")
                        .font(.headline)
                        .padding()
                    
                    Text(photo.title)
                        .font(.subheadline)
                        .padding()
                }
             
                HStack {
                    Text("Author")
                        .font(.headline)
                        .padding()
                    
                    Text(photo.author)
                        .font(.subheadline)
                        .padding()
                }
                
                HStack {
                    Text("Published Date")
                        .font(.headline)
                        .padding()
                    Text(formatDate() ?? "")
                        .font(.subheadline)
                        .padding()
                }
                
                
                Spacer()
            })
        }
        .navigationBarTitle(Text(photo.title), displayMode: .inline)
    }
    
    func formatDate() -> String? {
        
        let dateString = photo.published //"2024-06-27T10:17:53Z"

        // Create an instance of ISO8601DateFormatter
        let formatter = ISO8601DateFormatter()

        // Optionally, set the date format options if needed
        formatter.formatOptions = [.withInternetDateTime]

        // Attempt to parse the date string
        if let date = formatter.date(from: dateString) {
            // If successful, 'date' now contains the parsed date
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            //dateFormatter.timeStyle = .medium
            
            let formattedDate = dateFormatter.string(from: date)
            print("Formatted Date: \(formattedDate)")
            return formattedDate
        } else {
            print("Failed to parse date string.")
            return nil
        }

    }
    
    
}


