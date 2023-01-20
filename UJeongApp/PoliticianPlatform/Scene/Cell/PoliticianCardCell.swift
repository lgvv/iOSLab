//
//  PoliticianCardCell.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/03.
//

import UIKit
import Combine
import Nuke

final class PoliticianCardCell: BaseCollectionViewCell {
    typealias ViewModel = PoliticianCardCellViewModel
    
    private var cancelBag = Set<AnyCancellable>()
    // MARK: - Binding
    
    func bind(viewModel: ViewModel) {
        viewModel.$infomation
            .receive(on: DispatchQueue.main)
            .sink { [weak self] information in
                guard let self else { return }
                
                let assetName = "서울시-" + information.gu.rawValue + ".jpeg"
                self.thumbnailImageView.image = UIImage(assetName: assetName)
                
                let basicInfo = information.name + " (" + information.gu.rawValue + ")"
                self.basicInfoLabel.text = basicInfo
                self.partyLabel.text = information.party.rawValue
                
            }.store(in: &cancelBag)
    }
    
    override func initialize() {
        self.configureUI()
    }
    
    // MARK: - UIComponents
    
    private lazy var thumbnailImageView: UIImageView = {
        $0.backgroundColor = .blue.withAlphaComponent(0.2)
        return $0
    }(UIImageView()) // 이미지
    
    private lazy var stackView: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .top
        return $0
    }(UIStackView())
    
    private lazy var basicInfoLabel = UILabel() // 이름
    private lazy var partyLabel = UILabel() // 당
    
    private lazy var descriptionLabel: UILabel = {
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 15)
        return $0
    }(UILabel()) // 강점 3줄
}

extension PoliticianCardCell {
    func configureUI() {
        layer.cornerRadius = 12.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 8.0
        
        contentView.layer.cornerRadius = 12.0
        contentView.layer.borderWidth = 2
        
        contentView.backgroundColor = .systemBackground // 이게 설정되어야 그림자 잘보임
        
        contentView.addSubview(thumbnailImageView)
        thumbnailImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(thumbnailImageView.snp.width).multipliedBy(1.2)
        }
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(basicInfoLabel)
        stackView.addArrangedSubview(partyLabel)
        stackView.snp.makeConstraints {
            $0.top.equalTo(thumbnailImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        
    }
}
