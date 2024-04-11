//
//  MoviewListVC+UICollectionViewDelegate.swift
//  DIAGNALDemo
//
//  Created by Varsha Verma on 06/04/24.
//

import UIKit

//MARK: - UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
extension MoviewListVC  :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.lblNOdata.isHidden = self.viewModel.searchData.count > 0
        return self.viewModel.searchData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellName, for: indexPath) as! MovieCell
        let cellModel = viewModel.getContectForIndex(index: indexPath.row)
        cell.lbl.text = cellModel?.name
        cell.img.image = UIImage(named : cellModel?.image ?? "") ?? UIImage(named: "placeholder")
        return cell        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width)/3 - 10
        return CGSize(width: width, height: width*170/115)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.txtSearch.text != ""{
            return
        }
        if(self.collectionView.contentOffset.y >= (self.collectionView.contentSize.height - self.collectionView.bounds.size.height)) {
            if !viewModel.isPageRefreshing {
                self.indicator.startAnimating()
                self.viewModel.fetchListData(page: self.viewModel.page + 1) {
                    self.collectionView.reloadData()
                    self.indicator.stopAnimating()
                }
            }
        }
    }
}

