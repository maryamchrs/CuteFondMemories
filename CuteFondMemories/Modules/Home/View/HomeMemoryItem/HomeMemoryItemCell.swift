//
//  HomeMemoryItemCell.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 14/09/2024.
//

import UIKit

final class HomeMemoryItemCell: UICollectionViewCell {
    
    private var dataModel: HomeMemoryDataModel?
    
    @IBOutlet private(set) weak var imageIcon: UIImageView!
    @IBOutlet private(set) weak var bottomView: UIView!
    @IBOutlet private(set) weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        setColor()
        setFont()
    }
}

// MARK: - Public Methods
extension HomeMemoryItemCell {
    func bindData(_ model: HomeMemoryDataModel) {
        dataModel = model
        setupView()
    }
}

// MARK: - Private Methods
private extension HomeMemoryItemCell {
    func setupView() {
        guard let dataModel else { return }
        imageIcon.image = dataModel.image
        descriptionLabel.text = dataModel.description
    }
    
    func setColor() {
        backgroundColor = .systemYellow
    }
    
    func setFont() {}
}
