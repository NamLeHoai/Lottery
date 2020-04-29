//
//  ViewController.swift
//  quaySo
//
//  Created by Nam Le on 4/29/20.
//  Copyright © 2020 Nam Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alertLB: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var guessLB: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Nhập 1 số bất kì"
    }


    @IBAction func goDial(_ sender: Any) {
        let dialVC = DialViewController()
        dialVC.guessNumber = guessLB.text
        dialVC.passData = { [weak self] data in
            guard let strongSelf = self else {return}
            strongSelf.alertLB.text = data.reward
        }
        navigationController?.pushViewController(dialVC, animated: true)
    }
}

