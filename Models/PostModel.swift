//
//  PostModel.swift
//  GSDA
//
//  Created by Joriah Lasater on 2/4/19.
//  Copyright © 2019 Cearley-Programs. All rights reserved.
//

import Foundation

struct PostModel: Codable {
    var title: String
    var description: String
    var timestamp: Int
    var photo_url: String?
    var video_url: String?
}
