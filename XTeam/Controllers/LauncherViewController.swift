//
//  LauncherViewController.swift
//  XTeam
//
//  Created by paly on 12/11/19.
//  Copyright © 2019 paly. All rights reserved.
//

import UIKit

class LauncherViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openDesireActivity()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func openDesireActivity() {
        
       let vc = UIStoryboard.init(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "StylistCalendarViewController")
        self.navigationController?.pushViewController(vc, animated: true)
        return
    }
}

extension UINavigationController {
    func getPreviousViewController() -> UIViewController? {
        let count = viewControllers.count
        guard count > 1 else { return nil }
        return viewControllers[count - 2]
    }
}

