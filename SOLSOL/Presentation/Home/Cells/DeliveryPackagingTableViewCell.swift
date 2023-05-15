//
//  DeliveryPackagingTableViewCell.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class DeliveryPackagingTableViewCell: UITableViewCell {
    
    private let backGround = UILabel()
    private let deliveryPackagingLabel = UILabel()
    private let orderLabel = UILabel()
    private let pullingImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {
        backGround.do {
            $0.backgroundColor = .white
            $0.makeCornerRound(radius: 13)
        }
        
        deliveryPackagingLabel.do {
            $0.text = "배달/포장"
            $0.textColor = .gray600
            $0.font = .OneShinhanMedium(ofSize: 14)
        }
        
        orderLabel.do {
            $0.text = "눈으로 즐기는 미식 주문"
            $0.textColor = .gray600
            $0.font = .OneShinhanMedium(ofSize: 12)
        }
        
        pullingImage.do {
            $0.image = ImageLiterals.Home.pullingLogo
        }
        
        separatorInset.left = 0
        selectionStyle = .none
        backgroundColor = .gray100
    }
    
    func setLayout() {
        contentView.addSubview(backGround)
        backGround.addSubviews(deliveryPackagingLabel,
                               orderLabel,
                               pullingImage)
        
        backGround.snp.makeConstraints {
            $0.height.equalTo(80)
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(18)
        }
        
        deliveryPackagingLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(18)
        }
        
        orderLabel.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview().inset(18)
        }
        
        pullingImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
        }
    }
}
