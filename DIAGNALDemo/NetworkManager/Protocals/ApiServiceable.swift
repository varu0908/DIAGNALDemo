//
//  ApiServiceable.swift
//  DIAGNALDemo
//
//  Created by Varsha Verma on 06/04/24.
//

import Foundation

/*ApiServiceable protocal provide the all methods such as get and post*/
protocol ApiServiceable{
    
    typealias ResponseResult = (_ data : Data?,_ error : Error?)->Void
    // GET api 
    func hitGetApi(request: URL?, response : @escaping ResponseResult)
    
}
