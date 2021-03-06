//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 高橋怜杏 on 2020/03/03.
//  Copyright © 2020 saifa.libra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var number = 0
    let img: [UIImage] = [UIImage(named: "pet1")!,
                               UIImage(named: "pet2")!,
                               UIImage(named: "pet3")!]
      
    func showpicture(){
    picture.image = img[number]
    }
    
    
    @IBOutlet weak var picture: UIImageView!
    @IBAction func next(_ sender: Any) {
        
        nextrule()
        
    }
    @IBOutlet weak var nextButton: UIButton!
    
    var timer :Timer!
    
    @IBOutlet weak var startstop: UIButton!
    @IBAction func start_stop(_ sender: Any) {
        
        if self.timer  == nil {
            startstop.setTitle("停止", for: .normal)
        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(startOrstop(_:)), userInfo: nil, repeats: true)
            nextButton.isEnabled = false
            backButton.isEnabled = false
        }
        else {
            startstop.setTitle("再生", for: .normal)
                   self.timer.invalidate()
                   self.timer = nil
            nextButton.isEnabled = true
            backButton.isEnabled = true
            
               }
    }
    
    @objc func startOrstop(_ timer: Timer){
            nextrule()
    }
    
    @IBOutlet weak var backButton: UIButton!
    @IBAction func back(_ sender: Any) {
        
        if img[number] == img.first {
                   number = 2
               }
               else {
               number -= 1
               }
               showpicture()
       
    }
    
    @IBAction func backpage(_ segue: UIStoryboardSegue){
        
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showpicture()
        
   
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         startstop.setTitle("再生", for: .normal)
        nextButton.isEnabled = true
        backButton.isEnabled = true
               if self.timer != nil {
                   self.timer.invalidate()
                   self.timer = nil
               }
           
        let viewcontrollernext:ViewControllernext = segue.destination as! ViewControllernext
        
        viewcontrollernext.nowpicture = img[number]
       
           
    }
    
    func nextrule(){
        if img[number] == img.last {
                   number = 0
               }
               else {
               number += 1
               }
               showpicture()
    }
    
}
