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
        view.backgroundColor = .gray100
        
        HomeTableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .gray100
            $0.contentInsetAdjustmentBehavior = .never
            setRegister()
        }
    }
    
    func setLayout() {
        view.addSubview(HomeTableView)
        
        HomeTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setTarget() {}
    
    func setDelegate() {}

    func setRegister() {
        
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

    }
}
