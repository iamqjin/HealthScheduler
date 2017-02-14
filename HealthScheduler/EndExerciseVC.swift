//
//  EndExerciseVC.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 14..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class EndExerciseVC: UIViewController, UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var saveImageView: UIImageView!
    
    @IBAction func addPicAction(_ sender: Any) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cameraButton = UIAlertAction(title: "사진 찍기", style: .default, handler: { (action) -> Void in
            print("사진 찍기")
        })
        
        let libraryButton = UIAlertAction(title: "앨범에서 선택", style: .default , handler: { (action) -> Void in
            print("앨범에서 선택")
        })
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: { (action) -> Void in
            print("취소 버튼 눌림")
        })
        
        
        alertController.addAction(cameraButton)
        alertController.addAction(libraryButton)
        alertController.addAction(cancelButton)
    
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
    
    
    //테이블 뷰 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseSaveCell", for: indexPath)
    
        if indexPath.section == 0 {
            cell.textLabel?.text = "여긴 1번"
        } else {
            cell.textLabel?.text = "여긴 2번"
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 2
        case 1:
            return 4
        default:
            return 1
        }
    }
    
    //헤더 높이 지정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 44
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
