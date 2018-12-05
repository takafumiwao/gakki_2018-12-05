//
//  ViewController.swift
//  gakki_2018-12-05
//
//  Created by 岩男高史 on 2018/12/05.
//  Copyright © 2018 岩男高史. All rights reserved.
//

import UIKit
//音を鳴らす
import AVFoundation

class ViewController: UIViewController {
  
  
  //シンバルの音源ファイルを指定
  let cymbalPath = Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")
  //シンバル用のプレイやーインスタンス作成
  var cymbalPlayer = AVAudioPlayer()
  //ギター用の音源ファイルを指定
  let guiterPath = Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")
  //ギター用のプレイヤーインスタンスの作成
  var guitarPlayer = AVAudioPlayer()
  //バックミュージック音源ファイルを指定
  let bgm = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
  //バックミュージック用のインスタンス作成
  var bgmplayer = AVAudioPlayer()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  
    
  }

 
  @IBAction func cymbal(_ sender: UIButton) {
//    do {
//    //シンバル用のプレイヤーに、音源ファイルを指定
//    cymbalPlayer = try AVAudioPlayer(contentsOf: cymbalPath, fileTypeHint: nil)
//    //シンバルの音源再生
//    cymbalPlayer.play()
//    } catch {
//      print("シンバルで、エラーが発生しました")
//    }

    soundPlayer(&cymbalPlayer, path: cymbalPath, count: 0)
  }
  
  @IBAction func guitar(_ sender: UIButton) {
//    //例外処理
//    do {
//    //ギター用のプレイヤーに、音源ファイルを指定
//    guitarPlayer = try AVAudioPlayer(contentsOf: guiterPath, fileTypeHint: nil)
//    //ギター再生
//    guitarPlayer.play()
//    } catch {
//      print("ギター再生でエラーが出ました")
//    }
    soundPlayer(&guitarPlayer, path: guiterPath, count: 0)
  }
  
  
  @IBAction func bgmplay(_ sender: UIButton) {
//    //例外処理
//    do {
//    //bgm用のおプレイやーに音源ファイルを指定
//    bgmplayer = try AVAudioPlayer(contentsOf: bgm, fileTypeHint: nil)
//    //bbgm再生
//    bgmplayer.play()
//    } catch {
//      print("bgm再生でエラーが出ました")
//    }
    soundPlayer(&bgmplayer, path: bgm, count: -1)
  }
  
  
  @IBAction func bgmstop(_ sender: UIButton) {
    //bgm停止
    bgmplayer.stop()
  }
  
  //共通のプレイヤー再生処理
  fileprivate func soundPlayer(_ player:inout AVAudioPlayer, path: URL, count: Int) {
    do {
      player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
      player.numberOfLoops = count
      player.play()
    } catch {
      print("エラーが発生しました")
    }
  }
  
  
}

