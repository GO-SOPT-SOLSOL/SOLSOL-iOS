//
//  AdvertisementTableViewCell.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/15.
//

import UIKit

final class AdvertisementTableViewCell: UITableViewCell {
    
    private let adAllLabel = UILabel()
    private let adImage = UIImageView()
    private let adTitleLabel = UILabel()
    private let adContentLabel = UILabel()
    private let arrowRightButton = UIButton()
    
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
        
        adAllLabel.do {
            $0.backgroundColor = .adColor
            $0.makeCornerRound(radius: 13)
        }
        
        adImage.do {
            $0.image = ImageLiterals.Home.adImage
        }
        
        adTitleLabel.do {
            $0.text = "평소 입는 옷으로 꾸꾸 하객룩 완성?"
            $0.textColor = .gray400
            $0.font = .OneShinhanLight(ofSize: 11)
        }
        
        adContentLabel.do {
            $0.text = "결혼식에 입기 좋은 남녀 코디법"
            $0.textColor = .gray600
            $0.font = .OneShinhanMedium(ofSize: 13)
        }
        
        arrowRightButton.do {
            $0.setImage(ImageLiterals.Common.icArrowRight, for: .normal)
        }
        
        separatorInset.left = 0
        selectionStyle = .none
        backgroundColor = .gray100
        
    }
    
    func setLayout() {
        contentView.addSubview(adAllLabel)
        adAllLabel.addSubviews(adImage,
                               adTitleLabel,
                               adContentLabel,
                               arrowRightButton)
        
        adAllLabel.snp.makeConstraints {
            $0.height.equalTo(58)
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(18)
        }
        
        adImage.snp.makeConstraints {
            $0.size.equalTo(36)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(18)
        }
        
        adTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(adImage.snp.trailing).offset(15)
            $0.top.equalTo(adImage.snp.top)
        }
        
        adContentLabel.snp.makeConstraints {
            $0.leading.equalTo(adTitleLabel.snp.leading)
            $0.top.equalTo(adTitleLabel.snp.bottom).offset(2)
        }
        
        arrowRightButton.snp.makeConstraints {
            $0.size.equalTo(14)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
        }
    }
}
