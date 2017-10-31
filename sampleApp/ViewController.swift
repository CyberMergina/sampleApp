//
//  ViewController.swift
//  sampleApp
//
//  Created by CyberMergina on 2017/10/30.
//  Copyright © 2017年 CyberMergina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
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

