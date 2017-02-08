//
//  HP01_TableViewController.swift
//  HealthScheduler
//
//  Created by iamqjin on 2017. 2. 6..
//  Copyright © 2017년 iamqjin. All rights reserved.
//

import UIKit

class HP01_TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    //테이블 섹션 2개로 지정
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    //테이블 섹션별로 테이블 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //섹션별 테이블 수 변수
        var tableCount : Int?
        
        if section == 0 {
            tableCount = 1
        } else if section == 1 {
            //등, 다리, 가슴, 팔
            tableCount = 4
        }
        return tableCount!
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        print("셀포로우엣",tableView)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "routineSelect", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "셀프 스케줄"
            cell.detailTextLabel?.text = "직접 헬스 스케줄을 짜보세요"
        } else if indexPath.section == 1 {
            
            
            if indexPath.row == 0 {
                //등
                cell.textLabel?.text = "등 스케줄"
                cell.detailTextLabel?.text = "데드리프트 * 3, 시티드 로우 * 3, 렛 풀 다운 * 3, 바이셉 컬 * 3"
            } else if indexPath.row == 1 {
                //다리
                cell.textLabel?.text = "다리 스케줄"
                cell.detailTextLabel?.text = "스쿼트 * 3, 레그익스텐션 * 3, 플랫스트레이트 * 3, 레그레이즈 * 3"
            } else if indexPath.row == 2 {
                //가슴
                cell.textLabel?.text = "가슴 스케줄"
                cell.detailTextLabel?.text = "벤치프레스 * 3, 인클라인 벤치프레스 * 3, 밀리터리 프레스 * 3, 레트럴 레이즈 * 3"
            } else if indexPath.row == 3 {
                //팔
                cell.textLabel?.text = "팔 스케줄"
                cell.detailTextLabel?.text = "바이셉 컬 * 3, 해머컬 * 3, 트라이셉스 익스텐션 * 3"
            }
        }
        

        return cell
    }
    
    //헤더 제목 설정
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var headerTitle : String?
        
        if section == 0 {
            headerTitle = "내맘대로스케줄"
        } else if section == 1 {
            headerTitle = "빠른 시작"
        }
        
        return headerTitle
    }
    
    //헤더 높이 조절
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let height : CGFloat = 63.0
        
        return height
        
    }
    
    //테이블 선택시 작동
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("선택된 테이블 넘버", indexPath)
        
        guard let HP03VC = self.storyboard?.instantiateViewController(withIdentifier: "HP03VC") as? HP03_ViewController else {
            return
        }
        
        
        //HP03에 indexPath 전달
        HP03VC.indexRow = indexPath
        
        self.navigationController?.pushViewController(HP03VC, animated: true)

    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
