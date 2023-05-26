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

    let receiverLabel = UILabel().then {
        $0.textColor = .gray600
        $0.font = .font(.subhead1)
    }

    let receiverAccountLabel = UILabel().then {
        $0.textColor = .gray400
        $0.font = .font(.body4)
    }

    private let howMuchLabel = UILabel().then {
        $0.textColor = .gray600
        $0.text = StringLiterals.TransferDetail.howMuch
        $0.font = .font(.display6)
    }

    let moneyLabel = UILabel().then {
        $0.text = "금액을 입력하세요"
        $0.font = .font(.display6Light)
        $0.textColor = .gray200
    }

    private let convenientMoneyLabel = UILabel().then {
        $0.text = StringLiterals.TransferDetail.emptyMoneyUnderLabelText
        $0.textColor = .gray400
        $0.font = .font(.body5)
        $0.isHidden = true
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
            make.top.equalTo(convenientMoneyLabel.snp.bottom).offset(30).priority(.low)
            make.leading.trailing.equalToSuperview().inset(18)
            make.height.equalTo(Size.myAccountBackgroundViewHeight)
            make.bottom.equalToSuperview()
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
    func configureTransferInfoView(model: TransferDetailModel) {
        receiverLabel.text = "\(model.receiver.receiverName)님께"
        receiverAccountLabel.text = "\(model.receiver.receiverBank.description) \(model.receiver.receiverAccount)"
        myAccountLabel.text = "\(model.sender.bank.description) \(model.sender.account)"
        accountBalance.text = "\(model.sender.balance.currencyAmountToString())원"

        guard let price = model.price,
              !price.isEmpty
        else {
            moneyLabel.text = "금액을 입력하세요"
            return
        }
        setConfirmViewLabel(price: price)
    }

    private func setConfirmViewLabel(price: String) {
        moneyLabel.text = "\(price)원"
        moneyLabel.font = .font(.display5)
        moneyLabel.textColor = .gray600
        convenientMoneyLabel.isHidden = false
        convenientMoneyLabel.text = "보낼까요?"
        howMuchLabel.isHidden = true

        moneyLabel.snp.remakeConstraints { make in
            make.top.equalTo(receiverAccountLabel.snp.bottom).offset(57)
            make.centerX.equalToSuperview()
        }
    }
    
    func updateMoneyDisplay(text: String) {
        guard text != "0" else {
            moneyLabel.text = "금액을 입력하세요"
            moneyLabel.font = .font(.display6Light)
            moneyLabel.textColor = .gray200
            convenientMoneyLabel.isHidden = true
            return
        }
        moneyLabel.textColor = .gray600
        moneyLabel.font = .font(.display5)
        moneyLabel.text = "\(text) 원"
        convenientMoneyLabel.isHidden = false
    }

    func updateConvenientLabel(text: String) {
        convenientMoneyLabel.text = text
    }
}
