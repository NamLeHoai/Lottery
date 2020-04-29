//
//  DialViewController.swift
//  quaySo
//
//  Created by Nam Le on 4/29/20.
//  Copyright © 2020 Nam Le. All rights reserved.
//

import UIKit

class DialViewController: UIViewController {
    
    var guessNumber: String?
    var number: Int?
    var passData: ((Reward) -> Void)?
    var alert: String?
    @IBOutlet weak var dialBT: UIButton!
    @IBOutlet weak var guessNumberLB: UILabel!
    
    enum Status{
        case dial
        case getRewarded
    }
    var bt = Status.dial
    override func viewDidLoad() {
        super.viewDidLoad()

        if let guessNB = guessNumber {
            guessNumberLB.text = "số bạn chọn là \(guessNB)"
        }
    }


    
    @IBAction func letDial(_ sender: Any) {
        if bt == Status.dial {
            number = Int.random(in: 0...100)
            dialBT.setTitle("Nhận thưởng", for: .normal)
        }
        
        alert = (number == Int(guessNumber ?? "") ) ? "trung thuong" : "chuc may man lan sau"
        guard let alert = alert else{return}
        passData?(Reward(reward: alert))
        navigationController?.popViewController(animated: true)
    }
    
}
