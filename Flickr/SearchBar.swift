//
//  SearchBar.swift
//  Flickr
//
//  Created by Ramesh Maddali on 7/1/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    
    var body: some View {
        HStack {
            TextField("Search for flowers or animals", text: $text, onCommit:  {
                
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
        }
    }
}


struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("search"))
    }
}
