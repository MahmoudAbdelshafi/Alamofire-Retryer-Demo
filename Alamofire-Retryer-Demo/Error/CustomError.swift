//
//  CustomError.swift
//  AFRetryRequest
//
//  Created by Mahmoud Abdelshafi on 16/10/2021.
//

import Foundation
enum CustomError: String, Error {
    case authorize = "Unable to authenticate user. An error occurred during authorization, please check your connection and try again."
    case unavailableServer = "Server is unavailable"
}
