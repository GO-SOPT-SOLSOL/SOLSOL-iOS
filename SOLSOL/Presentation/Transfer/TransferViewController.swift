//
//  TransferViewController.swift
//  SOLSOL
//
//  Created by 곽성준 on 2023/05/16.
//

import UIKit

class TransferViewController: UIViewController {
    
    private lazy var navigationBar = SOLNavigationBar(self, leftItem: .back)
    let originView = TransferView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        
    }
    
    override func loadView() {
        self.view = originView
    }
    
    private func setStyle(){
        view.addSubview(navigationBar)
    }
    
    private func setLayout(){
        navigationBar.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.height.equalTo(44)
            $0.width.equalTo(375)
            
        }
    }
    
    //화면 터치 시 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
        
    }

}
