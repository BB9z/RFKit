//
//  SwiftNameTest.swift
//  Test-Swift
//
//  Created by BB9z on 2018/4/22.
//  Copyright © 2018 RFUI. All rights reserved.
//

import XCTest

class SwiftNameTest: XCTestCase {
    
    func testArray() {
        let a = [1, 2, 3, 4] as NSMutableArray
        a.rf_object(at: 6)
        a.rf_subarray(withRangeLocation: 0, length: 0)
        a.rf_add(nil)
        a.rf_insert(nil, at: 99)
        a.setLast(nil)
        a.removeObjects { _, _, _ -> Bool in
            return true
        }
    }
    
    func testDateFormatter() {
        DateFormatter.GMT()
        DateFormatter.currentLocale()
        DateFormatter.currentLocaleOnlyDate()
        DateFormatter.currentLocale(fromTemplate: "yyyy")
        let _ = DateFormatter(format: "yyyy", timeZoneName: "Asia/Hong_Kong")
        DateFormatter.hongKongTimeZone()
    }
    
    func testUIView() {
        let v = UIView()
        v.move(x: 10, y: 10)
        v.move(xOffset: 10, yOffset: 10)
        v.resize(width: 10, height: 10)
        v.resize(width: 10, height: 10, anchor: .center)
        
        let v2 = UIView()
        XCTAssertNil(UIView.commonSuperview(view1: v, view2: v2))
        
        v.autoresizingMask = UIViewAutoresizingFlexibleSize
        v2.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        XCTAssertEqual(v.autoresizingMask, v2.autoresizingMask)
        
        v.autoresizingMask = [.flexibleTopMargin, UIViewAutoresizingFlexibleSize]
        v2.autoresizingMask = [.flexibleHeight, .flexibleWidth, .flexibleTopMargin]
        XCTAssertEqual(v.autoresizingMask, v2.autoresizingMask)
    }
}
