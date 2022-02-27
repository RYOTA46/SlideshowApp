//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 法月諒太 on 2022/02/13.
//

import UIKit

class ViewController: UIViewController {
    
    // 各種初期設定
    // 再生ボタン
    @IBOutlet weak var startButton: UIButton!
    // 戻るボタン
    @IBOutlet weak var backButton: UIButton!
    // 進むボタン
    @IBOutlet weak var nextButton: UIButton!
    //画像用の変数
    @IBOutlet weak var SlideImage: UIImageView!
    // スライドショーで表示される画像を配列に格納
    var imageBox:[UIImage] = [
        UIImage(named: "Imaage_001.jpg")!,
        UIImage(named: "Imaage_002.jpg")!,
        UIImage(named: "Imaage_003.jpg")!
    ]
    // 画像配列用のインデックス
    var nowIndex:Int = 0
    // タイマーの生成
    var timer: Timer!
    // タイマー時間をカウントするための変数
    var timer_sec: Float = 0

    // 最初に読み込まれるコード
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
        //最初に表示される画像の登録
        let firstImage = UIImage(named: "Imaage_001.jpg")
        SlideImage.image = firstImage
    }

    // 各ボタンのアクション
    // 再生/停止ボタンを押下した時の処理
    @IBAction func startSlide(_ sender: Any) {
        // 動作中のタイマーを一つに保つために、timerが存在しない場合だけ、タイマーを生成して動作させる
        // 「停止中」の場合、再生する
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            // ボタンの名称を「再生」から「停止」に変更する
            startButton.setTitle("停止", for: .normal)
            
            // 戻る/進むボタンを非活性化
            backButton.isEnabled = false
            nextButton.isEnabled = false
            
        // 「再生中」の場合、停止する
        } else {
            // タイマーを停止する
            timer.invalidate()
            // タイマーインスタンスを削除する
            timer = nil
            // ボタンの名称を「停止」から「再生」に変更する
            startButton.setTitle("再生", for: .normal)
            // 戻る/進むボタンを活性化
            backButton.isEnabled = true
            nextButton.isEnabled = true
        }
    }
    
    // 進むボタンを押下した時の処理
    @IBAction func nextSlide(_ sender: Any) {
        self.changeImage()
    }
    
    // 戻るボタンを押下した時の処理
    @IBAction func backSlide(_ sender: Any) {
        // インデックスを減らして前の画像を表示する
        nowIndex -= 1
        
        // indexが表示予定の画像の最後の番号と同じ場合
        if (nowIndex <= 0 ) {
            // インデックスを初期値に戻す
            nowIndex = imageBox.count
        }
        // インデックスの画像をスライドにセットする
        SlideImage.image = imageBox[nowIndex - 1]
    }
    
    // タイマー作成時に呼び出されるメソッド
    // 画像が格納された配列から呼び出す
    @objc func changeImage() {
        // インデックスを増やして次の画像を表示する
        nowIndex += 1
        
        // indexが表示予定の画像の最後の番号と同じ場合
        if (nowIndex == imageBox.count) {
            // インデックスを初期値に戻す
            nowIndex = 0
        }
        // インデックスの画像をスライドにセットする
        SlideImage.image = imageBox[nowIndex]
    }
    
    // 遷移先画面から戻ってきた時に呼ばれる処理
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }

}

