//
//  BSKToolBoxTest.swift
//  BSKToolBox-SwiftTests
//
//  Created by 刘万林 on 2018/4/26.
//  Copyright © 2018年 LiuWanLin. All rights reserved.
//

import XCTest
import BSKToolBox_Swift
class BSKToolBoxTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRegularExpression() {
        guard let a = try? "sss   sss   sss   sss".replace(match: "\\s{1,}", with: "==", options: NSRegularExpression.Options.caseInsensitive)
            else{
                return
        }
        XCTAssert(a=="sss==sss==sss==sss")
        do{
            let _ = try "sss   sss   sss   sss".replace(match: "\\s{1,", with: "==", options: NSRegularExpression.Options.caseInsensitive)
        }catch{
            print(">=>\(error)")
            XCTAssert(true)
            return
        }
        XCTAssert(false)
        print(a)

    }

    func testRemoveWhiteCharaters()  {
        let x = " a    b  c中文 d   e f    g  "
        XCTAssert(x.removeWhiteCharacters()=="abc中文defg")
        let y = "asdfgh"
        XCTAssert(y.removeWhiteCharacters()==y)
        XCTAssert(x.removeWhiteCharacters(at: .StartAndEnd)=="a    b  c中文 d   e f    g")
        XCTAssert(x.removeWhiteCharacters(at: .End)==" a    b  c中文 d   e f    g")
        XCTAssert(x.removeWhiteCharacters(at: .Start)=="a    b  c中文 d   e f    g  ")
    }

    func testStringMatch() {
        let testStr = "abcdefg"

        assert(testStr.isMatch(regular: "^[a-z]{1,7}$"))

        let testStr2 = "13983311153"
        assert(testStr2.isMatch(regular: "\\d{11}"))

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
