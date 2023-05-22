//
//  SOLButton.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/16.
//

import UIKit

final class SOLFilledButton: UIButton {

    private let color: UIColor
    private let text: String?
    private let textColor: UIColor?
    private let image: UIImage?
    private let imagePlacement: NSDirectionalRectEdge?
    private let font: UIFont?
    private let imagePadding: CGFloat?

    /// 이미지가 있다면 어디에 위치시킬지 padding과 같이 넘겨줍니다.
    init(backgroundColor: UIColor,
         text: String? = nil,
         textColor: UIColor? = nil,
         image: UIImage? = nil,
         imagePlacement: NSDirectionalRectEdge? = nil,
         imagePadding: CGFloat? = nil,
         font: UIFont? = nil,
         cornerRadius: CGFloat = 0
    ) {
        self.color = backgroundColor
        self.text = text
        self.image = image
        self.font = font
        self.textColor = textColor
        self.imagePlacement = imagePlacement
        self.imagePadding = imagePadding
        super.init(frame: .zero)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        setConfig()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension SOLFilledButton {
    private func setConfig() {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = color
        if let text {
            var titleAttr = AttributedString(text)
            titleAttr.font = self.font
            config.attributedTitle = titleAttr
            config.baseForegroundColor = textColor
        }

        guard let image = self.image else {
            self.configuration = config
            return
        }

        config.image = image
        guard let imagePlacement,
              let imagePadding else {
            self.configuration = config
            return
        }
        config.imagePlacement = imagePlacement
        config.imagePadding = imagePadding

        self.configuration = config
    }

}
