//
//  WebViewController.swift
//  Project 16.1
//
//  Created by Nikita on 11.04.23.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var urlTown: String?
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let urlTown = urlTown  else { return }
        urlRequest(town: urlTown)
    }
    
    
    func urlRequest(town: String) {
        let url = URL(string: "https://en.wikipedia.org/wiki/\(town)")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
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
