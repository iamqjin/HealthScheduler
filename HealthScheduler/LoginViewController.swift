//
//  LoginViewController.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 6..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit
import Firebase



class LoginViewController: UIViewController , UITextFieldDelegate, GIDSignInUIDelegate{

    //구글 로그인 버튼
    @IBOutlet weak var signInButton: GIDSignInButton!
    //이메일 텍스트필드
    @IBOutlet weak var emailTextField: UITextField!
    //비밀번호 텍스트필드
    @IBOutlet weak var pwdTextField: UITextField!
    //로그인 버튼
    @IBOutlet weak var loginButton: UIButton!
    
    //로그인 클릭 액션
    @IBAction func login(_ sender: Any) {
        //텍스트필드들의 FirstResponder를 해제
        self.emailTextField.resignFirstResponder()
        self.pwdTextField.resignFirstResponder()
        
        print("------------로그인버튼------------")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("시작되었다")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return버튼 눌림")
       
        if textField.tag == 1 {
            //email텍스트필드 return 작업
            //email텍스트필드에서 return 눌렀을때 비번으로 FirstResponder 설정
            self.pwdTextField.becomeFirstResponder()
        } else if textField.tag == 2 {
            //pwd텍스트필드 return 작업?
            print("로그인 자동으로 시켜주셈")
        }
        
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //텍스트필드 델리게이트 지정
        self.emailTextField.delegate = self
        self.pwdTextField.delegate = self
        
        
        //구글 로그인 델리게이트 지정
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

