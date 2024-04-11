//
//  ContentListApiServiceble.swift
//  DIAGNALDemo
//
//  Created by Varsha Verma on 06/04/24.
//

import Foundation

/*ContentListApiServiceble is provide the networking method for Content List*/
protocol ContentListApiServiceble {
    
    var serviceable : ApiServiceable { get set }
    
    func getContentList<T:Codable>(for : T.Type,page : Int ,handler : @escaping (T?)->Void) ->Void
}
