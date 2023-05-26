//
//  UserCustomViewController.swift
//  SOLSOL
//
//  Created by 곽성준 on 2023/05/22.
//

import UIKit

protocol CellAction: AnyObject {
    func cellTapped(row: Int)
    
    
}

class UserCustomViewController: UIViewController {
    
    //MARK: - UIComponents
    
    weak var cellDelegate: CellAction?
    
    var recentSentAccountList: [RecentSentAccount?] = []{
        didSet {
            self.TranferTableView.reloadData()
        }
    }
    
    let TranferTableView = UITableView(frame: .zero, style: .grouped)
    
    private let Firstdummy = AccountInfo.dummy()
    //    private let Secondummy = AccountInfoWithDate.dummy()
    
    
    private let firstHeaderView = UIView()
    private let secondHeaderView = UIView()
    private let firstHeaderLabel = UILabel()
    private let secondHeaderLabel = UILabel()
    private let sectionDivider = UIView()
    
    
    //MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getRecentSentAccountListWithAPI()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        hierachy()
        setStyle()
        setLayout()
        setDelegate()
        
    }
    
    
    
    func setStyle(){
        
        TranferTableView.do{
            
            
            $0.register(TransferAccountsTableViewCell.self, forCellReuseIdentifier: TransferAccountsTableViewCell.identifier)
            
            $0.separatorStyle = .none
            
        }
        
        firstHeaderView.do{
            $0.backgroundColor = .white
        }
        
        secondHeaderView.do{
            $0.backgroundColor = .white
        }
        
        firstHeaderLabel.do{
            $0.text = "내계좌"
            $0.textColor = .gray600
            $0.font = .font(.subhead4)
        }
        
        secondHeaderLabel.do{
            $0.text = "최근보낸 사람"
            $0.textColor = .gray600
            $0.font = .font(.subhead4)
        }
        
        sectionDivider.do{
            $0.backgroundColor = .gray100
        }
        
    }
    
    func hierachy(){
        view.addSubview(TranferTableView)
        firstHeaderView.addSubview(firstHeaderLabel)
        secondHeaderView.addSubview(secondHeaderLabel)
    }
    
    func setLayout(){
        
        TranferTableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        
        firstHeaderLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(18)
            $0.centerY.equalToSuperview()
        }
        
        secondHeaderLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(18)
            $0.centerY.equalToSuperview()
        }
        
    }
    
    func setDelegate(){
        TranferTableView.delegate = self
        TranferTableView.dataSource = self
    }
    
    
    
}
extension UserCustomViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        74
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            return Firstdummy.count
        }else {return recentSentAccountList.count}
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TransferAccountsTableViewCell.identifier, for: indexPath) as? TransferAccountsTableViewCell else
            {return UITableViewCell()}
            
            cell.configureCell(Firstdummy[indexPath.row])
            
            return cell}
        
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TransferAccountsTableViewCell.identifier, for: indexPath) as? TransferAccountsTableViewCell else
            {return UITableViewCell()}
            
            guard let account = self.recentSentAccountList[indexPath.row]
            else{ return UITableViewCell() }
            
            cell.configureSecondCell(recentSentAccountList: account)
            cell.cellDelegate = self
            
            return cell
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            return firstHeaderView
        }
        else if section == 1{
            return secondHeaderView
        }
        else {return UIView()}
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0{
            return sectionDivider
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0{
            return 7
            
        }
        return 0
    }
    
    
}

extension UserCustomViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellDelegate?.cellTapped(row: indexPath.row)
        //
    }
}

extension UserCustomViewController {
    func getRecentSentAccountListWithAPI() {
        let queryDTO = RecentSentAccountListRequestDTO(memberId: 1)
        NetworkService.shared.transferservice.getRecentSentAccountList(queryDTO: queryDTO) { result in
            switch result {
            case .success(let data):
                            guard let data = data.data else { return }

                let transferList = data.transfers.map { data -> RecentSentAccount? in
                                guard let bank = Bank(rawValue: data.bank)
                                else { return nil }
                    return RecentSentAccount(transferId: data.id, name: data.name, createdAt: data.createdAt, bank: bank, accountNumber: data.accountNumber)
                            }

                            self.recentSentAccountList = transferList

                        default:
                            print("network failure")
                            return
                        }
        }
        
    }
}

extension UserCustomViewController: DeleteButtonTapped{
    
    func buttonTapped(index: Int) {
        let queryDTO = DeleteRecentAccountRequestDTO(memberId: 1)
        NetworkService.shared.transferservice.deleteRecentAccount(queryDTO: queryDTO, transferId: index) { result in
            switch result {
            case .success(let data):
                guard let data = data.data else {
                    print("no data")
                    return
                }
                dump(data)

            default:
                print("network failure")
                return
            }
        }
        
    }
}




