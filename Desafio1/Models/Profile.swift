//
//  Profile.swift
//  Desafio1
//
//  Created by unicred on 26/12/22.
//

import UIKit

class Profile: NSObject {
    var id: Int?
    var name: String?
    
    init(id: Int? = 0, name: String?) {
        self.id = id
        self.name = name
    }
}
