//
//  MLBusinessTouchpointsCarouselView.swift
//  MLBusinessComponents
//
//  Created by Vicente Veltri on 30/04/2020.
//

import Foundation

class MLBusinessTouchpointsCarouselView: MLBusinessTouchpointsBaseView {

    private let collectionView: MLBusinessTouchpointsCarouselCollectionView = {
        let collectionView = MLBusinessTouchpointsCarouselCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private var model: MLBusinessTouchpointsCarouselModel?

    required init?(configuration: Codable?) {
        super.init(configuration: configuration)
        setup()
        setupConstraints()
        update(with: configuration)
    }

    private func setup() {
        addSubview(collectionView)
        collectionView.delegate = self
    }
    
    private func setupConstraints() {
        topConstraint = collectionView.topAnchor.constraint(equalTo: topAnchor)
        topConstraint?.isActive = true
        leftConstraint = collectionView.leftAnchor.constraint(equalTo: leftAnchor)
        leftConstraint?.isActive = true
        bottomConstraint = collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        bottomConstraint?.isActive = true
        rightConstraint = collectionView.rightAnchor.constraint(equalTo: rightAnchor)
        rightConstraint?.isActive = true
    }

    override func update(with configuration: Codable?) {
        guard let model = configuration as? MLBusinessTouchpointsCarouselModel else { return }
        self.model = model
        collectionView.update(with: model.getItems())
    }
    
    override func getVisibleItems() -> [Trackable]? {
        return collectionView.getTrackables()
    }
}

extension MLBusinessTouchpointsCarouselView: MLBusinessTouchpointsCarouselCollectionViewProtocol {
    func trackPrints(prints: [Trackable]?) {
        delegate?.trackPrints(prints: prints)
    }
    
    func trackTap(with selectedIndex: Int?, deeplink: String?, trackingId: String?) {
        delegate?.trackTap(with: selectedIndex, deeplink: deeplink, trackingId: trackingId)
    }
}