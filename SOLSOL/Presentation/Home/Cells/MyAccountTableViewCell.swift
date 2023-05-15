//
//  MyAccountTableViewCell.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class MyAccountTableViewCell: UITableViewCell {
    
    private let myAccountBackGround = UILabel()
    private let myAccountLabel = UILabel()
    private let entireLabel = UILabel()
    private let entireButton = UIButton()
    
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
        myAccountBackGround.do {
            $0.backgroundColor = .white
            $0.makeCornerRound(radius: 13)
        }
        
        myAccountLabel.do {
            $0.text = "내 계좌"
            $0.textColor = .gray600
            $0.font = .OneShinhanMedium(ofSize: 14)
        }
        
        entireLabel.do {
            $0.text = "전체보기"
            $0.textColor = .blue500
            $0.font = .OneShinhanMedium(ofSize: 13)
        }
        
        entireButton.do {
            $0.setImage(ImageLiterals.Home.icArrowRightBlue, for: .normal)
        }
        
        separatorInset.left = 0
        selectionStyle = .none
        backgroundColor = .gray100
    }
    
    func setLayout() {
        contentView.addSubview(myAccountBackGround)
        myAccountBackGround.addSubviews(myAccountLabel,
                                        entireLabel,
                                        entireButton)
        
        myAccountBackGround.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(18)
        }
        
        myAccountLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(18)
        }
        
        entireLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(40)
        }
        
        entireButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
        }
    }

}
