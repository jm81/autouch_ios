//
//  ViewController.swift
//  AuTouch
//
//  Created by Jared Morgan on 10/11/15.
//  Copyright © 2015 Jared Morgan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var box0: UILabel!
    @IBOutlet weak var box1: UILabel!
    @IBOutlet weak var box2: UILabel!
    @IBOutlet weak var box3: UILabel!
    @IBOutlet weak var box4: UILabel!
    @IBOutlet weak var box5: UILabel!
    @IBOutlet weak var box6: UILabel!
    @IBOutlet weak var box7: UILabel!
    @IBOutlet weak var box8: UILabel!
    @IBOutlet weak var box9: UILabel!
    @IBOutlet weak var box10: UILabel!
    @IBOutlet weak var box11: UILabel!
    
    var boxes: [UILabel] = []
    
    let touchURL = NSURL(string: "http://autouch.dev:6001/touches")
    let formatter = NSDateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        boxes += [
            box0, box1, box2, box3, box4, box5,
            box6, box7, box8, box9, box10, box11
        ]
        
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addTap(sender: AnyObject) {
        let networkOperation = NetworkOperation(url: touchURL!)
        
        let boxView = sender.view as! UILabel
        if let index = boxes.indexOf(boxView) {
            let params = [
                "box": index,
                "touch_at": formatter.stringFromDate(NSDate())
            ]
            networkOperation.post(["touch": params])
        }
    }
}
