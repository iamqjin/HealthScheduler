//
//  SendInfoVC.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 18..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class SendInfoVC: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var selectinbodyButton: UIButton!
    
    @IBOutlet weak var requirementText: UITextView!
    
    @IBAction func sendingInfo(_ sender: Any) {
        print("선택됨")
        print(requirementText.text)
    }
    
    @IBAction func selectInbodyAction(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cameraButton = UIAlertAction(title: "사진 찍기", style: .default, handler: { (action) -> Void in
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            
            self.present(imagePicker, animated: true, completion: nil)
        })
        
        let libraryButton = UIAlertAction(title: "앨범에서 선택", style: .default , handler: { (action) -> Void in
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            
            self.present(imagePicker, animated: true, completion: nil)
            
        })
        
        let imageDeleteButton = UIAlertAction(title: "이미지 삭제", style: .destructive , handler: { (action) -> Void in
            
            //다시 똑같은 이미지로 채워넣음
            self.selectinbodyButton.setImage(#imageLiteral(resourceName: "camera"), for: .normal)
        })
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: { (action) -> Void in
            print("취소 버튼 눌림")
        })
        
        //버튼 속 이미지가 기존 이미지와 같을때
        if sender.image(for: .normal) == #imageLiteral(resourceName: "camera") {
            alertController.addAction(cameraButton)
            alertController.addAction(libraryButton)
            alertController.addAction(cancelButton)
        } else {
            //기존 이미지와 다를때 == 새로운 이미지 선택됨
            alertController.addAction(cameraButton)
            alertController.addAction(libraryButton)
            alertController.addAction(imageDeleteButton)
            alertController.addAction(cancelButton)
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: ImagePickerView
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: false) { () in
            
            let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        picker.dismiss(animated: true) { () in
            
            if let img = info[UIImagePickerControllerEditedImage] as? UIImage{
                self.selectinbodyButton.setImage(img, for: .normal)
            }
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
