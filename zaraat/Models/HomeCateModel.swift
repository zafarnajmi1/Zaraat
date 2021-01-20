//
//  HomeCateModel.swift
//  zaraat
//
//  Created by ZafarNajmi on 10/14/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct HomeCate : Codable {
    let message : String?
    let data : HomeCateData?
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
        data = try values.decodeIfPresent(HomeCateData.self, forKey: .data)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
    }

}

struct HomeCateData : Codable {
    let ad_1 : HomeCateAd_1?
    let sub_categories : [HomeCateSub_categories]?
    let section_1 : [HomeCateSection_1]?
    let ad_2 : HomeCateAd_2?
    let section_2 : [HomeCateSection_2]?

    enum CodingKeys: String, CodingKey {

        case ad_1 = "ad_1"
        case sub_categories = "sub_categories"
        case section_1 = "section_1"
        case ad_2 = "ad_2"
        case section_2 = "section_2"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ad_1 = try values.decodeIfPresent(HomeCateAd_1.self, forKey: .ad_1)
        sub_categories = try values.decodeIfPresent([HomeCateSub_categories].self, forKey: .sub_categories)
        section_1 = try values.decodeIfPresent([HomeCateSection_1].self, forKey: .section_1)
        ad_2 = try values.decodeIfPresent(HomeCateAd_2.self, forKey: .ad_2)
        section_2 = try values.decodeIfPresent([HomeCateSection_2].self, forKey: .section_2)
    }

}


struct HomeCateSub_categories : Codable {
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

struct HomeCateSection_2 : Codable {
    let products_id : Int?
    let vendor_id : Int?
    let category_id : Int?
    let subcategory_id : Int?
    let child_subcategory_id : Int?
    let product_title_en : String?
    let product_title_urdu : String?
    let product_description_en : String?
    let product_description_urdu : String?
    let product_type : String?
    let product_stock : String?
    let stock_threshold : String?
    let vendor_price : String?
    let selling_price : String?
    let product_length : String?
    let product_width : String?
    let product_weight : String?
    let product_height : String?
    let product_supply_ability : String?
    let product_sku : String?
    let product_barcode : String?
    let product_status : String?
    let featured_image : String?
    let created_at : String?
    let updated_at : String?
    let vendor_package : Vendor_package?
    let avg_rating : Double?
    enum CodingKeys: String, CodingKey {

        case products_id = "products_id"
        case vendor_id = "vendor_id"
        case category_id = "category_id"
        case subcategory_id = "subcategory_id"
        case child_subcategory_id = "child_subcategory_id"
        case product_title_en = "product_title_en"
        case product_title_urdu = "product_title_urdu"
        case product_description_en = "product_description_en"
        case product_description_urdu = "product_description_urdu"
        case product_type = "product_type"
        case product_stock = "product_stock"
        case stock_threshold = "stock_threshold"
        case vendor_price = "vendor_price"
        case selling_price = "selling_price"
        case product_length = "product_length"
        case product_width = "product_width"
        case product_weight = "product_weight"
        case product_height = "product_height"
        case product_supply_ability = "product_supply_ability"
        case product_sku = "product_sku"
        case product_barcode = "product_barcode"
        case product_status = "product_status"
        case featured_image = "featured_image"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case vendor_package = "vendor_package"
        case avg_rating = "avg_rating"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        products_id = try values.decodeIfPresent(Int.self, forKey: .products_id)
        vendor_id = try values.decodeIfPresent(Int.self, forKey: .vendor_id)
        category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
        subcategory_id = try values.decodeIfPresent(Int.self, forKey: .subcategory_id)
        child_subcategory_id = try values.decodeIfPresent(Int.self, forKey: .child_subcategory_id)
        product_title_en = try values.decodeIfPresent(String.self, forKey: .product_title_en)
        product_title_urdu = try values.decodeIfPresent(String.self, forKey: .product_title_urdu)
        product_description_en = try values.decodeIfPresent(String.self, forKey: .product_description_en)
        product_description_urdu = try values.decodeIfPresent(String.self, forKey: .product_description_urdu)
        product_type = try values.decodeIfPresent(String.self, forKey: .product_type)
        product_stock = try values.decodeIfPresent(String.self, forKey: .product_stock)
        stock_threshold = try values.decodeIfPresent(String.self, forKey: .stock_threshold)
        vendor_price = try values.decodeIfPresent(String.self, forKey: .vendor_price)
        selling_price = try values.decodeIfPresent(String.self, forKey: .selling_price)
        product_length = try values.decodeIfPresent(String.self, forKey: .product_length)
        product_width = try values.decodeIfPresent(String.self, forKey: .product_width)
        product_weight = try values.decodeIfPresent(String.self, forKey: .product_weight)
        product_height = try values.decodeIfPresent(String.self, forKey: .product_height)
        product_supply_ability = try values.decodeIfPresent(String.self, forKey: .product_supply_ability)
        product_sku = try values.decodeIfPresent(String.self, forKey: .product_sku)
        product_barcode = try values.decodeIfPresent(String.self, forKey: .product_barcode)
        product_status = try values.decodeIfPresent(String.self, forKey: .product_status)
        featured_image = try values.decodeIfPresent(String.self, forKey: .featured_image)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        vendor_package = try values.decodeIfPresent(Vendor_package.self, forKey: .vendor_package)
        avg_rating =  try values.decodeIfPresent(Double.self, forKey: .avg_rating)
    }

}

struct HomeCateSection_1 : Codable {
    let products_id : Int?
    let vendor_id : Int?
    let category_id : Int?
    let subcategory_id : Int?
    let child_subcategory_id : Int?
    let product_title_en : String?
    let product_title_urdu : String?
    let product_description_en : String?
    let product_description_urdu : String?
    let product_type : String?
    let product_stock : String?
    let stock_threshold : String?
    let vendor_price : String?
    let selling_price : String?
    let product_length : String?
    let product_width : String?
    let product_weight : String?
    let product_height : String?
    let product_supply_ability : String?
    let product_sku : String?
    let product_barcode : String?
    let product_status : String?
    let featured_image : String?
    let created_at : String?
    let updated_at : String?
    let vendor_package : Vendor_package?
    let avg_rating : Double?
    enum CodingKeys: String, CodingKey {

        case products_id = "products_id"
        case vendor_id = "vendor_id"
        case category_id = "category_id"
        case subcategory_id = "subcategory_id"
        case child_subcategory_id = "child_subcategory_id"
        case product_title_en = "product_title_en"
        case product_title_urdu = "product_title_urdu"
        case product_description_en = "product_description_en"
        case product_description_urdu = "product_description_urdu"
        case product_type = "product_type"
        case product_stock = "product_stock"
        case stock_threshold = "stock_threshold"
        case vendor_price = "vendor_price"
        case selling_price = "selling_price"
        case product_length = "product_length"
        case product_width = "product_width"
        case product_weight = "product_weight"
        case product_height = "product_height"
        case product_supply_ability = "product_supply_ability"
        case product_sku = "product_sku"
        case product_barcode = "product_barcode"
        case product_status = "product_status"
        case featured_image = "featured_image"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case vendor_package = "vendor_package"
        case avg_rating = "avg_rating"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        products_id = try values.decodeIfPresent(Int.self, forKey: .products_id)
        vendor_id = try values.decodeIfPresent(Int.self, forKey: .vendor_id)
        category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
        subcategory_id = try values.decodeIfPresent(Int.self, forKey: .subcategory_id)
        child_subcategory_id = try values.decodeIfPresent(Int.self, forKey: .child_subcategory_id)
        product_title_en = try values.decodeIfPresent(String.self, forKey: .product_title_en)
        product_title_urdu = try values.decodeIfPresent(String.self, forKey: .product_title_urdu)
        product_description_en = try values.decodeIfPresent(String.self, forKey: .product_description_en)
        product_description_urdu = try values.decodeIfPresent(String.self, forKey: .product_description_urdu)
        product_type = try values.decodeIfPresent(String.self, forKey: .product_type)
        product_stock = try values.decodeIfPresent(String.self, forKey: .product_stock)
        stock_threshold = try values.decodeIfPresent(String.self, forKey: .stock_threshold)
        vendor_price = try values.decodeIfPresent(String.self, forKey: .vendor_price)
        selling_price = try values.decodeIfPresent(String.self, forKey: .selling_price)
        product_length = try values.decodeIfPresent(String.self, forKey: .product_length)
        product_width = try values.decodeIfPresent(String.self, forKey: .product_width)
        product_weight = try values.decodeIfPresent(String.self, forKey: .product_weight)
        product_height = try values.decodeIfPresent(String.self, forKey: .product_height)
        product_supply_ability = try values.decodeIfPresent(String.self, forKey: .product_supply_ability)
        product_sku = try values.decodeIfPresent(String.self, forKey: .product_sku)
        product_barcode = try values.decodeIfPresent(String.self, forKey: .product_barcode)
        product_status = try values.decodeIfPresent(String.self, forKey: .product_status)
        featured_image = try values.decodeIfPresent(String.self, forKey: .featured_image)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        vendor_package = try values.decodeIfPresent(Vendor_package.self, forKey: .vendor_package)
        avg_rating = try values.decodeIfPresent(Double.self, forKey: .avg_rating)
    }

}

struct HomeCateAd_2 : Codable {
    let categories_id : Int?
    let market : String?
    let category_title_en : String?
    let category_title_urdu : String?
    let category_image : String?
    let category_description_en : String?
    let category_description_urdu : String?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case categories_id = "categories_id"
        case market = "market"
        case category_title_en = "category_title_en"
        case category_title_urdu = "category_title_urdu"
        case category_image = "category_image"
        case category_description_en = "category_description_en"
        case category_description_urdu = "category_description_urdu"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        categories_id = try values.decodeIfPresent(Int.self, forKey: .categories_id)
        market = try values.decodeIfPresent(String.self, forKey: .market)
        category_title_en = try values.decodeIfPresent(String.self, forKey: .category_title_en)
        category_title_urdu = try values.decodeIfPresent(String.self, forKey: .category_title_urdu)
        category_image = try values.decodeIfPresent(String.self, forKey: .category_image)
        category_description_en = try values.decodeIfPresent(String.self, forKey: .category_description_en)
        category_description_urdu = try values.decodeIfPresent(String.self, forKey: .category_description_urdu)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}


struct  HomeCateAd_1 : Codable {
    let categories_id : Int?
    let market : String?
    let category_title_en : String?
    let category_title_urdu : String?
    let category_image : String?
    let category_description_en : String?
    let category_description_urdu : String?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case categories_id = "categories_id"
        case market = "market"
        case category_title_en = "category_title_en"
        case category_title_urdu = "category_title_urdu"
        case category_image = "category_image"
        case category_description_en = "category_description_en"
        case category_description_urdu = "category_description_urdu"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        categories_id = try values.decodeIfPresent(Int.self, forKey: .categories_id)
        market = try values.decodeIfPresent(String.self, forKey: .market)
        category_title_en = try values.decodeIfPresent(String.self, forKey: .category_title_en)
        category_title_urdu = try values.decodeIfPresent(String.self, forKey: .category_title_urdu)
        category_image = try values.decodeIfPresent(String.self, forKey: .category_image)
        category_description_en = try values.decodeIfPresent(String.self, forKey: .category_description_en)
        category_description_urdu = try values.decodeIfPresent(String.self, forKey: .category_description_urdu)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
