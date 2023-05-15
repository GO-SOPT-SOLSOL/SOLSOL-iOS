//
//  TransferTableViewCell.swift
//  SOLSOL
//
//  Created by 변희주 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

final class TransferTableViewCell: UITableViewCell {

    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()
    private let pageControl = UIPageControl()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {
        collectionView.do {
            $0.register(TransferCollectionViewCell.self, forCellWithReuseIdentifier: TransferCollectionViewCell.className)
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.isPagingEnabled = true
            $0.dataSource = self
            $0.delegate = self
            $0.backgroundColor = .white
        }
        
        flowLayout.do {
            $0.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 241)
            $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            $0.minimumLineSpacing = 0
            $0.minimumInteritemSpacing = 0
            $0.scrollDirection = .horizontal
            $0.estimatedItemSize = .zero
        }
        
        pageControl.do {
            $0.numberOfPages = 2
            $0.pageIndicatorTintColor = .gray200
            $0.currentPage = 0
            $0.currentPageIndicatorTintColor = .gray600
            $0.isUserInteractionEnabled = false
            $0.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            $0.backgroundStyle = .minimal
            $0.allowsContinuousInteraction = false
        }
        
        separatorInset.left = 0
        selectionStyle = .none
        backgroundColor = .gray100
    }
    
    func setLayout() {
        contentView.addSubviews(collectionView,pageControl)
        
        collectionView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(421)
        }
        
        pageControl.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(10)
        }
    }
}

extension TransferTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:TransferCollectionViewCell.className, for: indexPath) as? TransferCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.bounds.size.width
        let x = scrollView.contentOffset.x + (width/2)
        
        let newPage = Int(x/width)
        if pageControl.currentPage != newPage {
            pageControl.currentPage = newPage
        }
    }
    
}

