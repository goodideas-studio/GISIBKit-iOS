//
//  CoreLocale.swift
//  IBKit
//
//  Created by 游宗諭 on 2019/11/29.
//  Copyright © 2019 ytyubox. All rights reserved.
//

import SwiftCSV
import GISHelperKit
import UIKit
import Weak

open class CoreLocale {
	public static var CoreLocaleDic:[String:CoreLocale] = [:]
	public static var ibKitLocale:CoreLocale = .init( csvsetting: .init(name: "", language: "", extensionName: "", bundle: .main, delimiter: " "))
	///	Overrides system method and enforces usage of particular .lproj translation bundle
	open var currectLanguage: String = "" {
		didSet {
			setting.language = currectLanguage
			tsv = getTSV()
			cache = getCache()
			for (i, v) in	textFieldList.enumerated().reversed() {
				guard let object = v.object else {
					textFieldList.remove(at: i)
					continue
				}
				updateFor(object)
			}
			for (i, v) in	buttonList.enumerated().reversed() {
				guard let object = v.object else {
					buttonList.remove(at: i)
					continue
				}
				updateFor(object)
			}
			for (i, v) in	labelList.enumerated().reversed() {
				guard let object = v.object else {
					labelList.remove(at: i)
					continue
				}
				updateFor(object)
			}
		}
	}
	func getCache() -> [String:String] {
		var cache:[String:String] = .init(minimumCapacity: tsv.enumeratedRows.count)
		for rows in tsv.enumeratedRows {
			cache[rows[0]] = rows[1]
		}
		return cache
	}
	lazy var tsv = getTSV()
	public private(set) lazy var cache:[String:String] = getCache()
	func getTSV() -> CSV {
		try! CSV(name: setting.name + "-" + setting.language,
				 extension: setting.extensionName,
				 bundle: setting.bundle,
				 delimiter: setting.delimiter,
				 encoding: setting.encoding,
				 loadColumns: setting.loadColumns)!
	}
	private(set) var setting:CSVSetting
	public init(csvsetting: CSVSetting) {
		self.setting = csvsetting
	}
	public
	struct CSVSetting {
		public	var name:String
		public  var language:String
		public	var extensionName:String
		public	var bundle:Bundle
		public	var delimiter: Character
		public	var encoding: String.Encoding = .utf8
		public	var loadColumns: Bool = true
		public init(name:String,
					language:String,
					extensionName:String,
					bundle:Bundle,
					delimiter: Character,
					encoding: String.Encoding = .utf8,
					loadColumns: Bool = true) {
			self.name = name
			self.language = language
			self.extensionName = extensionName
			self.bundle = bundle
			self.delimiter = delimiter
			self.encoding = encoding
			self.loadColumns = loadColumns
		}
	}
	func getLocalizedString(for key:String) -> String? {
        guard let string = cache[key] else { return key }
        return string
	}
	private var textFieldList:[Weak<DesignableTextField>] = []
	private var buttonList:[Weak<DesignableButton>] = []
	private var labelList:[Weak<DesignableLabel>] = []
	
	internal func add(_ tf:DesignableTextField) {
		updateFor(tf)
		textFieldList.append(Weak(tf))
	}
	internal func add(_ btn:DesignableButton) {
		updateFor(btn)
		buttonList.append(Weak(btn))
	}
	internal func add(_ lbl:DesignableLabel) {
		updateFor(lbl)
		labelList.append(Weak(lbl))
	}
	
	internal func updateFor(_ v:UIView) {
		DispatchQueue.main.async {
			
			switch v {
			case let tf as DesignableTextField:
				tf[keyPath: \.placeholder] = self.getLocalizedString(for: tf.localePlaceHolderKey)
			case let label as DesignableLabel:
				label[keyPath: \.text] = self.getLocalizedString(for: label.localeTextKey)
				label.sizeToFit()
			case let button as DesignableButton:
				button.setTitle(self.getLocalizedString(for: button.localeNormalTitleKey), for: .normal)
				button.sizeToFit()
			default: break
			}
			v.layoutIfNeeded()
		}
	}
}
