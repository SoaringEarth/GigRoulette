//
//  APIURLRequestDispatcher.swift
//  ResponsibileArchitectureForTesting
//
//  Created by J.Albert - the best on 08/06/2017.
//  Copyright © 2017 J.Albert - the best. All rights reserved.
//

import Foundation

class APIURLRequestDispatcher {
    
    static let sharedInstance = APIURLRequestDispatcher()
    
    // Sessions
    let defaultSession: URLSession = URLSession(configuration: .default)
    
    func dispatch(Request request: URLRequest, WithSuccess success: @escaping ([String:Any])->(), AndFailure failure: @escaping (LSError)->()) {

        defaultSession.dataTask(with: request) { (responseData, responseURL, responseError) in
            if responseError != nil {
                print("APIURLRequestDispatcher - dispatch - responseError: \(String(describing: responseError?.localizedDescription))")
                guard let localError = responseError?.localizedDescription else { return }
                let error: LSError = LSError(title: "Server Error", localisedDescription: localError, errorCode: 0, statusCode: .internalServerError)
                failure(error)
            } else {
                do {
                    let serializedData = try JSONSerialization.jsonObject(with: responseData!, options:.allowFragments) as! [String : AnyObject]
                    print("APIURLRequestDispatcher - dispatch - serializedData")
                    success(serializedData)
                } catch {
                    print("Failed to serialize responseData to [String : AnyObject]")
                    let error: LSError = LSError(title: "Failed to Serialize Response", localisedDescription: "Returned data was in an incorrect format", errorCode: 0, statusCode: .internalServerError)
                    failure(error)
                }
            }
        }.resume()
    }    
}
