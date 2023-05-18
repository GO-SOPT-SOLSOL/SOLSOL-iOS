//
//  TransferDetailViewModel.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/18.
//

import Foundation


protocol TransferDetailViewModelInput {
    func viewWillAppear()
    func didTapNumberPad(text: String?, buttonType: NumberButtonType)
}

protocol TransferDetailViewModelOuput {
    var fetchedMyAccount: ((MyAccountViewModel) -> Void)? { get set }
    var updatedMoneyDisplay: ((String) -> Void)? { get set }

}

protocol TransferDetailViewModel: TransferDetailViewModelInput, TransferDetailViewModelOuput {}

final class DefaultTransferDetailViewModel: TransferDetailViewModel {

    var fetchedMyAccount: ((MyAccountViewModel) -> Void)?

    var updatedMoneyDisplay: ((String) -> Void)?

    var myAccount: MyAccountViewModel? {
        didSet {
            guard let myAccount else { return }
            fetchedMyAccount?(myAccount)
        }
    }

    var moneyDisplay: String = "0" {
        didSet {
            updatedMoneyDisplay?(moneyDisplay)
        }
    }

}

extension DefaultTransferDetailViewModel {
    func viewWillAppear() {
        // TODO: Network
        let myaccount = MyAccount.dummy().toViewModel()
        self.myAccount = myaccount
    }

    func didTapNumberPad(text: String?, buttonType type: NumberButtonType) {
        var currDisplay = moneyDisplay
        currDisplay = currDisplay.replacingOccurrences(of: ",", with: "")

        guard let text else {
            currDisplay.removeLast()
            moneyDisplay = Int(currDisplay)?.currencyAmountToString() ?? "0"
            return
        }
        currDisplay = modifyMoneyDisplay(currentDisplay: currDisplay, inputString: text, type: type)
        moneyDisplay = Int(currDisplay)?.currencyAmountToString() ?? "0"
    }

    private func modifyMoneyDisplay(currentDisplay: String, inputString: String, type: NumberButtonType) -> String {
        guard var num = Int(currentDisplay) else { return "0" }
        var currentDisplay = currentDisplay
        switch type {
        case .normal:
            currentDisplay += inputString
            return currentDisplay
        case .add10000, .add50000, .add100000, .add1000000:
            num += type.addNum
            return String(num)
        case .addTotal:
            guard let balance = self.myAccount?.balance else { return "0" }
            return balance.replacingOccurrences(of: ",", with: "")
        }
    }
}
