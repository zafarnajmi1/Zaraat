//
//  SubCateProductsModel.swift
//  zaraat
//
//  Created by ZafarNajmi on 10/13/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct SubCateProductsModels : Codable {
    let message : String?
    let data : SubCateProductsData?
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
        data = try values.decodeIfPresent(SubCateProductsData.self, forKey: .data)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
    }

}

struct Products : Codable {
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
    let feature : Feature?
    let images : [Images]?
    let vendor_package : Vendor_package?

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
        case feature = "feature"
        case images = "images"
        case vendor_package = "vendor_package"
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
        feature = try values.decodeIfPresent(Feature.self, forKey: .feature)
        images = try values.decodeIfPresent([Images].self, forKey: .images)
        vendor_package = try values.decodeIfPresent(Vendor_package.self, forKey: .vendor_package)
    }

}

struct Vendor_package : Codable {
    let package_id : Int?
    let showcase_products : String?
    let sub_accounts : String?
    let account_validity : String?
    let package_name : String?
    let price : String?
    let ads_number : Int?
    let conference_workshop : Int?
    let inquiries : Int?
    let reporting : Int?
    let verification : Int?
    let marketing : Int?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case package_id = "package_id"
        case showcase_products = "showcase_products"
        case sub_accounts = "sub_accounts"
        case account_validity = "account_validity"
        case package_name = "package_name"
        case price = "price"
        case ads_number = "ads_number"
        case conference_workshop = "conference_workshop"
        case inquiries = "inquiries"
        case reporting = "reporting"
        case verification = "verification"
        case marketing = "marketing"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        package_id = try values.decodeIfPresent(Int.self, forKey: .package_id)
        showcase_products = try values.decodeIfPresent(String.self, forKey: .showcase_products)
        sub_accounts = try values.decodeIfPresent(String.self, forKey: .sub_accounts)
        account_validity = try values.decodeIfPresent(String.self, forKey: .account_validity)
        package_name = try values.decodeIfPresent(String.self, forKey: .package_name)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        ads_number = try values.decodeIfPresent(Int.self, forKey: .ads_number)
        conference_workshop = try values.decodeIfPresent(Int.self, forKey: .conference_workshop)
        inquiries = try values.decodeIfPresent(Int.self, forKey: .inquiries)
        reporting = try values.decodeIfPresent(Int.self, forKey: .reporting)
        verification = try values.decodeIfPresent(Int.self, forKey: .verification)
        marketing = try values.decodeIfPresent(Int.self, forKey: .marketing)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}

struct Images : Codable {
    let gallery_id : Int?
    let product_id : Int?
    let file_path : String?
    let file_status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case gallery_id = "gallery_id"
        case product_id = "product_id"
        case file_path = "file_path"
        case file_status = "file_status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        gallery_id = try values.decodeIfPresent(Int.self, forKey: .gallery_id)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        file_path = try values.decodeIfPresent(String.self, forKey: .file_path)
        file_status = try values.decodeIfPresent(Int.self, forKey: .file_status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}

struct Feature : Codable {
    let feature_id : Int?
    let product_id : Int?
    let feature_title_en : String?
    let feature_title_urdu : String?
    let feature_desc_en : String?
    let feature_desc_urdu : String?
    let feature_status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case feature_id = "feature_id"
        case product_id = "product_id"
        case feature_title_en = "feature_title_en"
        case feature_title_urdu = "feature_title_urdu"
        case feature_desc_en = "feature_desc_en"
        case feature_desc_urdu = "feature_desc_urdu"
        case feature_status = "feature_status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        feature_id = try values.decodeIfPresent(Int.self, forKey: .feature_id)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        feature_title_en = try values.decodeIfPresent(String.self, forKey: .feature_title_en)
        feature_title_urdu = try values.decodeIfPresent(String.self, forKey: .feature_title_urdu)
        feature_desc_en = try values.decodeIfPresent(String.self, forKey: .feature_desc_en)
        feature_desc_urdu = try values.decodeIfPresent(String.self, forKey: .feature_desc_urdu)
        feature_status = try values.decodeIfPresent(Int.self, forKey: .feature_status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}

struct SubCateProductsData : Codable {
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

struct Ad : Codable {
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
