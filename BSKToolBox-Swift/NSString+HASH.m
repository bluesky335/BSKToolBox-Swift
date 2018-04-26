//
//  NSString+HASH.m
//  BSKToolBox-Swift
//
//  Created by 刘万林 on 2018/4/26.
//  Copyright © 2018年 LiuWanLin. All rights reserved.
//

#import "NSString+HASH.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (HASH)

- (NSString*)bsk_sha1
{

    const char *s = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *keyData = [NSData dataWithBytes:s length:strlen(s)];

    uint8_t digest[CC_SHA1_DIGEST_LENGTH] = {0};
    CC_SHA1(keyData.bytes, (CC_LONG)keyData.length, digest);
    NSData *outPutData = [NSData dataWithBytes:digest length:CC_SHA1_DIGEST_LENGTH];
    NSString *hash = [outPutData description];
    hash = [hash stringByReplacingOccurrencesOfString:@" " withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@"<" withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@">" withString:@""];
    return hash;
}

- (NSString*)bsk_sha224
{

    const char *s = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *keyData = [NSData dataWithBytes:s length:strlen(s)];

    uint8_t digest[CC_SHA224_DIGEST_LENGTH] = {0};
    CC_SHA224(keyData.bytes, (CC_LONG)keyData.length, digest);
    NSData *outPutData = [NSData dataWithBytes:digest length:CC_SHA224_DIGEST_LENGTH];
    NSString *hash = [outPutData description];
    hash = [hash stringByReplacingOccurrencesOfString:@" " withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@"<" withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@">" withString:@""];
    return hash;
}

- (NSString*)bsk_sha256
{

    const char *s = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *keyData = [NSData dataWithBytes:s length:strlen(s)];

    uint8_t digest[CC_SHA256_DIGEST_LENGTH] = {0};
    CC_SHA256(keyData.bytes, (CC_LONG)keyData.length, digest);
    NSData *outPutData = [NSData dataWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];
    NSString *hash = [outPutData description];
    hash = [hash stringByReplacingOccurrencesOfString:@" " withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@"<" withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@">" withString:@""];
    return hash;

}

- (NSString*)bsk_sha384
{
    const char *s = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *keyData = [NSData dataWithBytes:s length:strlen(s)];

    uint8_t digest[CC_SHA384_DIGEST_LENGTH] = {0};
    CC_SHA384(keyData.bytes, (CC_LONG)keyData.length, digest);
    NSData *outPutData = [NSData dataWithBytes:digest length:CC_SHA384_DIGEST_LENGTH];
    NSString *hash = [outPutData description];
    hash = [hash stringByReplacingOccurrencesOfString:@" " withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@"<" withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@">" withString:@""];
    return hash;
}

- (NSString*)bsk_sha512
{

    const char *s = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *keyData = [NSData dataWithBytes:s length:strlen(s)];

    uint8_t digest[CC_SHA512_DIGEST_LENGTH] = {0};
    CC_SHA512(keyData.bytes, (CC_LONG)keyData.length, digest);
    NSData *outPutData = [NSData dataWithBytes:digest length:CC_SHA512_DIGEST_LENGTH];
    NSString *hash = [outPutData description];
    hash = [hash stringByReplacingOccurrencesOfString:@" " withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@"<" withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@">" withString:@""];
    return hash;
}

/**
 获取字符串的MD5编码（32位）

 @return md5编码
 */
-(NSString * __nonnull)bsk_MD5{
    const char * cstr = [self UTF8String];
    unsigned char md5data[16];
    CC_MD5(cstr,(unsigned int)strlen(cstr),md5data);
    NSMutableString * md5string = [NSMutableString string];
    for (int i = 0;i<16;i++) {
        [md5string appendFormat:@"%02x",md5data[i]];
    }
    return md5string;
}

@end

