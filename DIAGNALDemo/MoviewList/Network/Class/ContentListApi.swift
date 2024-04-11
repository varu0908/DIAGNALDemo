//
//  ContentListApi.swift
//  DIAGNALDemo
//
//  Created by Varsha Verma on 06/04/24.
//

import Foundation

/*Overrideing ContentListApiServiceble function */
class ContentListApi: ContentListApiServiceble{
    var serviceable: ApiServiceable
    var request : APIRequestUtility
    
    init(serviceable: ApiServiceable, request: APIRequestUtility) {
        self.serviceable = serviceable
        self.request = request
    }
    
    /*getContentList is use to featch the Content List*/
    func getContentList<T>(for: T.Type, page: Int, handler: @escaping (T?) -> Void) where T : Decodable, T : Encodable {
        
        guard let url =  request.featchContentListing(forPape: page) else{
            print("Invalid Request...")
            handler(nil)
            return
        }
        serviceable.hitGetApi(request: url) { data, error in
            guard let jsonData = data else{
                print("Data not found....")
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodeData = try decoder.decode(T.self, from: jsonData)
                handler(decodeData)
            }catch{
                print(error.localizedDescription)
                handler(nil)
            }
        }
    }
}
