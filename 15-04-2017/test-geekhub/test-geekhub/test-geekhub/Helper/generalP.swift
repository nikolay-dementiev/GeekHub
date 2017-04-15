//
//  generalP.swift
//  test-geekhub
//
//  Created by Nikolay Dementiev on 15.04.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import Foundation
import UIKit

struct generalP {
    static func getRandomHeihgt() -> Int {
        return Int(arc4random_uniform(40))
    }
}
