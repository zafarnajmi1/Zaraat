//
//  ViewAllFlashSaleModel.swift
//  zaraat
//
//  Created by ZafarNajmi on 10/15/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct ViewAllFlashSaleModel : Codable {
    let message : String?
    let data : FlashSaleData?
    let success : Int?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case data = "data"
        case success = "success"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(FlashSaleData.self, forKey: .data)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}

struct  FlashSaleData : Codable {
    let sales : [Sales]?
    let ad : Ad?

    enum CodingKeys: String, CodingKey {

        case sales = "sales"
        case ad = "ad"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sales = try values.decodeIfPresent([Sales].self, forKey: .sales)
        ad = try values.decodeIfPresent(Ad.self, forKey: .ad)
    }

}




