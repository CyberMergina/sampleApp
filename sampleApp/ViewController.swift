//
//  ViewController.swift
//  sampleApp
//
//  Created by CyberMergina on 2017/10/30.
//  Copyright © 2017年 CyberMergina. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var stopButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var webView: UIWebView!
    
    // デフォルトで開きたいページ
    let homeUrlString = "http://www.yahoo.co.jp"

    // コントローラーが持つビューが読み込まれた後に実行される
    override func viewDidLoad() {
        super.viewDidLoad()
        // ホームページを開く
        open(urlString: homeUrlString)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 文字列で指定されたURLをWebViewで開く
    func open(urlString: String) {
        let url = URL(string: urlString)
        let urlRequest = URLRequest(url: url!)
        webView.loadRequest(urlRequest)
    }
    
    // MARK: - UIWebViewDelegate

    // ページの読み込み開始時の処理
    func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicator.alpha = 1 // ローディングイメージを表示
        activityIndicator.startAnimating() // ローディングイメージのアニメーション開始
        backButton.isEnabled = false // バックボタンの非アクティブ化
        reloadButton.isEnabled = false // リロードボタンの非アクティブ化
        stopButton.isEnabled = true // ストップボタンのアクティブ化
    }
    
    // ページの読み込み終了時の処理
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicator.alpha = 0 // ローディングイメージを非表示
        activityIndicator.stopAnimating() // ローディングイメージのアニメーション停止
        backButton.isEnabled = true // バックボタンのアクティブ化
        reloadButton.isEnabled = true // リロードボタンのアクティブ化
        stopButton.isEnabled = false // ストップボタンの非アクティブ化
    }
    
    // MARK: - IMAction
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        webView.goBack()
    }

    @IBAction func reloadButtonTapped(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func stopButtonTapped(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
}

