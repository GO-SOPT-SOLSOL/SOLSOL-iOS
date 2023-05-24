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
    
    weak var pushDelegate: TransferButtonAction?
    
    var accountList: [MyBankAccount?] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    var currentAccountList: [Receiver?] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()
    private let pageControl = UIPageControl()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - UI Components
    
    func setStyle() {
        
        // MARK: - collectionView의 모든 Cell이 가운데 정렬 되도록 설정
        
        collectionView.do {
            $0.register(TransferCollectionViewCell.self, forCellWithReuseIdentifier: TransferCollectionViewCell.className)
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.isPagingEnabled = false
            $0.dataSource = self
            $0.delegate = self
            $0.backgroundColor = .clear
            $0.isScrollEnabled = true
            $0.contentInsetAdjustmentBehavior = .never // <- 내부적으로 safe area에 의해 가려지는 것을 방지하기 위해서 자동으로 inset조정해 주는 것을 비활성화
            $0.decelerationRate = .fast // <- 스크롤이 빠르게 되도록 (페이징 애니메이션같이 보이게하기 위함)
        }
        
        flowLayout.do {
            $0.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.91, height: 241)
            $0.sectionInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
            $0.minimumLineSpacing = 8
            $0.minimumInteritemSpacing = 8
            $0.scrollDirection = .horizontal
        }
        
        pageControl.do {
            $0.pageIndicatorTintColor = .gray200
            $0.currentPage = 0
            $0.currentPageIndicatorTintColor = .gray600
            $0.isUserInteractionEnabled = false
            $0.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
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
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(241)
        }
        
        pageControl.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
}

extension TransferTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = accountList.count
        return accountList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:TransferCollectionViewCell.className, for: indexPath) as? TransferCollectionViewCell else { return UICollectionViewCell() }
        
        let accountList = accountList[indexPath.row]
        cell.configureCell(accountList: accountList!)
        cell.currentAccountList = currentAccountList
        cell.pushDelegate = self
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
    
    // MARK: - collectionView의 모든 Cell이 가운데 정렬 되도록 설정

    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
      ) {
        let scrolledOffsetX = targetContentOffset.pointee.x + scrollView.contentInset.left
        let cellWidth = UIScreen.main.bounds.width * 0.91 + 8
        let index = round(scrolledOffsetX / cellWidth)
        targetContentOffset.pointee = CGPoint(x: index * cellWidth - scrollView.contentInset.left, y: scrollView.contentInset.top)
      }
    
}

extension TransferTableViewCell: TransferButtonAction {
    func transferButtonTapped() {
        pushDelegate?.transferButtonTapped()
    }
}

