//
//  TransferView.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

class TransferView: UIView {
    
    // Mark -- Properties
    
    private let sendToWhoLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setStyle()
        hierarchy()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setStyle(){
        
        self.backgroundColor = .white
        
        sendToWhoLabel.do{
            
            $0.text = "누구에게 보낼까요?"
            $0.font = .OneShinhanMedium(ofSize: 22)
            
        }
        
    }
    
    func hierarchy(){
        
        self.addSubview(sendToWhoLabel)
        
    }

    
    func setLayout(){
        
        sendToWhoLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(18)
            $0.top.equalToSuperview().inset(99)
        }
        
        
        
    }
    
    
}
