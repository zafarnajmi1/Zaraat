//
//  ProductListModel.swift
//  zaraat
//
//  Created by ZafarNajmi on 10/20/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct ProductListModel : Codable {
    let message : String?
    let data : ProductListData?
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
        data = try values.decodeIfPresent(ProductListData.self, forKey: .data)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
    }

}

struct ProductListData : Codable {
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
