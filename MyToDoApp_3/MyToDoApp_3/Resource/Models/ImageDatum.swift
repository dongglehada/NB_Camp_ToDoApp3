//
//  dogApiModel.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/15.
//

import Foundation

// MARK: - ImageDatum
struct ImageDatum: Codable {
    let id: String
    let url: String
    let width, height: Int
}

typealias ImageData = [ImageDatum]
