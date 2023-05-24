//
//  AdvertisementTableViewCell.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/15.
//

import UIKit

final class AdvertisementTableViewCell: UITableViewCell {
    
    private let adAllView = UIView()
    private let adImage = UIImageView()
    private let adTitleLabel = UILabel()
    private let adContentLabel = UILabel()
    private let arrowRightButton = UIButton()
    
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
        
        adAllView.do {
            $0.backgroundColor = .beige
            $0.makeCornerRound(radius: 13)
        }
        
        adImage.do {
            $0.image = ImageLiterals.Home.adImage
        }
        
        adTitleLabel.do {
            $0.textColor = .gray400
            $0.font = .font(.body2)
        }
        
        adContentLabel.do {
            $0.textColor = .gray600
            $0.font = .font(.subhead2)
        }
        
        arrowRightButton.do {
            $0.setImage(ImageLiterals.Common.icArrowRight, for: .normal)
        }
        
        separatorInset.left = 0
        selectionStyle = .none
        backgroundColor = .gray100
        
    }
    
    func setLayout() {
        contentView.addSubview(adAllView)
        adAllView.addSubviews(adImage,
                               adTitleLabel,
                               adContentLabel,
                               arrowRightButton)
        
        adAllView.snp.makeConstraints {
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

    // MARK: - AdvertisementTableViewCell에 Data 뿌리기
    
    func configureCell(advertisement: Advertisement) {
        adTitleLabel.text = advertisement.title
        adContentLabel.text = advertisement.content
    }
}
