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
    private let name = UILabel()
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
        
        name.do{
            $0.font = .font(.subhead3)
            $0.textColor = .gray600
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
    
    func configureCell(_ accountInfo: AccountInfo){
        
        bankImage.image = accountInfo.bankImage
        bankNameLabel.text = accountInfo.bankName
        bankAccountLable.text = accountInfo.bankAccount
        name.text = ""
        dateLable.text = ""
        deleteButton.isHidden = true
    }
    
    func configureSecondCell(recentSentAccountList: RecentSentAccount){
        
        var koreanBankName: String
        if recentSentAccountList.bank == "SHINHAN" {
            bankImage.image = ImageLiterals.Home.icBankShinhan
            koreanBankName = "신한"
        } else if recentSentAccountList.bank == "KOOKMIN" {
            bankImage.image = ImageLiterals.Home.icSmallBankKB
            koreanBankName = "국민"

        } else if recentSentAccountList.bank == "HANA" {
            bankImage.image = ImageLiterals.Home.icSmallBankHanna
            koreanBankName = "하나"

        } else if recentSentAccountList.bank == "KAKAO" {
            bankImage.image = ImageLiterals.Home.icSmallBankKakao
            koreanBankName = "카카오"

        } else {
            bankImage.image = ImageLiterals.Home.icSmallBankWoori
            koreanBankName = "우리"
        }
        bankNameLabel.text = ""
        name.text = recentSentAccountList.name
        dateLable.text = recentSentAccountList.createdAt
        bankAccountLable.text = koreanBankName + " " + recentSentAccountList.accountNumber
        deleteButton.setImage(ImageLiterals.Transfer.icDelete, for: .normal)
        
    }
}
