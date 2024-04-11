//
//  ApiServices.swift
//  DIAGNALDemo
//
//  Created by Varsha Verma on 06/04/24.
//

import Foundation


/*ApiServices are utilized to override member functions and data members of ApiServiceable for the actual API*/
class ApiServices : ApiServiceable{
    
    /*Get Api*/
    func hitGetApi(request: URL?, response: @escaping ResponseResult) {
        // Write Code for Api calling.....
        
        guard let path =  request else{
            print("Bad Request.....")
            return
        }
        do {
            let data = try Data(contentsOf: path, options: .mappedIfSafe)
            response(data, nil)
        } catch {
            response( nil,error)
        }
    }
}
