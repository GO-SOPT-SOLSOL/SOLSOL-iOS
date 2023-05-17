//
//  TransferListCollectionViewCell.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/18.
//

import UIKit

import SnapKit
import Then

final class TransferListCollectionViewCell: UICollectionViewCell {
    
    private let transferListBackGround = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        transferListBackGround.do {
            $0.backgroundColor = .gray50
            $0.makeCornerRound(radius: 6)
        }
    }
    
    func setLayout() {
        
        contentView.addSubview(transferListBackGround)
        
        transferListBackGround.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
