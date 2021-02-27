//
//  BigPhotoViewController.swift
//  PictureColletion
//
//  Created by Никита on 27.02.2021.
//

import UIKit

class BigPhotoViewController: UIViewController {
    @IBOutlet weak var BigPhotoImageView: UIImageView!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BigPhotoImageView.image = image
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
