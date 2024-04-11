//
//  APIRequest.swift
//  DIAGNALDemo
//
//  Created by Varsha Verma on 06/04/24.
//

import Foundation

/*APIRequest are utilized to override member functions and data members of APIRequestUtility for getting URL requests*/
class APIRequest : APIRequestUtility{
    
    /*Request for Content List*/
    func featchContentListing(forPape: Int) -> URL? {
        guard let url = Bundle.main.url(forResource: "\(forPape)", withExtension: "json") else{
            print("Invalid URL....")
            return nil
        }
        return url
    }
}
