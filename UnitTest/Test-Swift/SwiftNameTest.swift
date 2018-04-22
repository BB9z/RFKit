//
//  SwiftNameTest.swift
//  Test-Swift
//
//  Created by BB9z on 2018/4/22.
//  Copyright © 2018 RFUI. All rights reserved.
//

import XCTest

class SwiftNameTest: XCTestCase {
    
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
