//
//  AccesToken.swift
//  AuthAsyncImage
//
//  Created and maintained by Bereyziat Development on 29/06/2023.
//

import Foundation

public struct AccessToken {
    var token: String
    var type: String
    
    var headerString: String { "\(self.type) \(self.token)" }
    
    public init(token: String, type: String) {
        self.token = token
        self.type = type
    }
}
