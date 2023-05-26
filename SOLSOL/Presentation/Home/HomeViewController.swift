//
//  ViewController.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/13.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: UIViewController {
    
    // MARK: - View와 ViewController 분리
    
    private let originView = HomeView()
    
    override func loadView() {
        self.view = originView
    }
    
    // MARK: - Advertisement 구조체로부터 받아올 정보를 담는 배열
    
    private var adBannerHit: [Advertisement] = [] {
        didSet {
            self.originView.homeTableView.reloadData()
        }
    }
    
    // MARK: - Transfer 구조체로부터 받아올 정보를 담는 배열
    
    private var accountList: [MyBankAccount?] = [] {
        didSet {
            self.originView.homeTableView.reloadData()
        }
    }
    
    // MARK: - TransferList 구조체로부터 받아올 정보를 담는 배열
    
    private var currentAccountList: [ReceiverModel?] = [] {
        didSet {
            self.originView.homeTableView.reloadData()
        }
    }
    
    // MARK: - custom navigationBar
    
    lazy var navigationBar = SOLNavigationBar(self, leftItem: .home)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        setStyle()
        setLayout()
        setDelegate()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        getAdvertisementWithAPI()
        getAccountsListWithAPI()
        getCurrentAccountsListWithAPI()
    }
    
    // MARK: - UI Components
    
    func setStyle() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
        view.addSubviews(navigationBar)
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        originView.homeTableView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
    }
    
    func setDelegate() {
        originView.homeTableView.dataSource = self
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return adBannerHit.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = Section(rawValue: indexPath.section) else {
            print("Wrong Section !")
            return UITableViewCell()
        }
        switch sectionType {
        case .advertisement:
            let cell = tableView.dequeueReusableCell(withIdentifier: AdvertisementTableViewCell.className, for: indexPath) as! AdvertisementTableViewCell
            let advertisement = adBannerHit[indexPath.row]
            cell.configureCell(advertisement: advertisement)
            return cell
        case .myAccount:
            let cell = tableView.dequeueReusableCell(withIdentifier: MyAccountTableViewCell.className, for: indexPath)
            return cell
        case .transfer:
            let cell = tableView.dequeueReusableCell(withIdentifier:             TransferTableViewCell.className, for: indexPath) as! TransferTableViewCell
            cell.accountList = accountList
            cell.currentAccountList = currentAccountList
            cell.pushDelegate = self
            return cell
        case .shinhanPlus:
            let cell = tableView.dequeueReusableCell(withIdentifier:             ShinhanPlusTableViewCell.className, for: indexPath)
            return cell
        case .deliveryPackaging:
            let cell = tableView.dequeueReusableCell(withIdentifier:             DeliveryPackagingTableViewCell.className, for: indexPath)
            return cell
        case .category:
            let cell = tableView.dequeueReusableCell(withIdentifier:             CategoryTableViewCell.className, for: indexPath)
            return cell
        case.footerButton:
            let cell = tableView.dequeueReusableCell(withIdentifier:             FooterButtonTableViewCell.className, for: indexPath)
            return cell
        }
    }
}


// MARK: - Delegate Protocol

extension HomeViewController: TransferButtonAction {
    func transferButtonTapped() {
        let nextViewController = TransferViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

// MARK: - Network Result

extension HomeViewController {
    
    func getAdvertisementWithAPI() {
        NetworkService.shared.homeService.getADs { result in
            switch result {
            case .success(let data):
                guard let data = data.data else { return }
                
                let advertisementData = Advertisement(title: data[1].title, content: data[1].content)
                self.adBannerHit = [advertisementData]
                
                dump(data)
            default:
                print("network failure")
                return
            }
        }
    }
    
    func getAccountsListWithAPI() {
        let queryDTO = AccountsListRequestDTO(memberId: 2)
        NetworkService.shared.homeService.getAccountsList(queryDTO: queryDTO) {
            result in
            
            switch result {
            case .success(let data):
                guard let data = data.data else { return }
                
                let transferList = data.map { data -> MyBankAccount? in
                    guard let bank = Bank(rawValue: data.bank),
                          let kind = BankBookType(rawValue: data.kind)
                    else { return nil }
                    return MyBankAccount(memberId: data.memberId, accountId: data.memberId, bank: bank, bankBookName: data.name, bankBookType: kind, account: data.accountNumber, balance: data.balance)
                }
                
                self.accountList = transferList
                
            default:
                print("network failure")
                return
            }
        }
        
    }
    
    func getCurrentAccountsListWithAPI() {
        let queryDTO = CurrentAccountListRequestDTO(memberId: 2)
        NetworkService.shared.homeService.getCurrentAccoutsList(queryDTO: queryDTO) { result in
            
            switch result {
            case .success(let data):
                guard let data = data.data else { return }
                
                let currentTransferList = data.transfers.map { data -> ReceiverModel? in
                    guard let bank = Bank(rawValue: data.bank)
                    else { return nil }
                    return ReceiverModel(receiverName: data.name, receiverBank: bank, receiverAccount: data.price)
                }
                
                self.currentAccountList = currentTransferList
                
            default:
                print("network failure")
                return
            }
        }
    }
    
}
