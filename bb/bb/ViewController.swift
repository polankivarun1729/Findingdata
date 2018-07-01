//
//  ViewController.swift
//  bb
//
//  Created by Varun Kumar on 01/07/18.
//  Copyright © 2018 Varun Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        if let bytes = deviceRemainingFreeSpaceInBytes() {
            print("free space: \(bytes)")
        } else {
            print("failed")
        }
    }

    func deviceRemainingFreeSpaceInBytes() -> Int64? {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
        guard
            let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: documentDirectory),
            let freeSize = systemAttributes[.systemFreeSize] as? NSNumber
        
        else  {
                // something failed
                return nil
        }
        return freeSize.int64Value
    }


}

