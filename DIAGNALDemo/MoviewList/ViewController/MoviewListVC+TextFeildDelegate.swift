//
//  MoviewListVC+TextFeildDelegate.swift
//  DIAGNALDemo
//
//  Created by Varsha Verma on 11/04/24.
//

import UIKit

//MARK: - UITextFieldDelegate

extension MoviewListVC : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == ""{
            return true
        }
        if textField.text?.count ?? 0 > 39{
            return false
        }
        return true
    }
}
