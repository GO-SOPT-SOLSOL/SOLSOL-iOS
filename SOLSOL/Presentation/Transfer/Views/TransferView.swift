//
//  TransferView.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

class TransferView: UIView {
    
    //MARK: - UIComponents
    
    private let sendToWhoLabel = UILabel()
    private let searchTextField = UITextField()
    private let SearchButton = UIButton()
    
    //MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setDelegate()
        setStyle()
        hierarchy()
        setLayout()
        
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func setStyle(){
        
        self.backgroundColor = .white
        
        sendToWhoLabel.do{
            $0.text = "누구에게 보낼까요?"
            $0.font = .font(.display4)
        }
        
        searchTextField.do{
            $0.attributedPlaceholder = NSAttributedString(string: "받는 사람 이름, 계좌번호, 은행 검색", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray250])
            $0.font = .font(.body4)
            $0.layer.cornerRadius = 13
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.gray150.cgColor
            $0.setLeftPaddingPoints(18)
            //
        }
        
        SearchButton.do{
            $0.setImage(UIImage(named: "icSearchDefault"), for: .normal)
        }
        
    }
    
    func hierarchy(){
        
        self.addSubviews(sendToWhoLabel, searchTextField)
        
        searchTextField.addSubview(SearchButton)
        
    }
    
    func setLayout(){
        
        sendToWhoLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(18)
            $0.top.equalToSuperview().inset(99)
        }
        
        searchTextField.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(18)
            $0.top.equalTo(sendToWhoLabel.snp.bottom).offset(37)
            $0.width.equalTo(339)
            $0.height.equalTo(48)
        }
        
        SearchButton.snp.makeConstraints{
            $0.size.equalTo(36)
            $0.top.equalToSuperview().inset(6)
            $0.leading.equalToSuperview().inset(295)
        }
    }
    
    func setDelegate(){
        
        searchTextField.delegate = self
    }

}
    
extension TransferView: UITextFieldDelegate{

    // 입력 시 textField 테두리 색 변경
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blue500.cgColor
    }

}
