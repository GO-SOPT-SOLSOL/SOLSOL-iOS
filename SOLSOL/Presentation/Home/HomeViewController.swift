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
    
    private let HomeTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setLayout()
        setTarget()
        setDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setStyle() {
        
        HomeTableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.separatorStyle = .none
            $0.backgroundColor = .gray100
            setRegister()
        }
        
    }
    
    func setLayout() {
        view.addSubview(HomeTableView)
        
        HomeTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.bottom.equalTo(view.safeAreaInsets)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func setTarget() {}
    
    func setDelegate() {}

    func setRegister() {
        HomeTableView.register(AdvertisementTableViewCell.self, forCellReuseIdentifier:  AdvertisementTableViewCell.className)
        HomeTableView.register(MyAccountTableViewCell.self, forCellReuseIdentifier:  MyAccountTableViewCell.className)
        HomeTableView.register(TransferTableViewCell.self, forCellReuseIdentifier:  TransferTableViewCell.className)
        HomeTableView.register(ShinhanPlusTableViewCell.self, forCellReuseIdentifier:  ShinhanPlusTableViewCell.className)
        HomeTableView.register(DeliveryPackagingTableViewCell.self, forCellReuseIdentifier:  DeliveryPackagingTableViewCell.className)
        HomeTableView.register(CategoryTableViewCell.self, forCellReuseIdentifier:  CategoryTableViewCell.className)
        HomeTableView.register(FooterButtonTableViewCell.self, forCellReuseIdentifier:  FooterButtonTableViewCell.className)
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = Section(rawValue: indexPath.section) else {
            print("Wrong Section !")
            return UITableViewCell()
        }
        switch sectionType {
        case .advertisement:
            let cell = tableView.dequeueReusableCell(withIdentifier: AdvertisementTableViewCell.className, for: indexPath)
            return cell
        case .myAccount:
            let cell = tableView.dequeueReusableCell(withIdentifier: MyAccountTableViewCell.className, for: indexPath)
            return cell
        case .transfer:
            let cell = tableView.dequeueReusableCell(withIdentifier:             TransferTableViewCell.className, for: indexPath)
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 64
        case 1:
            return 63
        case 2:
            return 290
        case 3:
            return 52
        case 4:
            return 100
        case 5:
            return 175
        case 6:
            return 125
        default:
            return 0
        }
    }
}
