//
//  SubCategoriesModel.swift
//  zaraat
//
//  Created by ZafarNajmi on 10/13/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct SubCategoriesModel : Codable {
    let message : String?
    let subcategories : [SubCategoriesSubcategories]?
    let status : Int?
    let success : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case subcategories = "subcategories"
        case status = "status"
        case success = "success"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        subcategories = try values.decodeIfPresent([SubCategoriesSubcategories].self, forKey: .subcategories)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
    }

}


struct SubCategoriesSubcategories : Codable {
    let subcategory_id : Int?
    let category_id : Int?
    let subcategory_title_en : String?
    let subcategory_title_urdu : String?
    let subcategory_description_en : String?
    let subcategory_description_urdu : String?
    let commission : String?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case subcategory_id = "subcategory_id"
        case category_id = "category_id"
        case subcategory_title_en = "subcategory_title_en"
        case subcategory_title_urdu = "subcategory_title_urdu"
        case subcategory_description_en = "subcategory_description_en"
        case subcategory_description_urdu = "subcategory_description_urdu"
        case commission = "commission"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        subcategory_id = try values.decodeIfPresent(Int.self, forKey: .subcategory_id)
        category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
        subcategory_title_en = try values.decodeIfPresent(String.self, forKey: .subcategory_title_en)
        subcategory_title_urdu = try values.decodeIfPresent(String.self, forKey: .subcategory_title_urdu)
        subcategory_description_en = try values.decodeIfPresent(String.self, forKey: .subcategory_description_en)
        subcategory_description_urdu = try values.decodeIfPresent(String.self, forKey: .subcategory_description_urdu)
        commission = try values.decodeIfPresent(String.self, forKey: .commission)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
