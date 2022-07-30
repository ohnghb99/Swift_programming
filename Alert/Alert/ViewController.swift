//
//  ViewController.swift
//  Alert
//
//  Created by 옹효빈 on 2022/07/30.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lampImg: UIImageView!
    
    let imgOn = UIImage(named: "lamp-on.png")
    
    let imgOff = UIImage(named: "lamp-off.png")
    
    let imgRemove = UIImage(named: "lamp-remove.png")
    
    var isLampOn = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lampImg.image = imgOn
    }
    
    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn==true){
            //전구가 켜져 있을 때, 켜져 있다고 alert 실행
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 on 상태입니다", preferredStyle: UIAlertController.Style.alert)

            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        } else {
            //전구가 켜져 있지 않을때, 전구를 킴
            let lampOnAlert = UIAlertController(title: "램프 켜기", message: "램프를 켜시겠습니까?", preferredStyle: UIAlertController.Style.alert)

            let onAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {
                ACTION in self.lampImg.image = self.imgOn
                self.isLampOn=true
            })
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            lampOnAlert.addAction(cancelAction)
            
            present(lampOnAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn{
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {
                ACTION in self.lampImg.image = self.imgOff
                self.isLampOn=false
            })
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "아니오, 끕니다", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgOff
            self.isLampOn=false
        })
        let onAction = UIAlertAction(title: "아니오, 켭니다", style: UIAlertAction.Style.default){
            ACTION in self.lampImg.image = self.imgOn
            self.isLampOn=true
        }
        let removeAction = UIAlertAction(title: "네, 제거합니다", style: UIAlertAction.Style.destructive, handler: {
            ACTION in self.lampImg.image = self.imgRemove
            self.isLampOn=false
        })
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)

        present(lampRemoveAlert, animated: true, completion: nil)
    }
}

