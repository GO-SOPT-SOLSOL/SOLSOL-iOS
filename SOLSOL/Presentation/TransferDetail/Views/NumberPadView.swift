//
//  NumberPadView.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/17.
//

import UIKit

final class NumberPadView: UIView {

    private let amount10000 = SOLFilledButton(backgroundColor: .blu50, text: StringLiterals.TransferDetail.amount10000, textColor: .blue500, font: .font(.body3)).then {
        $0.tag = 1
    }
    private let amount50000 = SOLFilledButton(backgroundColor: .blu50, text: StringLiterals.TransferDetail.amount50000, textColor: .blue500, font: .font(.body3)).then {
        $0.tag = 2
    }
    private let amount100000 = SOLFilledButton(backgroundColor: .blu50, text: StringLiterals.TransferDetail.amount100000, textColor: .blue500, font: .font(.body3)).then {
        $0.tag = 3
    }
    private let amount1000000 = SOLFilledButton(backgroundColor: .blu50, text: StringLiterals.TransferDetail.amount1000000, textColor: .blue500, font: .font(.body3)).then {
        $0.tag = 4
    }
    private let amountTotal = SOLFilledButton(backgroundColor: .blu50, text: StringLiterals.TransferDetail.amountTotal, textColor: .blue500, font: .font(.body3)).then {
        $0.tag = 5
    }
    private lazy var addAmountStackView = UIStackView(arrangedSubviews: [
        amount10000,
        amount50000,
        amount100000,
        amount1000000,
        amountTotal
    ]).then {
        $0.distribution = .fillEqually
        $0.spacing = 12
    }

    private let button1 = SOLFilledButton(backgroundColor: .clear, text: "1", textColor: .gray600, font: .font(.display4))
    private let button2 = SOLFilledButton(backgroundColor: .clear, text: "2", textColor: .gray600, font: .font(.display4))
    private let button3 = SOLFilledButton(backgroundColor: .clear, text: "3", textColor: .gray600, font: .font(.display4))
    private lazy var oneToThreeStackView = UIStackView(arrangedSubviews: [
        button1,
        button2,
        button3
    ]).then {
        $0.distribution = .fillEqually
        $0.spacing = 12
    }

    private let button4 = SOLFilledButton(backgroundColor: .clear, text: "4", textColor: .gray600, font: .font(.display4))
    private let button5 = SOLFilledButton(backgroundColor: .clear, text: "5", textColor: .gray600, font: .font(.display4))
    private let button6 = SOLFilledButton(backgroundColor: .clear, text: "6", textColor: .gray600, font: .font(.display4))
    private lazy var fourToSixStackView = UIStackView(arrangedSubviews: [
        button4,
        button5,
        button6
    ]).then {
        $0.distribution = .fillEqually
        $0.spacing = 12
    }

    private let button7 = SOLFilledButton(backgroundColor: .clear, text: "7", textColor: .gray600, font: .font(.display4))
    private let button8 = SOLFilledButton(backgroundColor: .clear, text: "8", textColor: .gray600, font: .font(.display4))
    private let button9 = SOLFilledButton(backgroundColor: .clear, text: "9", textColor: .gray600, font: .font(.display4))
    private lazy var sevenToNineStackView = UIStackView(arrangedSubviews: [
        button7,
        button8,
        button9
    ]).then {
        $0.distribution = .fillEqually
        $0.spacing = 12
    }

    private let button00 = SOLFilledButton(backgroundColor: .clear, text: "00", textColor: .gray600, font: .font(.display4))
    private let button0 = SOLFilledButton(backgroundColor: .clear, text: "0", textColor: .gray600, font: .font(.display4))
    private let buttonBackspace = SOLFilledButton(backgroundColor: .clear, image: ImageLiterals.TransferDetail.icBackSpace)
    private lazy var zerosBackspaceStackView = UIStackView(arrangedSubviews: [
        button00,
        button0,
        buttonBackspace
    ]).then {
        $0.distribution = .fillEqually
        $0.spacing = 12
    }

    private lazy var numberPadTotalStackView = UIStackView(arrangedSubviews: [
        oneToThreeStackView,
        fourToSixStackView,
        sevenToNineStackView,
        zerosBackspaceStackView
    ]).then {
        $0.isLayoutMarginsRelativeArrangement = true
        $0.layoutMargins = .init(top: 15, left: 0, bottom: 15, right: 0)
        $0.distribution = .fillEqually
        $0.axis = .vertical
        $0.spacing = 25
    }

    

    lazy var numberButtons = [
        amount10000, amount50000, amount100000, amount1000000, amountTotal,
        button1, button2, button3,
        button4, button5, button6,
        button7, button8, button9,
        button00, button0, buttonBackspace
    ]

    override init(frame: CGRect) {
        super.init(frame: frame)
        hierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


extension NumberPadView {
    func hierarchy() {
        addSubviews(addAmountStackView, numberPadTotalStackView)
    }

    func setLayout() {
        addAmountStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(36)
        }

        numberPadTotalStackView.snp.makeConstraints { make in
            make.top.equalTo(addAmountStackView.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
        }

        numberPadTotalStackView.subviews.forEach {
            $0.snp.makeConstraints { make in
                make.height.equalTo(45)
            }
        }
    }
}
