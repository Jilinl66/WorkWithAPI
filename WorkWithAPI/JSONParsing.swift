//
//  JSONParsing.swift
//  WorkWithAPI
//
//  Created by Jilin Liu on 6/14/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import Foundation

protocol JSONDecodable {
    init(_ decoder: JSONDecoder) throws
}
typealias JSONObject = [String: Any]
class JSONDecoder {
    let jsonObject: JSONObject
    init(_ jsonObject: JSONObject) {
        self.jsonObject = jsonObject
    }
}

func parse<T>(_ data: Data) throws -> [T] where T: JSONDecodable  {
    let jsonObjects = try deserialize(data)
    return try jsonObjects.map(decode)
}

/// deserialize data from zero and one bit to native object collection
///
/// - parameter data: The data to deserialize.
/// - returns: A collection of json objects.
/// - throws: An error if any value throws an error during deserializing.
func deserialize(_ data: Data) throws -> [JSONObject] {
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let objects = json as? [JSONObject] else { return [] }
    return objects
}

func decode<T>(_ jsonObject: JSONObject) throws -> T where T: JSONDecodable {
    return try T.init(JSONDecoder(jsonObject))
}
