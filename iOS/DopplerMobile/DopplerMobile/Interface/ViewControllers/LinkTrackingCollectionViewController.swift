//
//  LinkTrackingCollectionViewController.swift
//  DopplerMobile
//
//  Created by Lucas Pelizza on 5/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import UIKit
import Bond

class LinkTrackingCollectionViewController: UICollectionViewController {
    
    class func instantiateFromStoryboard(viewModel: LinkTrackingCollectionViewModel) -> LinkTrackingCollectionViewController {
        let storyboard = UIStoryboard(name: StoryboardName.Reports, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! LinkTrackingCollectionViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
    // MARK: - Properties
    fileprivate let reuseIdentifier = "LinkCollectionViewCell"
    fileprivate let sectionInsets = UIEdgeInsets(top: 10.0, left: 0.0, bottom: 20.0, right: 0.0)
    fileprivate let itemsPerRow: CGFloat = 1
    fileprivate var viewModel: LinkTrackingCollectionViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let adjustForTabbarInsets = UIEdgeInsetsMake(0, 0, 80, 0);
        collectionView!.contentInset = adjustForTabbarInsets
        collectionView!.scrollIndicatorInsets = adjustForTabbarInsets
        //TODO: we should remove the comment but first we need to solve the problem with section's header
//        bindingView()
    }
    
    func bindingView() {
        viewModel.links.bind(to: collectionView!) { links, indexPath, collectionView in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LinkCollectionViewCell.Identifier,
                                            for: indexPath) as! LinkCollectionViewCell
            cell.configure(links[indexPath.row])
            return cell
        }
    }
}

// MARK: - UICollectionViewDataSource
extension LinkTrackingCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.links.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! LinkCollectionViewCell
        cell.configure(viewModel.links[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionElementKindSectionFooter:
                return UICollectionReusableView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
            case UICollectionElementKindSectionHeader:
                let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "LinksHeaderCollectionReusableView", for: indexPath) as! LinksHeaderCollectionReusableView
                reusableview.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: CGFloat(LinksHeaderCollectionReusableView.Height))
                reusableview.configure(totalClicks: viewModel.totalClicks)
                return reusableview
            default:  fatalError("Unexpected element kind")
        }
    }
}

extension LinkTrackingCollectionViewController : UICollectionViewDelegateFlowLayout {
   
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: CGFloat(LinkCollectionViewCell.Height))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
