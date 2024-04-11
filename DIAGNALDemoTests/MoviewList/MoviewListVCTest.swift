//
//  MoviewListVCTest.swift
//  DIAGNALDemoTests
//
//  Created by Varsha Verma on 06/04/24.
//

import XCTest
@testable import DIAGNALDemo

 class MoviewListVCTest: XCTestCase {
     
     var sut: MoviewListVC! // System Under Test
     var collectionView: UICollectionView!
     
     override func setUp() {
         super.setUp()
         sut = MoviewListVC() // Instantiate your view controller
         collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
         collectionView.dataSource = sut
         collectionView.delegate = sut
     }
     
     override func tearDown() {
         sut = nil
         collectionView = nil
         super.tearDown()
     }
     
     func testNumberOfItemsInSection() {
         // Assuming viewModel.allData has some mock data for testing
         sut.viewModel.allData = [Content(name: "The Birds", posterImage: "poster1.jpg"), Content(name: "The Birds", posterImage: "poster1.jpg"), Content(name: "The Birds", posterImage: "poster1.jpg")]
         let numberOfItems = sut.collectionView(collectionView, numberOfItemsInSection: 0)
         XCTAssertEqual(numberOfItems, 3, "Number of items should match the count of viewModel.allData")
     }
     
     // Add similar test functions for cellForItemAt and sizeForItemAt
     
     func testScrollViewDidScroll() {
         // Assuming viewModel.fetchListData(_:completion:) fetches mock data and increments page number
         let initialPage = sut.viewModel.page
         sut.collectionView.contentOffset = CGPoint(x: 0, y: sut.collectionView.contentSize.height - sut.collectionView.bounds.size.height + 1)
         sut.scrollViewDidScroll(sut.collectionView)
         XCTAssertEqual(sut.viewModel.page, initialPage + 1, "Page number should be incremented")
     }
     
     // Add more test cases as needed
 }
