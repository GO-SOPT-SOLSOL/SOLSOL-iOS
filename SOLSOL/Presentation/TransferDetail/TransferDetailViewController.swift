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
            $0.isEnabled = false
            $0.addTarget(self, action: #selector(handleTapNextButton), for: .touchUpInside)

        }

    private var transferDetailData: TransferDetailModel?

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
        setButtonHandler()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let transferDetailData else { return }
        viewModel.viewWillAppear(model: transferDetailData)
        self.navigationController?.isNavigationBarHidden = true
        
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

    func setButtonHandler() {
        nextButton.configurationUpdateHandler = {
            var config = $0.configuration
            config?.baseBackgroundColor = $0.isEnabled
            ? .blue500
            : .blue100
            config?.baseForegroundColor = $0.isEnabled
            ? .white
            : .gray200
        }
    }

}

extension TransferDetailViewController {
    //TODO: - 성준: 이 메서드로 데이터 전달해주면 됨
    func setTransferDetailData(data: TransferDetailModel) {
        self.transferDetailData = data
    }

    private func bind() {
        numberPad.numberButtons.forEach {
            $0.addTarget(self, action: #selector(touchNumberPad), for: .touchUpInside)
        }

        self.viewModel.fetchedMyAccount = { data in
            self.transferInfoView.configureTransferInfoView(model: data)
        }

        viewModel.updatedMoneyDisplay = { text in
            self.nextButton.isEnabled = text != "0"
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
        guard let priceText = self.transferInfoView.moneyLabel.text?.currencyToNormalString(),
              let receiver = self.transferDetailData?.receiver,
              let sender = self.transferDetailData?.sender
        else { return }
        let viewController = TransferConfirmViewController()
        let TransferDetailModel = TransferDetailModel(
            receiver: receiver,
            sender: sender,
            price: priceText
        )
        viewController.setTransferDetailData(TransferDetailModel)
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
