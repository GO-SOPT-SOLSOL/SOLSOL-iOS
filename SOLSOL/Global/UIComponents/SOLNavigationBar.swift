//
//  SOLNavigationBar.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/16.
//

import UIKit

import SnapKit
import Then

final class SOLNavigationBar: UIView {

    @frozen
    enum NavigationBarType {
        case home
        case back

        var leadingInset: CGFloat {
            switch self {
            case .back: return 10
            case .home: return 18
            }
        }
    }

    private lazy var leftItem = UIButton().then {
        $0.addTarget(self, action: #selector(handleLeftItemTap), for: .touchUpInside)
    }

    private let chatButton = UIButton().then {
        $0.setImage(ImageLiterals.NavigationBar.icChatBot, for: .normal)
    }

    private let voiceButton = UIButton().then {
        $0.setImage(ImageLiterals.NavigationBar.icVoice, for: .normal)
    }

    private let homeButton = UIButton().then {
        $0.setImage(ImageLiterals.NavigationBar.icHomeOutline, for: .normal)
    }

    private lazy var rightItemStackView = UIStackView(arrangedSubviews: [
        chatButton,
        voiceButton,
        homeButton
    ]).then {
        $0.axis = .horizontal
        $0.spacing = 16
    }

    private weak var viewController: UIViewController?
    private let type: NavigationBarType

    init(_ viewController: UIViewController, leftItem type: NavigationBarType) {
        self.viewController = viewController
        self.type = type
        super.init(frame: .zero)
        setLeftItem()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



}


private extension SOLNavigationBar {
    func setLeftItem() {
        switch type {
        case .home:
            leftItem.setTitleColor(.gray600, for: .normal)
            leftItem.titleLabel?.font = .font(.headline)
            leftItem.setTitle(NavigationBar.leftItemTitle.home, for: .normal)
        case .back:
            leftItem.setImage(ImageLiterals.NavigationBar.icArrowLeft, for: .normal)
        }
    }

    func setLayout() {
        [leftItem, rightItemStackView].forEach {
            addSubview($0)
        }

        leftItem.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(type.leadingInset)
            make.centerY.equalToSuperview()
        }

        rightItemStackView.snp.makeConstraints { make in
            make.centerY.equalTo(leftItem)
            make.trailing.equalToSuperview().inset(18)
        }
    }

}

// MARK: - @objc methods

extension SOLNavigationBar {

    @objc
    private func handleLeftItemTap() {
        switch type {
        case .back:
            viewController?.navigationController?.popViewController(animated: false)
        case .home:
            print("home button tapped !")
        }
    }

}
