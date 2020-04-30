//
//  ViewController.swift
//  APoDDemo
//
//  Created by Paul Bonamy on 2/26/19.
//  Copyright © 2019 Paul Bonamy. All rights reserved.
//

import UIKit
var userDate = ""
class ViewController: UIViewController {
    
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var imageCopyright: UILabel!
    @IBOutlet weak var imageDescription: UITextView!
    @IBOutlet var apodPhoto: UIImageView!
    
    @IBOutlet var apodDate: UIDatePicker!
    
    let photoInfoController = PhotoInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    
    func getDate(){
        
        let pictureDate = self.apodDate.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let selectedDate = dateFormatter.string(from: pictureDate)
        // pictureDate = String(selectedDate)
        print(selectedDate)
        userDate = selectedDate
       
    }
    

    @IBAction func fetchInfo(_ sender: Any) {
        
       getDate()
        
        imageDescription.text = ""
        imageCopyright.text = ""
        imageTitle.text = "Fetching Update"
                
        photoInfoController.fetchPhotoInfo { (photoInfo) in
            if let photoInfo = photoInfo {
              
                DispatchQueue.main.async {
                                      
                    self.imageTitle.text = photoInfo.title
                    self.imageDescription.text = photoInfo.description
                    
                    if let copyright = photoInfo.copyright {
                        self.imageCopyright.text = "Copyright \(copyright)"
                    } else {
                        self.imageCopyright.isHidden = true
                    }
                    
                    // update UIImageView with apod
                    if let imageData = try? Data(contentsOf: photoInfo.url) {
                        self.apodPhoto?.image = UIImage(data: imageData)
                    }
                }
            }
        }
    }
   
}

