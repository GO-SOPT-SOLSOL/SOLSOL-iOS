//
//  TransferDetailView.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class TransferInfoView: UIView {

    private enum Size {
        static let myAccountBackgroundViewHeight = 36
    }

    private let receiverLabel = UILabel().then {
        $0.textColor = .gray600
        $0.font = .font(.subhead1)
        $0.text = "조정연님께"

    }

    private let receiverAccountLabel = UILabel().then {
        $0.textColor = .gray400
        $0.font = .font(.body4)
        $0.text = "카카오뱅크 3333153453969"
    }

    private let howMuchLabel = UILabel().then {
        $0.textColor = .gray600
        $0.text = StringLiterals.TransferDetail.howMuch
        $0.font = .font(.display6)
    }

    private let moneyLabel = UILabel().then {
        $0.text = "0 원"
        $0.textColor = .gray600
        $0.font = .font(.display5)
    }

    private let convenientMoneyLabel = UILabel().then {
        $0.text = "1만원"
        $0.textColor = .gray400
        $0.font = .font(.body5)
    }

    private let myAccountBackgroundView = UIView().then {
        $0.backgroundColor = .gray50
        $0.layer.cornerRadius = 16
    }

    private let myAccountLabel = UILabel().then {
        $0.textColor = .gray600
        $0.font = .font(.body1)
    }

    private let accountBalance = UILabel().then { 
        $0.textColor = .gray600
        $0.font = .font(.body3)
    }

    private let arrowImageView = UIImageView().then {
        $0.image = ImageLiterals.Common.icArrowRight
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        hierarchy()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension TransferInfoView {

    private func hierarchy() {
        self.addSubviews(receiverLabel,
                         receiverAccountLabel,
                         howMuchLabel,
                         moneyLabel,
                         convenientMoneyLabel,
                         myAccountBackgroundView
        )
        myAccountBackgroundView.addSubviews(myAccountLabel,
                                            accountBalance,
                                            arrowImageView
        )
    }
    
    private func setLayout() {
        receiverLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(18)
        }

        receiverAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(receiverLabel.snp.bottom).offset(8)
            make.leading.equalTo(receiverLabel)
        }

        howMuchLabel.snp.makeConstraints { make in
            make.top.equalTo(receiverAccountLabel.snp.bottom).offset(15)
            make.leading.equalTo(receiverLabel)
        }

        moneyLabel.snp.makeConstraints { make in
            make.top.equalTo(howMuchLabel.snp.bottom).offset(47)
            make.centerX.equalToSuperview()
        }

        convenientMoneyLabel.snp.makeConstraints { make in
            make.centerX.equalTo(moneyLabel)
            make.top.equalTo(moneyLabel.snp.bottom).offset(15)
        }

        myAccountBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(convenientMoneyLabel.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(18)
            make.height.equalTo(Size.myAccountBackgroundViewHeight)
        }

        myAccountLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(13)
        }

        accountBalance.snp.makeConstraints { make in
            make.centerY.equalTo(myAccountLabel)
            make.leading.equalTo(myAccountLabel.snp.trailing).offset(9)
        }

        arrowImageView.snp.makeConstraints { make in
            make.centerY.equalTo(myAccountLabel)
            make.trailing.equalToSuperview().inset(11)
        }
    }

}

extension TransferInfoView {
    func configureTransferInfoView(account: MyAccountViewModel) {
        myAccountLabel.text = "\(account.bank) \(account.myAccount)"
        accountBalance.text = "\(account.balance)원"
    }

    func updateMoneyDisplay(text: String) {
        moneyLabel.text = "\(text) 원"
    }
}
