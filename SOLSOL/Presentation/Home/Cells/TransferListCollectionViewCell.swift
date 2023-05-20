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
    
    private let bankImage = UIImageView()
    private let name = UILabel()
    private let amount = UILabel()

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
        
        name.do {
            $0.textColor = .gray600
            $0.font = .font(.subhead2)
        }
        
        amount.do {
            $0.textColor = .grayWarm400
            $0.font = .font(.body1)
        }
    }
    
    func setLayout() {
        
        contentView.addSubview(transferListBackGround)
        
        transferListBackGround.addSubviews(bankImage,
                                           name,
                                           amount)
        
        transferListBackGround.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        bankImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(8)
        }
        
        name.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(37)
            $0.trailing.equalToSuperview().inset(6)
            $0.bottom.equalToSuperview().inset(21)
        }
        
        amount.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(37)
            $0.trailing.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().inset(8)
        }
    }
    
    func configureCell(_ transferList: TransferList) {
        bankImage.image = transferList.image
        name.text = transferList.name
        amount.text = transferList.money
    }
}
