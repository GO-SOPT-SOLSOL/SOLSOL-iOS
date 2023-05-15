//
//  FooterButtonTableViewCell.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class FooterButtonTableViewCell: UITableViewCell {
    
    private let changeHomeButton = UIButton()
    private let shakeButton = UIButton()
    private let easyHomeButton = UIButton()

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
        changeHomeButton.do {
            $0.backgroundColor = .gray150
            $0.makeCornerRound(radius: 20)
        }
        
        shakeButton.do {
            $0.backgroundColor = .gray150
            $0.makeCornerRound(radius: 20)
        }
        
        easyHomeButton.do {
            $0.backgroundColor = .gray150
            $0.makeCornerRound(radius: 20)
        }
        
        separatorInset.left = 0
        selectionStyle = .none
        backgroundColor = .gray100
    }
    
    func setLayout() {
        contentView.addSubviews(changeHomeButton,
                                shakeButton,
                                easyHomeButton)
        
        changeHomeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(60)
            $0.leading.equalToSuperview().inset(18)
            $0.width.equalTo(105)
            $0.height.equalTo(40)
        }
        
        shakeButton.snp.makeConstraints {
            $0.centerY.equalTo(changeHomeButton.snp.centerY)
            $0.leading.equalToSuperview().inset(157)
            $0.width.equalTo(102)
            $0.height.equalTo(40)
        }
        
        easyHomeButton.snp.makeConstraints {
            $0.centerY.equalTo(changeHomeButton.snp.centerY)
            $0.trailing.equalToSuperview().inset(18)
            $0.width.equalTo(84)
            $0.height.equalTo(40)
        }
        
    }
}
