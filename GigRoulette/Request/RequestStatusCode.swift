//
//  RequestStatusCode.swift
//  ResponsibileArchitectureForTesting
//
//  Created by J.Albert - the best on 08/06/2017.
//  Copyright © 2017 J.Albert - the best. All rights reserved.
//

import Foundation

enum RequestStatusCode: Int {
    case ok = 200
    case badRequest = 400
    case unauthorised = 401
    case paymentRequired = 402
    case forbidden = 403
    case notFound = 404
    case methodNotAllowed = 405
    case internalServerError = 500
    case notImplemented = 501
    case badGateway = 502
    case serviceUnavailable = 503
    case gatewayTimeout = 504
}
