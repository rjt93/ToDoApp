//
//  Singleton.swift
//  ToDoApp
//
//  Created by Rajat on 04/05/19.
//  Copyright © 2019 Rajat. All rights reserved.
//

import Foundation

class Singleton {

    var taskListArr = [ToDoModal]()
    // Creating singleton object
    static let shared = Singleton()
    //Initializer access level change now
    private init() {}
}
