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
    
    private let originView = HomeView()
    
    private var adBannerHit: [Advertisement] = [] {
        didSet {
            self.originView.homeTableView.reloadData()
        }
    }
    
    private var accountList: [Transfer] = [] {
        didSet {
            self.originView.homeTableView.reloadData()
        }
    }
    
    private var currentAccountList: [TransferList] = [] {
        didSet {
            self.originView.homeTableView.reloadData()
        }
    }
    
    lazy var navigationBar = SOLNavigationBar(self, leftItem: .home)
    
    override func viewDidLoad() {
        setStyle()
        setLayout()
        setDelegate()
    }
    
    override func loadView() {
        self.view = originView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        getAdvertisementWithAPI()
        getAccountsListWithAPI()
        getCurrentAccountsListWithAPI()
    }
    
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



extension HomeViewController: TransferButtonAction {
    func transferButtonTapped() {
        let nextViewController = TransferViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

// MARK: Network Result

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
                
                dump(data)
                self.accountList = [Transfer(id: data[0].id, kind: data[0].kind, bank: data[0].bank, name: data[0].name, money: data[0].balance, accountNumber: data[0].accountNumber), Transfer(id: data[1].id, kind: data[1].kind, bank: data[1].bank, name: data[1].name, money: data[1].balance, accountNumber: data[1].accountNumber), Transfer(id: data[2].id, kind: data[2].kind, bank: data[2].bank, name: data[2].name, money: data[2].balance, accountNumber: data[2].accountNumber) ]
                
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
                
                dump(data)
                self.currentAccountList = [TransferList(id: data.transfers[0].id, name: data.transfers[0].name , bank: data.transfers[0].bank), TransferList(id: data.transfers[1].id, name: data.transfers[1].name , bank: data.transfers[1].bank), TransferList(id: data.transfers[2].id, name: data.transfers[2].name , bank: data.transfers[2].bank) ]
                
            default:
                print("network failure")
                return
            }
        }
    }
    
}
