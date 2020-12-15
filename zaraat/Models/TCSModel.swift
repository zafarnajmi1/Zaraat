//
//  TCSModel.swift
//  zaraat
//
//  Created by ZafarNajmi on 12/10/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct TCSModel : Codable {
    let returnStatus : ReturnStatus?
    let bookingReply : BookingReply?

    enum CodingKeys: String, CodingKey {

        case returnStatus = "returnStatus"
        case bookingReply = "bookingReply"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        returnStatus = try values.decodeIfPresent(ReturnStatus.self, forKey: .returnStatus)
        bookingReply = try values.decodeIfPresent(BookingReply.self, forKey: .bookingReply)
    }

}

struct ReturnStatus : Codable {
    let code : String?
    let status : String?
    let message : String?
    let requestTime : String?
    let responseTime : String?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case status = "status"
        case message = "message"
        case requestTime = "requestTime"
        case responseTime = "responseTime"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        requestTime = try values.decodeIfPresent(String.self, forKey: .requestTime)
        responseTime = try values.decodeIfPresent(String.self, forKey: .responseTime)
    }

}

struct BookingReply : Codable {
    let result : String?

    enum CodingKeys: String, CodingKey {

        case result = "result"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent(String.self, forKey: .result)
    }

}
