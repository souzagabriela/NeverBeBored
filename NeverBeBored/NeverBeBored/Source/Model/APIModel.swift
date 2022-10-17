//
//  API Model.swift
//  NeverBeBored
//
//  Created by Gabriela Souza Batista on 11/10/22.
//

import Foundation

struct BoredModel: Codable {
    let bored: BoredInfo?
    init(bored: BoredInfo?) {
        self.bored = bored
    }
}

struct BoredInfo: Codable {
    let activity: String
    let type: String
    let participants: Int
    let price: Float
    let link: String
    let accessibility: Float
    let key: String
    
    init(activity: String, type: String, participants: Int, price: Float, link: String, accessibility: Float, key: String) {
        self.activity = activity
        self.type = type
        self.participants = participants
        self.price = price
        self.link = link
        self.accessibility = accessibility
        self.key = key
    }
}
