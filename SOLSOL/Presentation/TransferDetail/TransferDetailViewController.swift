//
//  TransferDetailViewController.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class TransferDetailViewController: UIViewController {

    private enum Size {
        static let navigationBarheight = 44
    }

    private lazy var navigationBar = SOLNavigationBar(self, leftItem: .back)

    private lazy var button = SOLFilledButton(backgroundColor: .gray150,
                                         text: "다음",
                                         textColor: .black,
                                         image: ImageLiterals.NavigationBar.icArrowLeft,
                                         imagePlacement: .trailing,
                                         imagePadding: 0,
                                         font: .font(.headline),
                                              cornerRadius: 14

    ).then {
        $0.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
    
}

private extension TransferDetailViewController {

    func setStyle() {
        view.backgroundColor = .gray100
    }

    func setLayout() {
        view.addSubview(navigationBar)
        view.addSubview(button)

        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Size.navigationBarheight)
        }

        button.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(18)
        }
    }

    @objc func handleTap() {
        print("button tapped !")
    }

}
