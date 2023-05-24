//
//  HomeView.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class HomeView: UIView {
    
    // MARK: - UITableView 생성
    
    let homeTableView = UITableView()

    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
        setDelegate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components
    
    func setStyle() {
        homeTableView.do {
            $0.separatorStyle = .none
            $0.backgroundColor = .gray100
            setRegister()
        }
    }
    
    func setLayout() {
        self.addSubview(homeTableView)
        homeTableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(94)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func setDelegate() {
        homeTableView.delegate = self
    }
    
    // MARK: - setRegister()
    
    func setRegister() {
        homeTableView.register(AdvertisementTableViewCell.self, forCellReuseIdentifier:  AdvertisementTableViewCell.className)
        homeTableView.register(MyAccountTableViewCell.self, forCellReuseIdentifier:  MyAccountTableViewCell.className)
        homeTableView.register(TransferTableViewCell.self, forCellReuseIdentifier:  TransferTableViewCell.className)
        homeTableView.register(ShinhanPlusTableViewCell.self, forCellReuseIdentifier:  ShinhanPlusTableViewCell.className)
        homeTableView.register(DeliveryPackagingTableViewCell.self, forCellReuseIdentifier:  DeliveryPackagingTableViewCell.className)
        homeTableView.register(CategoryTableViewCell.self, forCellReuseIdentifier:  CategoryTableViewCell.className)
        homeTableView.register(FooterButtonTableViewCell.self, forCellReuseIdentifier:  FooterButtonTableViewCell.className)
    }
}

// MARK: - 각 section의 높이 설정

extension HomeView: UITableViewDelegate {
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
