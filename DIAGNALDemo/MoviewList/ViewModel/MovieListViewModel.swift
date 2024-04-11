//
//  MovieListViewModel.swift
//  DIAGNALDemo
//
//  Created by Varsha Verma on 06/04/24.
//

import Foundation

/* MovieListViewModel override function and variable of MovieListViewProtocal*/
class MovieListViewModel : MovieListViewProtocal {
       
    var searchData: [Content] = []
    
    var workItem : DispatchWorkItem?
    let queue = DispatchQueue.global()
    
    
    func search(searchText: String, handler: @escaping (Bool) -> Void) {
        print(searchText + " Searching .......")
        workItem?.cancel()
        if searchText == ""{
            self.searchData = self.allData
            handler(true)
        }else{
            workItem = DispatchWorkItem(block: {
                self.searchData = searchText == "" ? self.allData : self.allData.filter({ content in
                    return (content.name ?? "").lowercased().contains(searchText.lowercased())
                })
                handler(true)
            })
            DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1), execute: workItem!)
        }
    }
    
    var contentListApiServiceble: ContentListApiServiceble
    
    var page: Int = 0
    var allData: [Content] = []
    var isPageRefreshing = false
    
    init(contentListApiServiceble: ContentListApiServiceble) {
        self.contentListApiServiceble = contentListApiServiceble
    }
    
    func fetchListData(page : Int, handler: @escaping () -> Void) {
        self.page = page
        self.isPageRefreshing = true
        contentListApiServiceble.getContentList(for: ContentListing.self, page: page) { contentListing in
            self.isPageRefreshing = false
            let content = contentListing?.page.contentItems.content ?? []
            if page == 1 {
                self.allData = content
            }else{
                self.allData.append(contentsOf: content)
            }
            self.searchData = self.allData
            handler()
        }
    }
 
    func getContectForIndex(index: Int) -> MovieListCellModel? {
        if index >= searchData.count{
            return nil
        }
        return MovieListCellModel(contect: self.searchData[index])
    }
}
