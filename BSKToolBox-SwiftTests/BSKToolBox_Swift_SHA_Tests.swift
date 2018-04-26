//
//  BSKToolBox_SwiftTests.swift
//  BSKToolBox-SwiftTests
//
//  Created by 刘万林 on 2018/4/25.
//  Copyright © 2018年 LiuWanLin. All rights reserved.
//

import XCTest
import BSKToolBox_Swift

class BSKToolBox_Swift_SHA_Tests: XCTestCase {

    let inouts = ["123456&","abcdef$g","12345abcdef.","中文测试!!！！"]

    let answers_MD5 = ["5dc46b97b4c164ad59ad2cd76a11d02f",
                       "476080770007e1318c230aeb96c71907",
                       "2c5ccb843e3e0c81cbdc32aca64a3894",
                       "d4bdbec25ef94dcba7ad9ce5e1f16197"]
    let answers_SHA1 = ["e49e1738fc60ed8d3fd989e0d83c647cd9cb623e",
                        "75f71a8792871b8d41681fbc859f79fcb4a78d84",
                        "f7f1420db312a064d8f8508ed3530ae23d03a743",
                        "fd6bd6e42afd9f59cabbebc51c9eb2d3fc109fa6"]
    let answers_SHA224 = ["ea74fb4affaebd2d190e11df911b0ae2f1aeb12efd8b1c20d5c6dd29",
                          "b37f94823d11c3b69f1b2745c26e8e08f4ae769fc32e0b27489bd34d",
                          "c4b072e395f524a9dc4ac41135bb8ffe2ee6fbb4cb71b6e16f1f6fb9",
                          "62e8895bde95bc9335c888bea937f3ee1231be76de01b3c7ad54706a"]
    let answers_SHA256 = ["351bd45d05dbd2de402ee8a2ee7b5b9c59f3c745e5028099a96d986c255cdde6",
                          "107dbe21e38f3f2142391d0924adcf757e1faefe173a06b69197a252b8962707",
                          "7cda412739bc363c27f505f8d9e5aa9b7c69b6f8b7f10098cef5a2f6e2920699",
                          "76c500b72430ec9bf5f5a0dc5397e6b6570d9421d8f257f977fdb871a435ba2a"]
    let answers_SHA384 = ["bfa8dc40e063998a48c36a6d5e11cba0a92afc5b5da407fc70ad63bf03a2ea6d3db969ad7bb4a221104e5e91dde4fdbd",
                          "4eccf675fa98df2a052838a4a4466f5f01cfc3625b8bcb675c27fd71a1d4b9e7bc11ba10e76214bc4a374aa874337445",
                          "64de403dc0fc5ada19f1aa49775a5c3bc23c7a0e97dbee624af251175d4a78bc4c7b7f235bd9018622be343cbec099a0",
                          "9af076a346521642579a50d221fcbab6d17a9c5d3a18c7e98450654dbc6f9d806fbe75e82a6927c9eefe216d5d621a55"]
    let answers_SHA512 =
        ["afd82cec6db4618996504d5dbc241ce43f5cbac150bf1f710367b97ddab0cc3be10091c8a45a297934cf829f5bc0270a83a69a735b8e9181b39eba047d55a3a2",
         "787df689613120b30606e75af535902817d981ed4b13f21343a577cdf2e32b52404673fd613c493dac6d5507b54aee2d5872d40b4388b45bbc4495da5c96aa52",
         "628e765969aa800736f353f4ed970ae4d637e70f32c8a02133d6f2fbcbe7db5b3f33b0a425f6a8efd6684c6609fac1217fe36fb7b6d17004174aa2706bcc93a6",
         "ca1f8ab8b7ceb01bcad980a603d5c4ef751a6b97a6ceffdecf25fe2b3e0f5b1bbe9e170d884e008132a372015229c7ad6fd0688a4ff37ba46ee77afaf1c2e61d"]

    override func setUp() {
        super.setUp()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_String_SHA() {
        for (index,str) in inouts.enumerated() {
            XCTAssert(str.sha1==answers_SHA1[index])
            XCTAssert(str.MD5==answers_MD5[index])
            XCTAssert(str.sha1==answers_SHA1[index])
            XCTAssert(str.sha256==answers_SHA256[index])
            XCTAssert(str.sha224==answers_SHA224[index])
            XCTAssert(str.sha384==answers_SHA384[index])
            XCTAssert(str.sha512==answers_SHA512[index])
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
