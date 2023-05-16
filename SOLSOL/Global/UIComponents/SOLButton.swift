//
//  SOLButton.swift
//  SOLSOL
//
//  Created by 김민재 on 2023/05/16.
//

import UIKit

final class SOLFilledButton: UIButton {

    @frozen
    enum ImagePlacementType {
        case leading
        case trailing
    }

    private let color: UIColor
    private let text: String
    private let textColor: UIColor
    private let image: UIImage?
    private let imagePlacement: ImagePlacementType?
    private let font: UIFont

    /// 이미지가 있다면 어디에 위치시킬지 같이 넘겨줍니다.
    init(backgroundColor: UIColor,
         text: String,
         textColor: UIColor,
         image: UIImage? = nil,
         imagePlacement: ImagePlacementType? = .none,
         font: UIFont,
         cornerRadius: CGFloat
    ) {
        self.color = backgroundColor
        self.text = text
        self.image = image
        self.font = font
        self.textColor = textColor
        self.imagePlacement = imagePlacement
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
        var titleAttr = AttributedString(text)
        titleAttr.font = self.font
        config.attributedTitle = titleAttr
        config.baseBackgroundColor = color
        config.baseForegroundColor = textColor

        guard let image = self.image else {
            self.configuration = config
            return
        }
        config.image = image
        if imagePlacement == .leading {
            config.imagePlacement = .leading
        } else {
            config.imagePlacement = .trailing
        }
        config.imagePadding = 7
        self.configuration = config
    }

}
