//
//  ShinhanPlusTableViewCell.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class ShinhanPlusTableViewCell: UITableViewCell {

    private let backGround = UIView()
    private let shinPlusButton = UIButton()
    private let cardButton = UIButton()
    private let stockButton = UIButton()
    private let insuranceButton = UIButton()

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
        
        shinPlusButton.do {
            $0.backgroundColor = .shinhanPlusBackgroundColor
            $0.makeCornerRound(radius: 14)
        }
        
        cardButton.do {
            $0.backgroundColor = .cardBackGroundColor
            $0.makeCornerRound(radius: 14)
        }
        
        stockButton.do {
            $0.backgroundColor = .stockBackGroundColor
            $0.makeCornerRound(radius: 14)
        }
        
        insuranceButton.do {
            $0.backgroundColor = .insuranceBackGroundColor
            $0.makeCornerRound(radius: 14)
        }
        
        separatorInset.left = 0
        selectionStyle = .none
        backgroundColor = .gray100
    }
    
    func setLayout() {
        contentView.addSubview(backGround)
        backGround.addSubviews(shinPlusButton,
                               cardButton,
                               stockButton,
                               insuranceButton)
        
        backGround.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(18)
        }
        
        shinPlusButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(18)
            $0.trailing.equalToSuperview().inset(215)
            $0.height.equalTo(28)
        }
        
        cardButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(shinPlusButton.snp.trailing).offset(14)
            $0.trailing.equalToSuperview().inset(148)
            $0.height.equalTo(28)
        }
        
        stockButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(cardButton.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().inset(83)
            $0.height.equalTo(28)
        }
        
        insuranceButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(stockButton.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(28)
        }
    }
    
}
