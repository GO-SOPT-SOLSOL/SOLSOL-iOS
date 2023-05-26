//
//  TransferViewController.swift
//  SOLSOL
//
//  Created by 곽성준 on 2023/05/16.
//

import UIKit

class TransferViewController: UIViewController {
    
    private lazy var navigationBar = SOLNavigationBar(self, leftItem: .back)

    let originView = TransferView()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        
    }
    
    
    override func loadView() {
        self.view = originView
        originView.userCustomView.cellDelegate = self
    }
    
    private func setStyle(){
        view.addSubview(navigationBar)
    }
    
    private func setLayout(){
        navigationBar.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.height.equalTo(44)
            $0.width.equalTo(375)
            
        }
    }
    
    //화면 터치 시 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
        
    }
}
extension TransferViewController: CellAction{
    
    func cellTapped(row: Int, section: Int) {
        
        if section == 0{
            let nextViewController = TransferDetailViewController(viewModel: DefaultTransferDetailViewModel())
            
            let recentList = originView.userCustomView.accountList[row]
            
            guard let bank = recentList else { return }
            
            nextViewController.setTransferDetailData(data: TransferDetailModel(receiver: ReceiverModel.init(receiverName: "곽성준", receiverBank: bank.bank, receiverAccount: bank.account),
                                                                               sender: MyBankAccount.init(memberId: bank.memberId, accountId: bank.accountId, bank: bank.bank, bankBookName: nil, bankBookType: nil, account: bank.account, balance: bank.balance), price: ""))
            
            navigationController?.pushViewController(nextViewController, animated: true)
        }
        
        else{
            
            let nextViewController = TransferDetailViewController(viewModel: DefaultTransferDetailViewModel())
            
            let recentList = originView.userCustomView.recentSentAccountList[row]
            
            guard let bank = recentList else { return }
            
            nextViewController.setTransferDetailData(data: TransferDetailModel(receiver: ReceiverModel.init(receiverName: bank.name, receiverBank: bank.bank, receiverAccount: bank.accountNumber),
                                                                               sender: MyBankAccount.init(memberId: 2, accountId: 2, bank: bank.bank, bankBookName: nil, bankBookType: nil, account: bank.accountNumber, balance: 0), price: ""))
            
            navigationController?.pushViewController(nextViewController, animated: true)
            
        }
    }
}
