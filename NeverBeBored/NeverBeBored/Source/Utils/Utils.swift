//
//  Utils.swift
//  NeverBeBored
//
//  Created by Gabriela Souza Batista on 13/10/22.
//

import Foundation
import UIKit

// MARK: - Structure to write a function to call the api and decode using codable (at model) in a generic way

struct Url {
    static let baseUrl = URL(string: "https://www.boredapi.com/api/activity")
}

func make<T: UIView>(_ uiView: T, _ configure: (T) -> Void) -> T {
    configure(uiView)
    return uiView
}
