//
//  Menu.swift
//  WorkWithAPI
//
//  Created by Jilin Liu on 6/14/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import Foundation

class Menu {
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
    }
}
