//
//  News.swift
//  DieWelt
//
//  Created by Student on 14.09.21.
//

import Foundation
struct News: Codable, Identifiable{
    let id, headline, subline, source, textmessage, published, image, categorie: String
}