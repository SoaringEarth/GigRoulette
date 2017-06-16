//
//  RequestBody.swift
//  ResponsibileArchitectureForTesting
//
//  Created by J.Albert - the best on 08/06/2017.
//  Copyright © 2017 J.Albert - the best. All rights reserved.
//

import Foundation

struct RequestBody {
    let parameters: [String: Any]
    
    func getFormattedBody(WithMethod method: RequestMethod) -> String {
        var formattedBody: String = ""
        switch method {
        case .get:
            formattedBody = "?"
            for parameter in parameters {
                print(parameter)
                formattedBody += "\(parameter.key)=\(format(ParameterForGetRequest: parameter.value, ForExistingFormattedString: formattedBody))"
                formattedBody += "&"
            }
        case .post:
            for parameter in parameters {
                formattedBody += "\(parameter.key)=\(format(ParameterForGetRequest: parameter.value, ForExistingFormattedString: formattedBody))"
            }
        default:
            break
        }
        print("RequestBody - getFormattedBody - formattedBody: \(formattedBody)")
        return formattedBody
    }
    
    /*w
     handle String, any numbers, Bools, Array (of what?), Dictionary (of what?)
     */
    private func format(ParameterForGetRequest parameter: Any, ForExistingFormattedString formattedString: String) -> String {
        var tempFormattedString = ""
        if parameter is String || parameter is Int || parameter is Double || parameter is Float || parameter is Bool {
            tempFormattedString += "\(parameter as AnyObject)"
            return tempFormattedString
        } else if parameter is Array<Any> {
            for secondLevelParameter in (parameter as! Array<Any>) {
                tempFormattedString += format(ParameterForGetRequest: secondLevelParameter, ForExistingFormattedString: tempFormattedString)
            }
            return tempFormattedString
        } else if parameter is Dictionary<String, Any> {
            
            // Recursive function
            
        } else {
            return tempFormattedString
        }
        return tempFormattedString
    }
    
    private func format(ParameterForPostRequest parameter: Any) -> String {
        var tempFormattedString = ""
        if parameter is String || parameter is Int || parameter is Double || parameter is Float || parameter is Bool {
            tempFormattedString += "\(parameter as AnyObject)"
            return tempFormattedString
        } else if parameter is Array<Any> {
            for secondLevelParameter in (parameter as! Array<Any>) {
                tempFormattedString += format(ParameterForGetRequest: secondLevelParameter, ForExistingFormattedString: tempFormattedString)
            }
            return tempFormattedString
        } else if parameter is Dictionary<String, Any> {
            
            // Recursive function
            
        } else {
            return tempFormattedString
        }
        return tempFormattedString
    }
}
