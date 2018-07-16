//
//  SwiftNameTest.swift
//  Test-Swift
//
//  Created by BB9z on 2018/4/22.
//  Copyright © 2018 RFUI. All rights reserved.
//

import XCTest

class SwiftNameTest: XCTestCase {
    
    // MARK: - Category
    func testArray() {
        let a = [1, 2, 3, 4] as NSMutableArray
        a.rf_object(at: 6)
        a.rf_subarray(withRangeLocation: 0, length: 0)
        a.rf_mapedArray { v -> Any? in
            return (v as? Int)! * 2
        }
        a.rf_add(nil)
        a.rf_insert(nil, at: 99)
        a.setLast(nil)
        a.removeObjects { _, _, _ -> Bool in
            return true
        }
    }
    
    func testBundle() {
        let _ = Bundle.main.versionString
    }
    
    func testDate() {
        let _ = NSDate.init(year: 2000, month: 1, day: 1)
        NSDate().isSameDay(with: nil)
        NSDate.daysBetweenDate(Date(), andDate: Date())
        let _ = NSDate().dayStart
        let _ = NSDate().dayEnd
    }
    
    func testDateFormatter() {
        let _ = DateFormatter.GMT
        let _ = DateFormatter.currentLocale
        let _ = DateFormatter.currentLocaleOnlyDate
        DateFormatter.currentLocale(fromTemplate: "yyyy")
        let _ = DateFormatter(format: "yyyy", timeZoneName: "Asia/Hong_Kong")
        let _ = DateFormatter.hongKongTimeZone
    }
    
    func testDictionary() {
        let d = NSMutableDictionary()
        d.bool(forKey: "k")
        d.integer(forKey: "k")
        d.float(forKey: "k")
        d.double(forKey: "k")
        d.addEntries(from: [:], filterKeys: nil)
        d.rf_setObject(nil, forKey: nil)
        d.rf_removeObject(forKey: nil)
    }
    
    func testError() {
        let _ = NSError(domain: nil, code: 0, localizedDescription: nil)
    }
    
    func testFileManager() {
        let fm = FileManager.default
        let _ = try? fm.subDirectoryURL(withPathComponent: nil, in: .applicationDirectory, createIfNotExist: false)
        fm.subDirectoryOfDirectory(atPath: ".", error: nil)
        fm.files(inDirectory: URL(fileURLWithPath: "."), withExtensions: nil, directoryEnumerationOptions: .skipsHiddenFiles, errorHandler: nil)
        fm.fileSize(forPath: nil, error: nil)
        fm.size(forDirectory: nil, fileCount: nil, directoryCount: nil, error: nil)
    }
    
    func testJSONSerialization() {
        let _ = try? JSONSerialization.string(withJSONObject: nil, options: [])
        let _ = try? JSONSerialization.jsonObject(with: nil, usingEncoding: String.Encoding.utf8.rawValue, allowLossyConversion: true, options: [])
        JSONSerialization.jsonObject(with: nil)
        let _ = try? JSONSerialization.jsonObject(withJSONPString: nil)
    }
    
    func testLayoutConstraint() {
        NSLayoutConstraint().updateLayoutIfNeeded()
    }
    
    func testNumberFormatter() {
        NumberFormatter.significantFormatter(withMinimumDigits: 0, maximumDigits: 1)
    }
    
    func testObject() {
        let obj = NSObject()
        obj.objects(forIndexArray: nil)
        obj.objects(forDictKeyArray: nil)
        obj.performRespondedSelector(nil)
    }
    
    func testString() {
        let s = NSString()
        let _ = s.rf_MD5
        s.rf_pinyinString(withStripDiacritics: false)
        s.contains("zz")
        s.contains("zz", options: .caseInsensitive)
        s.trimming(toLength: 0, withTruncationToken: nil)
        s.reverse()
        s.extractedHTMLContent()
    }
    
    func testURL() {
        let _ = NSURL(string: "")?.queryDictionary
    }
    
    func testUIButton() {
        let bt = UIButton()
        bt.setBackgroundImageResizingCapInsets(.zero, for: .normal)
    }
    
    func testUIColor() {
        let _ = UIColor(rgbHex: 0xffffff, alpha: 0)
        let _ = UIColor(rgbHex: 0xffffff)
        let _ = UIColor(rgbString: "#ffffff", alpha: 0)
        let _ = UIColor(rgbString: "#ffffff")
        let _ = UIColor(patternImageName: "404")
        UIColor.randColor(withAlpha: 0)
        UIColor().mixedColor(withRatio: 0, color: UIColor())
    }
    
    func testUIDevice() {
        let d = UIDevice.current
        let _ = d.isPad
        let _ = d.isRetinaDisplay
        let _ = d.isBeingDebugged
        let _ = d.fileSystemFreeSize
        let _ = d.fileSystemSize
    }
    
    func testUIImage() {
        let img = UIImage()
        let _ = img.pixelSize
        XCTAssertThrowsError(try RTHelper.catchException {
            img.thumbnailImage(maxSize: .zero)
            })
        img.cropedImage(aspectFillSize: .zero, opaque: false, scale: 0)
        img.cropedImage(aspectFillSize: .zero)
        img.resizedImage(aspectFitSize: .zero, opaque: false, scale: 0)
        img.resizedImage(aspectFitSize: .zero)
        img.cropedImage(rect: .zero)
        img.resizedImage(size: .zero)
        img.resizedImage(scale: 1)
        img.tintedImage(color: .red)
        img.tintedImage(colorKeepsAlpha: .red)
    }
    
    func testUINavigationController() {
        let nav = UINavigationController()
        let vc = UIViewController()
        let _ = nav.disappearingViewController
        let _ = nav.previousViewController
        nav.previousViewControllerClass(for: vc)
        nav.previousViewController(for: vc)
        nav.hasViewController(ofKind: UIViewController.self, before: nil)
        nav.viewController(ofKind: UIViewController.self, before: nil)
        nav.setTopViewController(nil, animated: false)
    }
    
    func testUIPickerView() {
        let v = UIPickerView()
        v.rf_selectRow(0, inComponent: 0, animated: false)
    }
    
    func testUIResponder() {
        let v = UIView()
        let _ = v.viewController
        let _ = UIView.firstResponder
    }
    
    func testUIScrollView() {
        let sv = UIScrollView()
        sv.scrollToTop(animated: false)
        sv.scrollToBottom(animated: true)
        let tb = UITableView()
        tb.scrollToLastRow(animated: true)
    }
    
    func testUISearchBar() {
        let sb = UISearchBar()
        let _ = sb.cancelButton
    }
    
    func testUIStoryboard() {
        let sb = UIStoryboard()
        XCTAssertThrowsError(try RTHelper.catchException {
            sb.instantiateViewController(identifierUsingClass: UIViewController.self)
            })
    }
    
    func testUITableView() {
        let tb = UITableView()
        tb.deselectRows(true)
        tb.dequeueReusableCell(withCellClass: UITableViewCell.self)
        tb.autoLayoutTableHeaderView()
        tb.autoLayoutTableFooterView()
    }
    
    func testUIView() {
        let v = UIView()
        v.move(x: 10, y: 10)
        v.move(xOffset: 10, yOffset: 10)
        v.resize(width: 10, height: 10)
        v.resize(width: 10, height: 10, anchor: .center)
        v.sizeToFitSuperview()
        
        let v2 = UIView()
        XCTAssertNil(UIView.commonSuperview(view1: v, view2: v2))
        
        v.addSubview(v2, frame: .zero)
        v.addSubview(v2, resizeOption: .fill)
        v.removeSubview(v2)
        v.removeAllSubviews()
        v.bring(above: nil)
        v.sent(below: nil)
        v.bringToFront()
        v.sentToBack()
        v.bringOneLevelUp()
        v.sendOneLevelDown()
        let _ = v.isInFront
        let _ = v.isAtBack
        v.superview(of: UIImageView.self)
        let _ = v.isVisible
        let _ = v.frameOnScreen
        v.bounds(in: v2)
        v.renderToImage()
        v.distanceBetweenFrameBottomAndSuperviewBottom()
        let _ = v.viewController
        XCTAssertThrowsError(try RTHelper.catchException {
            UIView.load(withNibName: nil)
            UIView.load(withNibName: nil, bundle: nil)
            })
    }
    
    func testUIViewAutoresizing() {
        let v = UIView()
        let v2 = UIView()
        v.autoresizingMask = UIViewAutoresizingFlexibleSize
        v2.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        XCTAssertEqual(v.autoresizingMask, v2.autoresizingMask)
        
        v.autoresizingMask = [.flexibleTopMargin, UIViewAutoresizingFlexibleSize]
        v2.autoresizingMask = [.flexibleHeight, .flexibleWidth, .flexibleTopMargin]
        XCTAssertEqual(v.autoresizingMask, v2.autoresizingMask)
    }
    
    func testUIViewRFAnimate() {
        let v = UIView()
        v.x = v.y
        v.rightMargin = v.bottomMargin
        v.width = v.height
        let size = v.size
        v.size = size
    }
    
    func testUIViewController() {
        let vc = UIViewController()
        let vc2 = UIViewController()
        let _ = vc.isViewAppeared
        UIViewController.rootViewControllerWhichCanPresentModal()
        vc.addChildViewController(vc2, into: nil)
        vc2.removeFromParentViewControllerAndView()
        vc.parentViewController(of: UIViewController.self)
        vc.dismissKeyboard()
    }
    
    func testUIWebView() {
        let v = UIWebView()
        v.clearBackgroundImages()
    }
}
