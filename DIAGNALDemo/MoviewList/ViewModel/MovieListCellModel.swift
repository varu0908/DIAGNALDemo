//
//  MovieListCellModel.swift
//  DIAGNALDemo
//
//  Created by Varsha Verma on 06/04/24.
//

import Foundation

/* MovieListCellModel if user for MovieListCell*/
struct MovieListCellModel{
    var contect : Content
    
    var name : String{
        contect.name ?? ""
    }
    
    var image : String{
        contect.posterImage ?? ""
    }
}
