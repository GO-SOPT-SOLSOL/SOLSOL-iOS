//
//  TransferViewController.swift
//  SOLSOL
//
//  Created by 곽성준 on 2023/05/16.
//

import UIKit

class TransferViewController: UIViewController {
    
    private let originView = TransferView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = originView
    }


}
