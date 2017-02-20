//
//  SendInfoVC.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 18..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class SendInfoVC: UIViewController ,UITextViewDelegate, UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    var requirement : Requirement?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var selectInbodyButton: UIButton!
    @IBOutlet weak var requirementTextView: UITextView!
    @IBOutlet weak var inbodyPicView: UIImageView!
    @IBOutlet weak var sendInfoButton: UIBarButtonItem!
    @IBOutlet var sendInfoView: UIView!
    @IBOutlet weak var placeholderLabel: UILabel!
    
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
            
            //이미지 삭제
            self.inbodyPicView.image = nil
            
        })
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: { (action) -> Void in
            print("취소 버튼 눌림")
        })
        
        //버튼 속 이미지 없을때
        if self.inbodyPicView.image == nil {
            alertController.addAction(cameraButton)
            alertController.addAction(libraryButton)
            alertController.addAction(cancelButton)
        } else {
            //새로운 이미지 선택됨
            alertController.addAction(cameraButton)
            alertController.addAction(libraryButton)
            alertController.addAction(imageDeleteButton)
            alertController.addAction(cancelButton)
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //텍스트뷰 홀더
        placeholderLabel.text = "요구사항을 적어주세요."
        placeholderLabel.isHidden = !requirementTextView.text.isEmpty
        
        //텍스트뷰 델리게이트
        self.requirementTextView.delegate = self
        
        //탭바 없애기
        self.tabBarController?.tabBar.isHidden = true
        
        //키보드 없애기
        self.hideKeyboardWhenTappedAround()
        
        
        
    }
    
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //탭바 없애기
        self.tabBarController?.tabBar.isHidden = true
        subscribeToKeyboardNotifications() //노티 얻는거 연결
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        unsubscribeFromKeyboardNotifications() //노티 얻는거 끊기
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: ImagePickerView
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: false) { () in
            
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        picker.dismiss(animated: true) { () in
            
            if let img = info[UIImagePickerControllerEditedImage] as? UIImage{
                self.inbodyPicView.image = img
            }
        }
    }
    
    //MARK: - TextView
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    
    //MARK: - Keyboard
    func keyboardWillShow(_ notification:Notification) {
        
        print("willshow",view.frame.origin.y)
        print("keyboard",getKeyboardHeight(notification))
            view.frame.origin.y = 64 - getKeyboardHeight(notification)
        print("willshowend",view.frame.origin.y)
        
    }
    
    func keyboardWillHide(_ notification:Notification){
        print("willHide",view.frame.origin.y)
        view.frame.origin.y = 64
        print("willHideend",view.frame.origin.y)
    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
    
    func subscribeToKeyboardNotifications() {
        //노티 설정에 옵저버 추가
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
        
    }

    
    
    //MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let uiBarButtonItem = sender as? UIBarButtonItem else {
            return
        }
        
        if sendInfoButton == uiBarButtonItem {
            saveRequirement()
        }
    }
    
    //MARK: - func
    func saveRequirement() {
        
        if self.inbodyPicView.image == nil {
            let alert = UIAlertController(title: "인바디", message: "인바디사진을 추가해주세요", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(ok)
            
            self.present(alert, animated: true, completion: nil)
            
        } else {
            requirement = Requirement(requirementId: 0, trainerId: "트레이너아이디", requirementText: self.requirementTextView.text, inbodyImage: self.inbodyPicView.image!)
            
            appDelegate.requirementList.append(self.requirement!)

        }
    }
    
}
