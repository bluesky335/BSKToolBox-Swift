//
//  NSString+HASH.h
//  BSKToolBox-Swift
//
//  Created by 刘万林 on 2018/4/26.
//  Copyright © 2018年 LiuWanLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HASH)
-(nonnull NSString *)bsk_sha1;
-(nonnull NSString *)bsk_sha224;
-(nonnull NSString *)bsk_sha256;
-(nonnull NSString *)bsk_sha384;
-(nonnull NSString *)bsk_sha512;
/**
 获取字符串的MD5编码（32位）
 @return md5编码
 */
-(nonnull NSString *)bsk_MD5;
@end
