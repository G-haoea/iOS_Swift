//
//  Todo.swift
//  Todos
//
//  Created by Grace Liu on 19/06/2020.
//  Copyright © 2020 Grace Liu. All rights reserved.
//

import Foundation


/// The struct is a easier pattern than class
/// Codable: This variable can be encoded and decoded
struct Todo : Codable{
    var text = ""
    var check = false
   
}
