//
//  MovieListViewProtocal.swift
//  DIAGNALDemo
//
//  Created by Varsha Verma on 06/04/24.
//

import Foundation

/* MovieListViewProtocal protocol provide MovieListView's function and variable*/
protocol MovieListViewProtocal{
    var contentListApiServiceble : ContentListApiServiceble {get set}
    var page : Int {get set}
    var allData : [Content] {get set}
    var searchData : [Content] {get set}
    
    var isPageRefreshing  : Bool {get set}
    func fetchListData(page : Int, handler : @escaping ()->Void)
    func getContectForIndex(index : Int)->MovieListCellModel?
    func search(searchText : String,handler : @escaping (Bool)->Void)
}
