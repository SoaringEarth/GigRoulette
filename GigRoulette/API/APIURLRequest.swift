//
//  APIURLRequest.swift
//  ResponsibileArchitectureForTesting
//
//  Created by J.Albert - the best on 08/06/2017.
//  Copyright © 2017 J.Albert - the best. All rights reserved.
//

import Foundation

struct APIURLRequest {
    var urlRequest: URLRequest

    init(WithRequestURL requestURL: RequestURL, RequestMethod requestMethod: RequestMethod, RequestBody requestBody: RequestBody) {
        print("APIURLRequest - Init")
        if requestMethod == .post {
            self.urlRequest = URLRequest(url: requestURL.getFullURLWithDeviceAndAppID())
            self.urlRequest.httpBody = requestBody.getFormattedBody(WithMethod: requestMethod).data(using: .utf8)
            self.urlRequest.httpMethod = requestMethod.rawValue
        } else if requestMethod == .get {
            self.urlRequest = URLRequest(url: requestURL.getFullURLWithDeviceAndAppID(WithParameterString: requestBody.getFormattedBody(WithMethod: requestMethod)))
            self.urlRequest.httpMethod = requestMethod.rawValue
        } else {
            self.urlRequest = URLRequest(url: requestURL.getFullURLWithDeviceAndAppID())
            self.urlRequest.httpMethod = requestMethod.rawValue
        }
    }
}
