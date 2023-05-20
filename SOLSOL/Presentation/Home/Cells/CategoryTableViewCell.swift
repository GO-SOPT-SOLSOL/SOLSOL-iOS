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
    
    private let itemCup = SOLFilledButton(backgroundColor: .white,
                                          text: Item.cup,
                                          textColor: .gray600,
                                          image: ImageLiterals.Home.returnCup,
                                          imagePlacement: .top,
                                          imagePadding: 6,
                                          font: .font(.body3),
                                          cornerRadius: 13)
    private let itemTips = SOLFilledButton(backgroundColor: .white,
                                           text: Item.tips,
                                           textColor: .gray600,
                                           image: ImageLiterals.Home.SOLTips,
                                           imagePlacement: .top,
                                           imagePadding: 6,
                                           font: .font(.body3),
                                           cornerRadius: 13)
    private let itemBank = SOLFilledButton(backgroundColor: .white,
                                           text: Item.storyBank,
                                           textColor: .gray600,
                                           image: ImageLiterals.Home.storyBank,
                                           imagePlacement: .top,
                                           imagePadding: 8,
                                           font: .font(.body3),
                                           cornerRadius: 13)
    private let itemWallet = SOLFilledButton(backgroundColor: .white,
                                             text: Item.wallet,
                                             textColor: .gray600,
                                             image: ImageLiterals.Home.SOLWallet,
                                             imagePlacement: .top,
                                             imagePadding: 6,
                                             font: .font(.body3),
                                             cornerRadius: 13)
    private let itemBaseBall = SOLFilledButton(backgroundColor: .white,
                                               text: Item.baseBall,
                                               textColor: .gray600,
                                               image: ImageLiterals.Home.SOLBaseball,
                                               imagePlacement: .top,
                                               imagePadding: 6,
                                               font: .font(.body3),
                                               cornerRadius: 13)
    private let itemCard = SOLFilledButton(backgroundColor: .white,
                                           text: Item.card,
                                           textColor: .gray600,
                                           image: ImageLiterals.Home.assignCard,
                                           imagePlacement: .top,
                                           imagePadding: 6,
                                           font: .font(.body3),
                                           cornerRadius: 13)
    private let itemStock = SOLFilledButton(backgroundColor: .white,
                                            text: Item.stock,
                                            textColor: .gray600,
                                            image: ImageLiterals.Home.currentStock,
                                            imagePlacement: .top,
                                            imagePadding: 6,
                                            font: .font(.body3),
                                            cornerRadius: 13)
    private let itemCertification = SOLFilledButton(backgroundColor: .white,
                                                    text: Item.certification,
                                                    textColor: .gray600,
                                                    image: ImageLiterals.Home.certification,
                                                    imagePlacement: .top,
                                                    imagePadding: 6,
                                                    font: .font(.body3),
                                                    cornerRadius: 13)

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
        
        itemStock.do {
            $0.titleLabel?.numberOfLines = 1
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
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        itemLowStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(87)
            $0.leading.trailing.equalToSuperview()
        }
        
        itemAllStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(18)
        }
        
    }
}
