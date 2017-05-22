//
//  CampaignPreviewViewController.swift
//  DopplerMobile
//
//  Created by Mauro Maldini on 7/9/16.
//  Copyright © 2016 Making Sense. All rights reserved.
//

import UIKit
import KRProgressHUD
import Bond

final class CampaignPreviewViewController: UIViewController {
    
    @IBOutlet private weak var wvCampaignPreview: UIWebView!
    var viewModel: CampaignPreviewViewModel!
    var campaignId: Int?
    
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "PREVIEW_TEXT".localized
        viewModel = CampaignPreviewViewModel(campaignsService: CampaignsService(), campaignId: campaignId!)
        bindingView()
    }
        
    func bindingView() {
        
        viewModel.urlPreview.map{urlPreview in
            guard let url = urlPreview else {
                return ""
            }
            return "\(url)"
            }.bind(to: lblTitle)
        viewModel.urlPreview
            .observeNext { [weak self] urlPreview in
                guard let strongSelf = self else { return }
                guard let urlToLoad = urlPreview else { return }
                let requestObj = URLRequest(url: urlToLoad)
                strongSelf.wvCampaignPreview.loadRequest(requestObj);
            }.dispose(in: reactive.bag)
        viewModel.isBusy
            .observeNext { isBusy in
                if isBusy {
                    KRProgressHUD.show()
                } else {
                    KRProgressHUD.dismiss()
                }
            }.dispose(in: reactive.bag)
        btnShare.reactive.tap
            .observe { [weak self] _ in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.viewModel.sharePreview()
            }.dispose(in: reactive.bag)
        
        viewModel.activityShare
            .observeNext { [weak self] activityShare in
                guard let strongSelf = self, let activity = activityShare else {
                    return
                }
                strongSelf.present(activity, animated: true, completion: nil)
            }.dispose(in: reactive.bag)
        
        viewModel.shareCanExecute.bind(to: btnShare.reactive.isEnabled)
    }
    
    @IBAction func onClose(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    
}
