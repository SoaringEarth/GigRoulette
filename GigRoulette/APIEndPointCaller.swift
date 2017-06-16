//
//  APIEndPointCaller.swift
//  ResponsibileArchitectureForTesting
//
//  Created by J.Albert - the best on 08/06/2017.
//  Copyright © 2017 J.Albert - the best. All rights reserved.
//

import Foundation

class APIEndPointCaller {
    
    static func getAPIOffers(WithSuccess success: @escaping ([String:Any])->(), withFailure failure: @escaping (LSError)->()) {
        let builtRequest = APIURLRequestBuilder().getAPIOfferRequest()
        APIURLRequestDispatcher.sharedInstance.dispatch(Request: builtRequest, WithSuccess: { (responseDictionary) in
            print("APIEndPointCaller - getAPIOffers - success")
            success(responseDictionary)
        }, AndFailure: { (error) in
            print("APIEndPointCaller - getAPIOffers - failure - \(error)")
            failure(error)
        })
    }
    
    static func authentifyDevice(WithSuccess success: @escaping ([String:Any])->(), withFailure failure: @escaping (LSError)->()) {
        let builtRequest = APIURLRequestBuilder().authentifyDevice()
        APIURLRequestDispatcher.sharedInstance.dispatch(Request: builtRequest, WithSuccess: { (responseDictionary) in
            print("APIEndPointCaller - authentifyDevice - success")
            success(responseDictionary)
        }, AndFailure: { (error) in
            print("APIEndPointCaller - authentifyDevice - failure - \(error)")
            failure(error)
        })
    }
}
