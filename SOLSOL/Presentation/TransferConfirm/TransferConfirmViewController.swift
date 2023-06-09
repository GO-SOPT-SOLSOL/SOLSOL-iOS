//
//  TransferConfirmViewController.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/19.
//

import UIKit

final class TransferConfirmViewController: UIViewController {

    private enum Size {
        static let buttonHeight = 52
    }

    private lazy var navigationBar = SOLNavigationBar(self, leftItem: .back)

    private let transferInfoView = TransferInfoView()

    private let backgroundView = UIView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray150.cgColor
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
        $0.backgroundColor = .gray150
    }

    private let receiverMemoView = MemoView(type: .receive)
    private let myBankbookMemoView = MemoView(type: .myBankbook)
    private let feeMemoView = MemoView(type: .fee)

    private lazy var stackView = UIStackView(arrangedSubviews: [
        receiverMemoView,
        myBankbookMemoView,
        feeMemoView
    ]).then {
        $0.distribution = .equalSpacing
        $0.axis = .vertical
        $0.spacing = 1
    }

    private let additionalInfoButton = SOLFilledButton(
        backgroundColor: .clear,
        text: "추가정보",
        textColor: .gray600,
        image: ImageLiterals.TransferDetail.icArrowDown,
        imagePlacement: .trailing,
        imagePadding: 7,
        font: .font(.body4)
    )

    private let additionalTransferButton = SOLFilledButton(backgroundColor: .gray100, text: "추가이체", textColor: .gray600, font: .font(.headline))

    private lazy var transferButton = SOLFilledButton(backgroundColor: .blue500, text: "이체", textColor: .white, font: .font(.headline)).then {
        $0.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }

    private var transferCofirmData: TransferDetailModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

extension TransferConfirmViewController {
    func setStyle() {
        view.backgroundColor = .white
    }

    func setLayout() {
        view.addSubviews(
            navigationBar,
            transferInfoView,
            backgroundView,
            additionalInfoButton,
            additionalTransferButton,
            transferButton
        )
        backgroundView.addSubview(stackView)

        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(SizeLiterals.navigationBarHeight)
        }

        transferInfoView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
        }

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        backgroundView.snp.makeConstraints { make in
            make.top.equalTo(transferInfoView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(18)
        }

        additionalInfoButton.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.bottom).offset(36)
            make.leading.equalTo(backgroundView)
        }

        additionalTransferButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().inset(18)
            make.height.equalTo(Size.buttonHeight)
            make.width.equalTo(ScreenUtils.getWidth(112))
        }

        transferButton.snp.makeConstraints { make in
            make.centerY.equalTo(additionalTransferButton)
            make.leading.equalTo(additionalTransferButton.snp.trailing).offset(6)
            make.trailing.equalToSuperview().inset(18)
            make.height.equalTo(additionalTransferButton)
        }


    }
}

extension TransferConfirmViewController {
    func setTransferDetailData(_ model: TransferDetailModel) {
        self.transferCofirmData = model
        self.transferInfoView.configureTransferInfoView(model: model)
    }

    @objc
    private func handleTap() {
        transfer()
    }
}

// MARK: - Network

extension TransferConfirmViewController {
    func transfer() {
        guard let transferModel = self.transferCofirmData,
              let priceText = transferModel.price,
              let price = Int(priceText.currencyToNormalString())
        else { return }

        let queryDTO = AccountsListRequestDTO(memberId: transferModel.sender.memberId)
        let requestDTO = TransferToRequestDTO(
            senderAccountsId: transferModel.sender.accountId,
            price: price,
            bank: transferModel.receiver.receiverBank.rawValue,
            number: transferModel.receiver.receiverAccount,
            transferMemo: receiverMemoView.getMemoText(),
            receiverMemo: myBankbookMemoView.getMemoText(),
            charge: 0
        )
        NetworkService.shared.transferConfirmService.transfer(queryDTO: queryDTO, requestDTO: requestDTO) { response in
            switch response {
            case .success:
                self.navigationController?.popToRootViewController(animated: true)
            default:
                print("network fail")
                return
            }
        }

    }
}
