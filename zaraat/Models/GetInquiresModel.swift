//
//  GetInquiresModel.swift
//  zaraat
//
//  Created by ZafarNajmi on 11/11/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct GetInguiresModel : Codable {
    let message : String?
    let enquiries : [Enquiries]?
    let status : Int?
    let success : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case enquiries = "enquiries"
        case status = "status"
        case success = "success"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        enquiries = try values.decodeIfPresent([Enquiries].self, forKey: .enquiries)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
    }

}

struct Enquiries : Codable {
    let enquiry_id : Int?
        let vendor_id : Int?
        let customer_id : Int?
        let product_id : Int?
        let message : String?
        let reply : String?
        let document : String?
        let status : Int?
        let created_at : String?
        let updated_at : String?
        let owners_name : String?
        let product_name : String?

        enum CodingKeys: String, CodingKey {

            case enquiry_id = "enquiry_id"
            case vendor_id = "vendor_id"
            case customer_id = "customer_id"
            case product_id = "product_id"
            case message = "message"
            case reply = "reply"
            case document = "document"
            case status = "status"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case owners_name = "owners_name"
            case product_name = "product_name"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            enquiry_id = try values.decodeIfPresent(Int.self, forKey: .enquiry_id)
            vendor_id = try values.decodeIfPresent(Int.self, forKey: .vendor_id)
            customer_id = try values.decodeIfPresent(Int.self, forKey: .customer_id)
            product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            reply = try values.decodeIfPresent(String.self, forKey: .reply)
            document = try values.decodeIfPresent(String.self, forKey: .document)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            owners_name = try values.decodeIfPresent(String.self, forKey: .owners_name)
            product_name = try values.decodeIfPresent(String.self, forKey: .product_name)
        }

    }
