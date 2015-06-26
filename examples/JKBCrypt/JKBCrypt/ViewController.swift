//
//  ViewController.swift
//  JKBCrypt
//
//  Created by Joe Kramer on 6/19/15.
//  Copyright (c) 2015 Joe Kramer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Property List

    @IBOutlet weak var hashLabel: UILabel!
    @IBOutlet weak var hashInputTextField: UITextField!
    @IBOutlet weak var saltInputTextField: UITextField!
    @IBOutlet weak var compareLabel: UILabel!
    @IBOutlet weak var compareInputTextField: UITextField!

    // MARK: - Action Methods

    @IBAction func generateSaltPressed() {
        self.hashLabel.text = self.generateSalt()
    }

    @IBAction func createHashPressed() {
        // var salt = "$2a$10$L5TwXCAkaJdQAEWj1xlV9O" // 1H6TfvotmP9NvLZ3KXLFuqySNxYwu7i

        if let hash = JKBCrypt.hashPassword(self.hashInputTextField.text, withSalt: self.generateSalt()) {
            self.hashLabel.text = hash
        }
        else {
            self.hashLabel.text = "Hash generation failed"
        }

        let sb: UIStoryboard = UIStoryboard(name: "sbname", bundle: nil)
        var vc: ViewController = sb.instantiateViewControllerWithIdentifier("thisVC") as! ViewController
    }

    @IBAction func compareHashPressed() {
        if let compare = JKBCrypt.hashPassword(self.compareInputTextField.text, withSalt:self.hashLabel.text!) {
            if compare == self.hashLabel.text {
                self.compareLabel.text = "The phrase was a SUCCESS!"
            }
            else {
                self.compareLabel.text = "Compare phrase does NOT match hashed value"
            }
        }
        else {
            self.compareLabel.text = "Compare hash generation failed"
        }
    }

    @IBAction func hideKeyboard() {
        self.hashInputTextField.resignFirstResponder()
        self.saltInputTextField.resignFirstResponder()
        self.compareInputTextField.resignFirstResponder()
    }

    // MARK: - Internal Methods

    func generateSalt() -> String {
        let rounds : Int? = self.saltInputTextField.text.toInt()

        var salt : String
        if rounds != nil && rounds >= 4 && rounds <= 31 {
            salt = JKBCrypt.generateSaltWithNumberOfRounds(UInt(rounds!))
        }
        else {
            salt = JKBCrypt.generateSalt()
        }

        return salt
    }
}
