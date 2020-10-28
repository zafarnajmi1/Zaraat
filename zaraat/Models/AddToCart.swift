//
//  AddToCart.swift
//  zaraat
//
//  Created by ZafarNajmi on 10/27/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct AddtoCart : Codable {
    let message : String?
    let status : Int?
    let success : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case status = "status"
        case success = "success"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
    }

}
