//
//  TransferDetailViewController.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class TransferDetailViewController: UIViewController {

    private enum Size {
        static let navigationBarheight = 44
        static let nextButtonHeight = 52
    }

    private lazy var navigationBar = SOLNavigationBar(self, leftItem: .back)

    private let transferInfoView = TransferInfoView()

    private let numberPad = NumberPadView()

    private let nextButton = SOLFilledButton(
        backgroundColor: .blue500,
        text: StringLiterals.TransferDetail.next,
        textColor: .white,
        font: .font(.headline), cornerRadius: 12)

    private var viewModel: TransferDetailViewModel

    init(viewModel: TransferDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        bind()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
    
}

private extension TransferDetailViewController {

    func setStyle() {
        self.hidesBottomBarWhenPushed = true
        view.backgroundColor = .white
    }

    func setLayout() {
        view.addSubviews(navigationBar,
                         transferInfoView,
                         numberPad,
                         nextButton)

        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Size.navigationBarheight)
        }

        transferInfoView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }

        numberPad.snp.makeConstraints { make in
            make.top.equalTo(transferInfoView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(18)
        }

        nextButton.snp.makeConstraints { make in
            make.top.equalTo(numberPad.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(18)
            make.height.equalTo(Size.nextButtonHeight)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

}

extension TransferDetailViewController {
    private func bind() {
        numberPad.numberButtons.forEach {
            $0.addTarget(self, action: #selector(touchNumberPad), for: .touchUpInside)
        }

        self.viewModel.fetchedMyAccount = { myAccount in
            self.transferInfoView.configureTransferInfoView(account: myAccount)
        }

        viewModel.updatedMoneyDisplay = { text in
            self.transferInfoView.updateMoneyDisplay(text: text)
        }

        viewModel.updatedConvenientDisplay = { text in
            self.transferInfoView.updateConvenientLabel(text: text)
        }
    }
}

extension TransferDetailViewController {
    @objc
    func touchNumberPad(sender: UIButton) {
        guard let type = NumberButtonType(rawValue: sender.tag) else { return }
        viewModel.didTapNumberPad(text: sender.titleLabel?.text, buttonType: type)
    }
}
