//
//  EightItemsTableViewCell.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class CategoryTableViewCell: UITableViewCell {
    
    private let itemHighStackView = UIStackView()
    private let itemLowStackView = UIStackView()
    private let itemAllStackView = UIStackView()
    
    private lazy var items: [UIButton] = []
    
    private let itemCup = UIButton()
    private let itemTips = UIButton()
    private let itemBank = UIButton()
    private let itemWallet = UIButton()
    private let itemBaseBall = UIButton()
    private let itemCard = UIButton()
    private let itemStock = UIButton()
    private let itemCertification = UIButton()

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
        items = [
        itemCup,
        itemTips,
        itemBank,
        itemWallet,
        itemBaseBall,
        itemCard,
        itemStock,
        itemCertification]
        
        for item in items {
            item.do {
                $0.backgroundColor = .white
                $0.makeCornerRound(radius: 13)
            }
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
        
        [itemCup, itemTips, itemBank, itemWallet]
            .forEach { itemHighStackView.addArrangedSubview($0) }
        
        [itemBaseBall, itemCard, itemStock, itemCertification]
            .forEach { itemLowStackView.addArrangedSubview($0) }
        
        for item in items {
            item.snp.makeConstraints {
                $0.size.equalTo(78)
            }
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
