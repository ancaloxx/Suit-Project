//
//  ViewController.swift
//  LoxProject
//
//  Created by anca dev on 22/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var player1: UIImageView!
    @IBOutlet weak var player2: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var selectLine: UIView!
    @IBOutlet weak var hitung: UILabel!
    
    var SLx = 176.0
    var P1x = 16.0
    var P2x = 227.0
    var indx = 0.0
    var indxP1 = 0.0
    var P1cur = false
    var selectOneB = false
    var selectTwoB = true
    var selectThreeB = false
    var player1Option = 0
    var player2Option = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player2.transform = CGAffineTransformMakeScale(-1, 1)
        selectLine.frame = CGRect(x: 176, y: 791, width: 40, height: 4)
        hitung.isHidden = true
    }
    
    func player1Shake() {
        indxP1 = 0.0
        
        for durr in 1...5 {
            for dur in 1...30 {
                Timer.scheduledTimer(withTimeInterval: 0.005 * indxP1, repeats: false) { (Timer) in
                    if self.P1cur {
                        self.P1x += 0.8
                        self.P2x -= 0.8
                    } else {
                        self.P1x += 4
                        self.P2x -= 4
                    }
                    
                    self.player1.frame = CGRect(x: self.P1x, y: 351, width: 150, height: 150)
                    self.player2.frame = CGRect(x: self.P2x, y: 351, width: 150, height: 150)
                }
                
                indxP1 += 1
            }
            
            for dur in 1...30 {
                Timer.scheduledTimer(withTimeInterval: 0.005 * indxP1, repeats: false) { (Timer) in
                    self.P1x -= 0.8
                    self.P2x += 0.8
                    
                    self.player1.frame = CGRect(x: self.P1x, y: 351, width: 150, height: 150)
                    self.player2.frame = CGRect(x: self.P2x, y: 351, width: 150, height: 150)
                    
                    if durr == 5 {
                        self.player1.image = UIImage(named: "\(self.player1Option)")
                        self.player2.image = UIImage(named: "\(self.player2Option)")
                        
                        if (self.player1Option == 1 && self.player2Option == 2) || (self.player1Option == 2 && self.player2Option == 3) || (self.player1Option == 2 && self.player2Option == 3) || (self.player1Option == 3 && self.player2Option == 1) {
                            self.hitung.isHidden = false
                            self.hitung.text = "Player 1 win"
                        } else if (self.player1Option == 1 && self.player2Option == 3) || (self.player1Option == 2 && self.player2Option == 1) || (self.player1Option == 3 && self.player2Option == 2) {
                            self.hitung.isHidden = false
                            self.hitung.text = "Bot win"
                        } else if self.player1Option == self.player2Option {
                            self.hitung.isHidden = false
                            self.hitung.text = "Draw"
                        }
                    }
                }
                
                indxP1 += 1
                P1cur = true
            }
        }
    }
    
    @IBAction func selectOne(_ sender: UIButton) {
        indx = 0.0
        hitung.isHidden = true
        
        for dur in 1...40 {
            Timer.scheduledTimer(withTimeInterval: 0.01 * indx, repeats: false) { (Timer) in
                if self.selectTwoB {
                    self.SLx -= 2.625
                } else if self.selectThreeB {
                    self.SLx -= 5.25
                }
                
                if self.SLx == 71.0 {
                    self.selectOneB = true
                    self.selectTwoB = false
                    self.selectThreeB = false
                    self.player2Option = Int.random(in: 1...3)
                    
                    self.player1Shake()
                }
                
                self.selectLine.frame = CGRect(x: self.SLx, y: 791.0, width: 40, height: 4)
            }
            
            indx += 1
        }
        
        player1Option = 1
    }
    
    @IBAction func selectTwo(_ sender: UIButton) {
        indx = 0.0
        hitung.isHidden = true
        
        if SLx != 176.0 {
            for dur in 1...40 {
                Timer.scheduledTimer(withTimeInterval: 0.01 * indx, repeats: false) { (Timer) in
                    if self.selectOneB {
                        self.SLx += 2.625
                    } else if self.selectThreeB {
                        self.SLx -= 2.625
                    }
                    
                    if self.SLx == 176.0 {
                        self.selectOneB = false
                        self.selectTwoB = true
                        self.selectThreeB = false
                        self.player2Option = Int.random(in: 1...3)
                        
                        self.player1Shake()
                    }
                    
                    self.selectLine.frame = CGRect(x: self.SLx, y: 791.0, width: 40, height: 4)
                }
                
                indx += 1
            }
        } else {
            self.selectOneB = false
            self.selectTwoB = true
            self.selectThreeB = false
            self.player2Option = Int.random(in: 1...3)
            
            self.player1Shake()
        }
        
        player1Option = 2
    }
    
    @IBAction func selectThree(_ sender: UIButton) {
        indx = 0.0
        hitung.isHidden = true
        
        for dur in 1...40 {
            Timer.scheduledTimer(withTimeInterval: 0.01 * indx, repeats: false) { (Timer) in
                if self.selectOneB {
                    self.SLx += 5.25
                } else if self.selectTwoB {
                    self.SLx += 2.625
                }
                
                if self.SLx == 281.0 {
                    self.selectOneB = false
                    self.selectTwoB = false
                    self.selectThreeB = true
                    self.player2Option = Int.random(in: 1...3)
                    
                    self.player1Shake()
                }
                
                self.selectLine.frame = CGRect(x: self.SLx, y: 791.0, width: 40, height: 4)
            }
            
            indx += 1
        }
        
        player1Option = 3
    }
    
}
