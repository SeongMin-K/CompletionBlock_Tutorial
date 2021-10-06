//
//  ViewController.swift
//  CompletionBlock
//
//  Created by SeongMinK on 2021/10/06.
//

import UIKit
import KRProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var mainTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(#fileID, #function, "called")
        
        KRProgressHUD.show()
        sayHello(completion: { result in
            print("컴플레션 블록으로 넘겨 받음: \(result)")
            KRProgressHUD.showSuccess()
            
            self.mainTitle.text = result
        })
        
    }

    fileprivate func sayHello(completion: @escaping(String) -> ()) {
        print(#fileID, #function, "called")
        
        // 2초 딜레이 후 Hello! 넘겨줌
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            completion("Hello!")
        })
    }

}

