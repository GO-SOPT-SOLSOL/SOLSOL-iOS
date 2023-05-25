//
//  MemoView.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/19.
//

import UIKit

final class MemoView: UIView {

    @frozen
    enum MemoViewType {
        case receive
        case myBankbook
        case fee
    }

    private let type: MemoViewType

    private let memoLabel = UILabel().then {
        $0.textColor = .gray400
        $0.font = .font(.body5)
    }

    private let memoBodyTextField = UITextField().then {
        $0.placeholder = "미입력시 수취인명"
        $0.font = .font(.subhead2)
        $0.textColor = .black
    }

    private let downArrowButton = SOLFilledButton(
        backgroundColor: .clear,
        textColor: .black,
        image: ImageLiterals.TransferDetail.icArrowDown,
        font: .font(.subhead2))

    private let feeLabel = UILabel().then {
        $0.isHidden = true
        $0.text = "면제"
        $0.textColor = .black
        $0.font = .font(.subhead2)
    }

    init(type: MemoViewType) {
        self.type = type
        super.init(frame: .zero)
        setLayout()
        setMemoLabel()
        setStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


extension MemoView {
    private func setStyle() {
        self.backgroundColor = .white
    }

    private func setLayout() {
        addSubviews(memoLabel,
                    memoBodyTextField,
                    downArrowButton,
                    feeLabel)

        memoLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(17)
            make.leading.equalToSuperview().inset(11)
        }

        memoBodyTextField.snp.makeConstraints { make in
            make.centerY.equalTo(memoLabel)
            make.leading.equalTo(memoLabel.snp.trailing).offset(17)
        }

        downArrowButton.snp.makeConstraints { make in
            make.centerY.equalTo(memoBodyTextField)
            make.trailing.equalToSuperview().inset(22)
        }

        feeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(memoBodyTextField)
            make.trailing.equalToSuperview().inset(22)
        }

    }

    func setMemoLabel() {
        switch type {
        case .receive:
            memoLabel.text = "받는분 메모"
            memoBodyTextField.text = "조정연"
        case .myBankbook:
            memoLabel.text = "내통장 메모"
        case .fee:
            memoLabel.text = "수수료"
            memoBodyTextField.isHidden = true
            feeLabel.isHidden = false
            downArrowButton.isHidden = true
        }
    }

    func getMemoText() -> String {
        return self.memoBodyTextField.text ?? ""
    }

}
