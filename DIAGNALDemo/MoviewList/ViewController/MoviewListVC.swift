//
//  MoviewListVC.swift
//  DIAGNALDemo
//
//  Created by Varsha Verma on 06/04/24.
//

import UIKit

class MoviewListVC: UIViewController {
    //MARK: - @IBOutlet
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var lblNOdata: UILabel!
    @IBOutlet weak var txtSearch: UITextField!{
        didSet{
            txtSearch.isHidden = true
            txtSearch.delegate = self
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib.init(nibName: CellName, bundle: nil), forCellWithReuseIdentifier: CellName)
        }
    }
    
    
    //MARK: - Variable and Constent
    let CellName = "MovieCell"
    var viewModel : MovieListViewProtocal =  MovieListViewModel(contentListApiServiceble: ContentListApi(serviceable: ApiServices(), request: APIRequest()))
    
    //MARK: - Override UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        self.viewModel.fetchListData(page: 1) {
            self.collectionView.reloadData()
            self.indicator.stopAnimating()
        }
    }
    
    //MARK: - IBAction
    @IBAction func tapOnSearch(_ sender: UIButton) {
        self.txtSearch.isHidden = false
    }
    
   
    @IBAction func tapOnBack(_ sender: Any) {
        self.txtSearch.text = ""
        self.viewModel.search(searchText: "") { _ in
            self.collectionView.reloadData()
        }
        txtSearch.isHidden = true
    }
    
    @IBAction func textChnaged(_ sender: UITextField) {
        self.indicator.startAnimating()
        self.viewModel.search(searchText: sender.text ?? "") { _ in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.indicator.stopAnimating()
            }
       }
    }
}
