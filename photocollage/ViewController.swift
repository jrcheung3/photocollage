//
//  ViewController.swift
//  photocollage
//
//  Created by Sonya Patel on 3/1/18.
//  Copyright © 2018 Sonya Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var pictureOne: UIImageView!
    @IBOutlet weak var pictureTwo: UIImageView!
    @IBOutlet weak var swapButton: UIButton!
    @IBOutlet weak var cameraRoll: UIImageView!
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var imageView: UIImageView!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func gotTouch(_ sender: Any) {
        print("Got button press")
        let i = #imageLiteral(resourceName: "turtle")
        pictureTwo.image = i
        pictureTwo.transform = CGAffineTransform(rotationAngle: CGFloat.pi*180/CGFloat.pi)
        let i2 = #imageLiteral(resourceName: "tortuga2")
        pictureOne.image = i2
    }
    
    @IBAction func loadImageButtonTapped(_ sender: UIButton) {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imagePicker.delegate = self
            as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        print("view loaded")
    }
    // MARK: - UIImagePickerControllerDelegate Methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            cameraRoll.contentMode = .scaleAspectFit
            cameraRoll.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancelled")
        dismiss(animated: true, completion: nil)
    }
}

