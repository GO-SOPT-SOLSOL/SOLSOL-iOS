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
    public let searchTextField = UITextField()
    private let SearchButton = UIButton()
    
    private lazy var segmentedControl = SOLSegmentedControl(items: ["맞춤", "친구/그룹", "연락처"])
    
   
    private var selectedIndex: Int = 0
    
     let userCustomView = UserCustomViewController()
    private let friendGroupView = UIViewController()
    private let contactsView = UIViewController()
    private lazy var pageViewController =  UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    var dataViewControllers: [UIViewController] {
        [self.userCustomView, self.friendGroupView, self.contactsView]
    }
    
    var currentPage: Int = 0 {
        didSet {
            // from segmentedControl -> pageViewController 업데이트
            print(oldValue, self.currentPage)
            let direction: UIPageViewController.NavigationDirection = oldValue <= self.currentPage ? .forward : .reverse
            self.pageViewController.setViewControllers(
                [dataViewControllers[self.currentPage]],
                direction: direction,
                animated: true,
                completion: nil
            )
        }
    }
    
    
    //MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        hierarchy()
        setDelegate()
        setStyle()
        setLayout()
        
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func hierarchy(){
        
        self.addSubviews(sendToWhoLabel, searchTextField, segmentedControl, pageViewController.view)
        
        searchTextField.addSubview(SearchButton)
        
        
    }
    
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
            
        }
        
        SearchButton.do{
            $0.setImage(UIImage(named: "icSearchDefault"), for: .normal)
        }
        
        segmentedControl.do{
            
            //선택안된 segment버튼 폰트
            $0.setTitleTextAttributes([
                NSAttributedString.Key.foregroundColor: UIColor.gray400,
                NSAttributedString.Key.font: UIFont.font(.body5)
            ], for: .normal)
            
            //선택된 segment버튼 폰트
            $0.setTitleTextAttributes([
                NSAttributedString.Key.foregroundColor: UIColor.gray600,
                NSAttributedString.Key.font: UIFont.font(.subhead2)
            ], for: .selected)
            
            
            $0.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
            
            $0.addTarget(self, action: #selector(changeValue(control:)), for: .valueChanged)
            
            
            //default 값을 '맞춤'으로
            $0.selectedSegmentIndex = 0
            
        }
        
        
        userCustomView.do{
            
            $0.view.backgroundColor = .black
//            hiddenKeyboard(viewcontroller: userCustomView)
        }
        
        friendGroupView.do{
            $0.view.backgroundColor = .red
//            hiddenKeyboard(viewcontroller: friendGroupView)

        }
        
        contactsView.do{
            $0.view.backgroundColor = .blue
//            hiddenKeyboard(viewcontroller: contactsView)

        }
        
        pageViewController.do{
            $0.setViewControllers([self.dataViewControllers[0]], direction: .forward, animated: true)
            
        }
        
    }
    
    func setLayout(){
        
        sendToWhoLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(18)
            $0.top.equalToSuperview().inset(99)
        }
        
        searchTextField.snp.makeConstraints{
            $0.leading.equalTo(sendToWhoLabel.snp.leading)
            $0.trailing.equalToSuperview().inset(18)
            $0.top.equalTo(sendToWhoLabel.snp.bottom).offset(37)
            $0.height.equalTo(48)
        }
        
        SearchButton.snp.makeConstraints{
            $0.size.equalTo(36)
            $0.top.equalToSuperview().inset(6)
            $0.leading.equalToSuperview().inset(295)
        }
        
        segmentedControl.snp.makeConstraints{
            $0.leading.equalTo(searchTextField.snp.leading)
            $0.trailing.equalTo(searchTextField.snp.trailing)
            $0.top.equalTo(SearchButton.snp.bottom).offset(11)
            $0.height.equalTo(44)
            
        }
        
        pageViewController.view.snp.makeConstraints{
            $0.top.equalTo(segmentedControl.snp.bottom)
            $0.trailing.bottom.leading.equalToSuperview()
        }
        
        
    }
    
    func setDelegate(){
        
        searchTextField.delegate = self
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
    }
    
//    func hiddenKeyboard(viewcontroller: UIViewController){
//
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
//
//        viewcontroller.view.addGestureRecognizer(tapGestureRecognizer)
//
//    }
    
    
//    @objc func didTapView(_ sender: UITapGestureRecognizer) {
//        searchTextField.endEditing(true)
//    }
//
    @objc
    func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        searchTextField.endEditing(true)
    }
    
    @objc
    private func changeValue(control: UISegmentedControl) {
        // 코드로 값을 변경하면 해당 메소드 호출 x
        self.currentPage = control.selectedSegmentIndex
    }
}


//MARK: - Extensions

extension TransferView: UITextFieldDelegate{
    
    
    // 입력 시 textField 테두리 색 변경
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blue500.cgColor
    }
    
    //입력 끝났을 때, textField 테두리 색 원래대로 돌아오기
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.gray150.cgColor
    }
}




extension TransferView: UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard
            let index = self.dataViewControllers.firstIndex(of: viewController),
            index - 1 >= 0
        else { return nil }
        return self.dataViewControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard
            let index = self.dataViewControllers.firstIndex(of: viewController),
            index + 1 < self.dataViewControllers.count
        else { return nil }
        return self.dataViewControllers[index + 1]
    }
}

extension TransferView: UIPageViewControllerDelegate{
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {
        guard
            let viewController = pageViewController.viewControllers?[0],
            let index = self.dataViewControllers.firstIndex(of: viewController)
        else { return }
        self.currentPage = index
        self.segmentedControl.selectedSegmentIndex = index
        
       
    }
}
