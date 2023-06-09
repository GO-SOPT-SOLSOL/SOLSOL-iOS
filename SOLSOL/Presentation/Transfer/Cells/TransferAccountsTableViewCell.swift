//
//  TransferTableViewCell.swift
//  SOLSOL
//
//  Created by 곽성준 on 2023/05/19.
//

import UIKit

protocol DeleteButtonTapped: AnyObject {
    func buttonTapped(index: Int)
}

final class TransferAccountsTableViewCell: UITableViewCell {
    
    //MARK: - UIComponents
    
    static let identifier = "TransferAccountsTableViewCell"
    
    weak var cellDelegate: DeleteButtonTapped?

    private let bankImage = UIImageView()
    private let bankNameLabel = UILabel()
    private let name = UILabel()
    private let bankAccountLable = UILabel()
    private let dateLable = UILabel()
    private let deleteButton = UIButton()
    private var transferId: Int = 0
    
    //MARK: - View Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        hierarchy()
        setLayout()
      
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle(){
        
        selectionStyle = .none
        
        bankNameLabel.do{
            $0.font = .font(.subhead3)
            $0.textColor = .gray600
        }
        
        bankAccountLable.do{
            $0.font = .font(.body5)
            $0.textColor = .gray400
        }
        
        dateLable.do{
            $0.font = .font(.body2)
            $0.textColor = .gray300
        }
        
        name.do{
            $0.font = .font(.subhead3)
            $0.textColor = .gray600
        }
        
        deleteButton.do{
            $0.addTarget(self, action: #selector(deleteRecentAccount), for: .touchUpInside)
        }
        
    }
    
    func hierarchy(){
        
        contentView.addSubviews(bankImage, bankNameLabel, bankAccountLable, deleteButton, dateLable,name)
        
    }
    
    func setLayout(){
        
        bankImage.snp.makeConstraints{
            $0.width.equalTo(30)
            $0.height.equalTo(30)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(18)
        }
        
        bankNameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(18)
            $0.leading.equalTo(bankImage.snp.trailing).offset(11)
        }
        
        name.snp.makeConstraints{
            $0.leading.equalTo(bankImage.snp.trailing).offset(11)
            $0.top.equalToSuperview().inset(18)
        }
        
        bankAccountLable.snp.makeConstraints{
            $0.top.equalTo(bankImage.snp.top).offset(20)
            $0.leading.equalTo(bankImage.snp.trailing).offset(11)
        }
        
        deleteButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(30)
        }
        
        dateLable.snp.makeConstraints{
            $0.leading.equalTo(name.snp.trailing).offset(4)
            $0.centerY.equalTo(name)
        }
        
    }
    
    @objc
    func deleteRecentAccount(index: Int){
        cellDelegate?.buttonTapped(index: transferId)
    }
    
   
    func configureCell(_ accountInfo: MyBankAccount){
        
        bankImage.image = accountInfo.bank.bankLogo
        bankNameLabel.text = accountInfo.bankBookName?.description
        bankAccountLable.text = accountInfo.account
        deleteButton.isHidden = true
        dateLable.isHidden = true
        name.isHidden = true
        
    }
    
    func configureSecondCell(recentSentAccountList: RecentSentAccount){
        
        bankImage.image = recentSentAccountList.bank.bankLogo
        bankAccountLable.text = recentSentAccountList.bank.description + " " + recentSentAccountList.accountNumber
        bankNameLabel.text = ""
        name.text = recentSentAccountList.name
        dateLable.text = recentSentAccountList.createdAt
        deleteButton.isHidden = false
        dateLable.isHidden = false
        name.isHidden = false
        deleteButton.setImage(ImageLiterals.Transfer.icDelete, for: .normal)
        transferId = recentSentAccountList.transferId
        
    }
}
