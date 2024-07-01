//
//  ImageDetailView.swift
//  Flickr
//
//  Created by Ramesh Maddali on 7/1/24.
//

import SwiftUI

struct ImageDetailView: View {
    let photo: FlickrFeed.FlickrItem
    let viewModel = ImageDetailViewModel()
    
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
                    Text(viewModel.formatDate(dateString: photo.published))
                        .font(.subheadline)
                        .padding()
                }
                
                
                Spacer()
            })
        }
        .navigationBarTitle(Text(photo.title), displayMode: .inline)
    }
    
    
    
    
}


