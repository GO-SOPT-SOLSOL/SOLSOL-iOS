//
//  EightItemsTableViewCell.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class EightItemsTableViewCell: UITableViewCell {
    
    private let itemHighStackView = UIStackView()
    private let itemLowStackView = UIStackView()
    private let itemAllStackView = UIStackView()
    
    private let itemOne = UILabel()
    private let itemTwo = UILabel()
    private let itemThree = UILabel()
    private let itemFour = UILabel()
    private let itemFive = UILabel()
    private let itemSix = UILabel()
    private let itemSeven = UILabel()
    private let itemEight = UILabel()


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
        
        itemOne.do {
            $0.backgroundColor = .white
            $0.makeCornerRound(radius: 13)
        }
        itemTwo.do {
            $0.backgroundColor = .white
            $0.makeCornerRound(radius: 13)
        }
        itemThree.do {
            $0.backgroundColor = .white
            $0.makeCornerRound(radius: 13)
        }
        itemFour.do {
            $0.backgroundColor = .white
            $0.makeCornerRound(radius: 13)
        }
        itemFive.do {
            $0.backgroundColor = .white
            $0.makeCornerRound(radius: 13)
        }
        itemSix.do {
            $0.backgroundColor = .white
            $0.makeCornerRound(radius: 13)
        }
        itemSeven.do {
            $0.backgroundColor = .white
            $0.makeCornerRound(radius: 13)
        }
        itemEight.do {
            $0.backgroundColor = .white
            $0.makeCornerRound(radius: 13)
        }
        
        itemHighStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
            $0.alignment = .center
            $0.spacing = 9
        }
        
        itemLowStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
            $0.alignment = .center
            $0.spacing = 9
        }
        
        itemAllStackView.do {
            $0.axis = .vertical
            $0.distribution = .equalSpacing
            $0.alignment = .center
            $0.spacing = 9
        }
        
        separatorInset.left = 0
        selectionStyle = .none
        backgroundColor = .gray100
    }
    
    func setLayout() {
        contentView.addSubviews(itemAllStackView)
        
        [itemHighStackView, itemLowStackView]
            .forEach { itemAllStackView.addArrangedSubview($0) }
        
        [itemOne, itemTwo, itemThree, itemFour]
            .forEach { itemHighStackView.addArrangedSubview($0) }
        
        [itemFive, itemSix, itemSeven, itemEight]
            .forEach { itemLowStackView.addArrangedSubview($0) }
        
        itemOne.snp.makeConstraints {
            $0.size.equalTo(78)
        }
        itemTwo.snp.makeConstraints {
            $0.size.equalTo(78)
        }
        itemThree.snp.makeConstraints {
            $0.size.equalTo(78)
        }
        itemFour.snp.makeConstraints {
            $0.size.equalTo(78)
        }
        itemFive.snp.makeConstraints {
            $0.size.equalTo(78)
        }
        itemSix.snp.makeConstraints {
            $0.size.equalTo(78)
        }
        itemSeven.snp.makeConstraints {
            $0.size.equalTo(78)
        }
        itemEight.snp.makeConstraints {
            $0.size.equalTo(78)
        }
        
        itemHighStackView.snp.makeConstraints {
            $0.height.equalTo(78)
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        itemLowStackView.snp.makeConstraints {
            $0.height.equalTo(78)
            $0.top.equalToSuperview().inset(87)
            $0.leading.trailing.equalToSuperview()
        }
        
        itemAllStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(165)
        }
        
    }
}
