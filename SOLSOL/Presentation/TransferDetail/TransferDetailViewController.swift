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
        static let nextButtonHeight = 52
    }

    private lazy var navigationBar = SOLNavigationBar(self, leftItem: .back)

    private let transferInfoView = TransferInfoView()

    private let numberPad = NumberPadView()

    private lazy var nextButton = SOLFilledButton(
        backgroundColor: .blue500,
        text: StringLiterals.TransferDetail.next,
        textColor: .white,
        font: .font(.headline), cornerRadius: 12).then {
            $0.addTarget(self, action: #selector(handleTapNextButton), for: .touchUpInside)
        }

    private var viewModel: TransferDetailViewModel

    private var myAccount: MyAccountViewModel?

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
        self.navigationController?.isNavigationBarHidden = true
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
            make.height.equalTo(SizeLiterals.navigationBarHeight)
        }

        transferInfoView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }

        numberPad.snp.makeConstraints { make in
            make.top.equalTo(transferInfoView.snp.bottom).offset(10)
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
            self.myAccount = myAccount
            self.transferInfoView.configureMyAccount(account: myAccount)
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

    @objc
    func handleTapNextButton(sender: UIButton) {
        guard let myAccount = self.myAccount,
              let receiverText = transferInfoView.receiverLabel.text,
              let receiverAccountText = transferInfoView.receiverAccountLabel.text,
              let moneyText = transferInfoView.moneyLabel.text
        else {
            return
        }
        let viewController = TransferConfirmViewController()

        // memberId, senderAccountsId, bank, accountNumber
        // accountsId랑 memberId -> api
        // 이것들 받으면 price만 포함해서 넘기기
        
        viewController.setInitialData(
            receiverName: receiverText,
            receiverAccount: receiverAccountText,
            transferMoney: moneyText.replacingOccurrences(of: "원", with: ""),
            myAccount: myAccount)
        self.navigationController?.pushViewController(viewController, animated: false)
    }

}


extension TransferDetailViewController {
    func getSingleAccountWithAPI() {
        let queryDTO = AccountsListRequestDTO(memberId: 1)
        NetworkService.shared.transferDefailServcie.getSingleAccountInfo(accountNum: 1, queryDTO: queryDTO) { response in
            switch response {
            case .success(let data):
                guard let data = data.data else { return }
                dump(data)
            default:
                print("network failure")
                return
            }
        }
    }
    
}
