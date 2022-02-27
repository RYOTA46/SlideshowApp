//
//  BigImageViewController.swift
//  SlideshowApp
//
//  Created by 法月諒太 on 2022/02/13.
//

import UIKit

class BigImageViewController: UIViewController {
    
    // 各種初期値設定
    // 拡大画像の初期値
    @IBOutlet weak var bigImage: UIImageView!
    // 遷移元画面から受け取るための変数
    var selectImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 遷移元画面から値を受け取る
        bigImage.image = selectImage
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
