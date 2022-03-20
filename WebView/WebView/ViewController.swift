//
//  WebViewController.swift
//  WebView
//
//  Created by kangmin on 2022/03/10.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var urlTextField: UITextField!
    @IBOutlet var webView: WKWebView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
        let url = URL(string: url)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        loadWebPage("https://boring-km.github.io")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    @IBAction func goUrl(_ sender: UIButton) {
        
        let targetUrl = urlTextField.text
        guard let targetUrl = targetUrl, targetUrl != "" else {
            showEmptyUrlAlertDialog()
            return
        }
        
        let url = checkUrl(targetUrl)
        urlTextField.text = ""
        loadWebPage(url)
    }
    
    private func showEmptyUrlAlertDialog() {
        let alertController = UIAlertController(
            title: "입력 에러",
            message: "URL을 입력해주세요",
            preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(
            title: "확인",
            style: UIAlertAction.Style.default,
            handler: nil)
        
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    func checkUrl(_ url: String) -> String {
        let flag = url.hasPrefix("https://")
        guard flag else {
            return "https://" + url
        }
        return url
    }
    
    @IBAction func goSite1(_ sender: UIButton) {
        loadWebPage("https://boring-km.github.io/TIL")
        
    }
    
    @IBAction func goSite2(_ sender: UIButton) {
        loadWebPage("https://github.com/boring-km")
    }
    
    
    @IBAction func loadHtmlString(_ sender: UIButton) {
        print("구현 안함")
    }
    
    @IBAction func loadHtmlFile(_ sender: UIButton) {
        print("나중에 필요하면 사용해보기")
    }
    
    @IBAction func buttonStop(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    
    @IBAction func buttonReload(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    
    @IBAction func buttonGoBack(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func buttonGoForward(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    
}

