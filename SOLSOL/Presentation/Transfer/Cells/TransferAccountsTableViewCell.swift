//
//  TransferTableViewCell.swift
//  SOLSOL
//
//  Created by 곽성준 on 2023/05/19.
//

import UIKit

final class TransferAccountsTableViewCell: UITableViewCell {
    
    static let identifier = "TransferAccountsTableViewCell"
    
    private let bankImage = UIImageView()
    private let bankNameLabel = UILabel()
    private let bankAccountLable = UILabel()
    private let dateLable = UILabel()
    private let deleteButton = UIButton()
    
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
        
//        deleteButton.do{
//            $0.setImage(ImageLiterals.Transfer.icDelete, for: .normal)
//        }
        
    }
    
    func hierarchy(){
        
        contentView.addSubviews(bankImage, bankNameLabel, bankAccountLable, deleteButton, dateLable)
        
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
        
        bankAccountLable.snp.makeConstraints{
            $0.top.equalTo(bankNameLabel.snp.bottom).offset(2)
            $0.leading.equalTo(bankImage.snp.trailing).offset(11)
        }
        
        deleteButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(30)
        }
        
        dateLable.snp.makeConstraints{
            $0.leading.equalTo(bankNameLabel.snp.trailing).offset(4)
            $0.centerY.equalTo(bankNameLabel)
        }
        
    }
    
    func configureCell(_ accountInfo: MyBankAccount){
        
        bankImage.image = accountInfo.bank.bankLogo
        bankNameLabel.text = accountInfo.bankBookName?.description
        bankAccountLable.text = accountInfo.account
        
    }
    
    func configureSecondCell(_ accountInfo: AccountInfoWithDate){
        
        bankImage.image = accountInfo.bankImage
        dateLable.text = accountInfo.date
        bankNameLabel.text = accountInfo.name
        bankAccountLable.text = accountInfo.bankAccount
        deleteButton.setImage(accountInfo.trashBinImage, for: .normal)
        
    }
}
