//
//  Menu.swift
//  WorkWithAPI
//
//  Created by Jilin Liu on 6/14/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import Foundation

struct Menu {
    struct Keys {
        static let id = "id"
        static let title = "title"
        static let category = "category"
        static let description = "description"
        static let date = "date"
        static let imageUrlString = "imageUrlString"
        static let imageTitle = "imageTitle"
        static let rate = "rate"
    }
    
    let id: String
    let title: String
    let category: String
    let description: String?
    let date: Date?
    
    fileprivate let imageUrlString: String
    var imageUrl: URL? {
        return URL(string: imageUrlString)
    }
    let imageTitle: String
    let rate: Double
}


extension Menu: JSONDecodable {
    init(_ decoder: JSONDecoder) throws {
        id = try decoder.value(forKey: Keys.id)
        title = try decoder.value(forKey: Keys.title)
        category = try decoder.value(forKey: Keys.category)
        description = try? decoder.value(forKey: Keys.description)
        imageUrlString = try decoder.value(forKey: Keys.imageUrlString)
        
        date = try decoder.value(forKey: Keys.date)
        
        imageTitle = try decoder.value(forKey: Keys.imageTitle)
        rate = try decoder.value(forKey: Keys.rate)
    }
}
