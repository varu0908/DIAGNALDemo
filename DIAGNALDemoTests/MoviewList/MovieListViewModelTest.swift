//
//  MovieListViewModelTest.swift
//  DIAGNALDemoTests
//
//  Created by Varsha Verma on 06/04/24.
//

import XCTest
@testable import DIAGNALDemo

 class MovieListViewModelTest: XCTestCase {

    var model: MovieListViewProtocal?
    
    override func setUp() {
        model = MovieListViewModel(contentListApiServiceble: ContentListApi(serviceable: ApiServices(), request: APIRequest()))
    }
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testFetchListData() throws {
        model?.fetchListData(page: 1, handler: {
            XCTAssertEqual(self.model?.allData.first?.name ?? "", "The Birds")
        })
        
        model?.fetchListData(page: 4, handler: {
            XCTAssertEqual(self.model?.allData.first?.name ?? "", "The Birds")
        })
        
    }
     
     func testgetContectForIndex() throws{
         model?.fetchListData(page: 1, handler: {
             let cellModel  = self.model?.getContectForIndex(index: 0)
             XCTAssertEqual(cellModel?.name, "The Birds")
         })
     }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
