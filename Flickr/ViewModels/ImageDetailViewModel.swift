//
//  ImageDetailViewModel.swift
//  Flickr
//
//  Created by Ramesh Maddali on 7/1/24.
//

import Foundation

class ImageDetailViewModel {
    
    func formatDate(dateString: String) -> String {
        
        //"2024-06-27T10:17:53Z"

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
            return ""
        }

    }
}
