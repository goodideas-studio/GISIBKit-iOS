//
//  DesignableWebViewContainer.swift
//  IBKit
//
//  Created by 游宗諭 on 2020/1/7.
//  Copyright © 2020 ytyubox. All rights reserved.
//

import WebKit
import UIKit
open
class DesignableWebViewContainer: UIView {
	override init(frame: CGRect) {
		fatalError("\(#function) has not been implemented")
		
	}
	;	
	required public init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	public internal(set) var webView: WKWebView!
	public
	func config() {
		let webConfiguration = WKWebViewConfiguration()
		// Fix Fullscreen mode for video and autoplay
		webConfiguration.preferences.javaScriptEnabled = true
		//		webConfiguration.mediaPlaybackRequiresUserAction = false
		webConfiguration.allowsInlineMediaPlayback = true
		
		webView = WKWebView(frame: .zero, configuration: webConfiguration)
		addSubview(webView)
//		webView.navigationDelegate = self
		webView.translatesAutoresizingMaskIntoConstraints = false
		webView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		webView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		webView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
		webView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
	}
	public
	func load(_ request: URLRequest) {
		webView.load(request)
	}
}

extension DesignableWebViewContainer: WKNavigationDelegate {
//	public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//		webView.frame.size.height = 1
//		webView.frame.size = webView.scrollView.contentSize
//		print(webView.frame.size)
//	}
}
