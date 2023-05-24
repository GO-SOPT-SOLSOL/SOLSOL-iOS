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
    
    private let changeHomeButton = SOLFilledButton(backgroundColor: .gray150,
                                                   text: "홈화면 변경" ,
                                                   textColor: .gray400,
                                                   image: ImageLiterals.Home.icChange,
                                                   imagePlacement: .leading,
                                                   imagePadding: 6,
                                                   font: .font(.body2),
                                                   cornerRadius: 20)
    private let shakeButton = SOLFilledButton(backgroundColor: .gray150,
                                              text: "흔들기설정",
                                              textColor: .gray400,
                                              image: ImageLiterals.Home.icShaking,
                                              imagePlacement: .leading,
                                              imagePadding: 6,
                                              font: .font(.body2),
                                              cornerRadius: 20)
    private let easyHomeButton = SOLFilledButton(backgroundColor: .gray150,
                                                 text: "쉬운 홈",
                                                 textColor: .gray400,
                                                 image: ImageLiterals.Home.icEasyhome,
                                                 imagePlacement: .leading,
                                                 imagePadding: 6,
                                                 font: .font(.body2),
                                                 cornerRadius: 20)
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - UI Components
    
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
            $0.trailing.equalToSuperview().inset(252)
            $0.height.equalTo(40)
        }
        
        shakeButton.snp.makeConstraints {
            $0.centerY.equalTo(changeHomeButton.snp.centerY)
            $0.leading.equalToSuperview().inset(147)
            $0.trailing.equalToSuperview().inset(126)
            $0.height.equalTo(40)
        }
        
        easyHomeButton.snp.makeConstraints {
            $0.centerY.equalTo(changeHomeButton.snp.centerY)
            $0.leading.equalToSuperview().inset(273)
            $0.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(40)
        }
        
    }
}
