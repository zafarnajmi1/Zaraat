//
//  WeeklyViewAllModel.swift
//  zaraat
//
//  Created by ZafarNajmi on 10/15/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct WeeklyViewAllProducts : Codable {
    let message : String?
    let data : WeeklyViewAllData?
    let status : Int?
    let success : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case data = "data"
        case status = "status"
        case success = "success"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(WeeklyViewAllData.self, forKey: .data)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
    }

}

struct WeeklyViewAllData : Codable {
    let products : [Products]?
    let ad : Ad?

    enum CodingKeys: String, CodingKey {

        case products = "products"
        case ad = "ad"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        products = try values.decodeIfPresent([Products].self, forKey: .products)
        ad = try values.decodeIfPresent(Ad.self, forKey: .ad)
    }

}
