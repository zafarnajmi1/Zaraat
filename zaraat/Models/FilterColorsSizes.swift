//
//  FilterColorsSizes.swift
//  zaraat
//
//  Created by ZafarNajmi on 11/2/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct FilterColorsSizes : Codable {
    let message : String?
    let colors : [Colors]?
    let sizes : [Sizes]?
    let status : Int?
    let success : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case colors = "colors"
        case sizes = "sizes"
        case status = "status"
        case success = "success"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        colors = try values.decodeIfPresent([Colors].self, forKey: .colors)
        sizes = try values.decodeIfPresent([Sizes].self, forKey: .sizes)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
    }

}

struct Sizes : Codable {
    let attribute_values_id : Int?
    let attribute_id : Int?
    let attribute_values : String?
    let value_names : String?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case attribute_values_id = "attribute_values_id"
        case attribute_id = "attribute_id"
        case attribute_values = "attribute_values"
        case value_names = "value_names"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        attribute_values_id = try values.decodeIfPresent(Int.self, forKey: .attribute_values_id)
        attribute_id = try values.decodeIfPresent(Int.self, forKey: .attribute_id)
        attribute_values = try values.decodeIfPresent(String.self, forKey: .attribute_values)
        value_names = try values.decodeIfPresent(String.self, forKey: .value_names)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}


struct Colors : Codable {
    let attribute_values_id : Int?
    let attribute_id : Int?
    let attribute_values : String?
    let value_names : String?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case attribute_values_id = "attribute_values_id"
        case attribute_id = "attribute_id"
        case attribute_values = "attribute_values"
        case value_names = "value_names"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        attribute_values_id = try values.decodeIfPresent(Int.self, forKey: .attribute_values_id)
        attribute_id = try values.decodeIfPresent(Int.self, forKey: .attribute_id)
        attribute_values = try values.decodeIfPresent(String.self, forKey: .attribute_values)
        value_names = try values.decodeIfPresent(String.self, forKey: .value_names)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
