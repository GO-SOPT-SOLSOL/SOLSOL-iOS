//
//  TransferCollectionViewCell.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class TransferCollectionViewCell: UICollectionViewCell {
    
    private let transferBackGround = UIView()

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
        transferBackGround.do {
            $0.backgroundColor = .white
            $0.makeCornerRound(radius: 13)
        }
    }
    
    func setLayout() {
        
        contentView.addSubviews(transferBackGround)
        
        transferBackGround.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
}


