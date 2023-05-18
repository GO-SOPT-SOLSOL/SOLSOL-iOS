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
    
    private let myAccountBackGround = UIView()
    private let myAccountLabel = UILabel()
    private let entireButton = SOLFilledButton(backgroundColor: .clear,
                                                        text: "전체보기",
                                                        textColor: .blue500,
                                                        image: ImageLiterals.Home.icArrowRightBlue,
                                                        imagePlacement: .trailing,
                                                        imagePadding: 7,
                                                        font: .font(.subhead2),
                                                        cornerRadius: 0)
    
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
            $0.font = .font(.subhead3)
        }
        
        separatorInset.left = 0
        selectionStyle = .none
        backgroundColor = .gray100
    }
    
    func setLayout() {
        contentView.addSubview(myAccountBackGround)
        myAccountBackGround.addSubviews(myAccountLabel,
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
        
        entireButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }

}
