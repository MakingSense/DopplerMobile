//
//  AccountViewController.swift
//  DopplerMobile
//
//  Created by Brian Sztamfater on 16/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import UIKit
import Bond
import Kingfisher

class AccountViewController: UITableViewController, NavigationDelegate {
    
    private enum Options: Int {
        case Preferences = 3, Logout
    }
    
    // MARK: UI Properties
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblCompanyEmail: UILabel!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblAccountType: UILabel!
    @IBOutlet weak var lblCellUsername: UILabel!
    @IBOutlet weak var lblCellAccountType: UILabel!
    
    // MARK: Other properties
    var viewModel: AccountViewModel!
    
    // MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }
    
    private func setupUI() {
        self.navigationController!.navigationBar.topItem?.title = "My Account".localized
    }
    
    private func bindViewModel() {
        // lblCompanyEmail bindings
        viewModel.companyEmail.bind(to: lblCompanyEmail)
        
        // lblCompanyName bindings
        viewModel.companyName.bind(to: lblCompanyName)
        
        // lblAccountType bindings
        viewModel.accountType.bind(to: lblAccountType)
        
        // lblCellAccountType bindings
        viewModel.accountType.bind(to: lblCellAccountType)
        
        // lblCellUsername bindings
        viewModel.username.bind(to: lblCellUsername)
        
        // imgAvatar bindings
        imgAvatar.kf.setImage(with: viewModel.avatar)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case Options.Preferences.rawValue:
            viewModel.showPreferences()
            break
        case Options.Logout.rawValue:
            viewModel.logout()
            break
        default:
            break
        }
    }
    
    // TODO: implement a generic way to navigate between view model
    func showViewModel(_ identifier: String) {
        performSegue(withIdentifier: identifier, sender: self)
    }
}
