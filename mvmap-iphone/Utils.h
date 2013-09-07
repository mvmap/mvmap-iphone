//
//  Utils.h
//  mvmap-iphone
//
//  Created by XHB on 13-9-4.
//  Copyright (c) 2013年 XHB. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SYSTEM_VERSION      ([[[UIDevice currentDevice] systemVersion] floatValue])
#define IS_568H             ([[UIScreen mainScreen] bounds].size.height == 568)
#define OFFSET_568H(X)      ((IS_568H) ? (X+88) : (X))
#define OFFSET_P_568H(X,F)  ((IS_568H) ? (X+F) : (X))

#define RGBA(r,g,b,a)       [UIColor colorWithRed:((r)/255.0) green:((g)/255.0) blue:((b)/255.0) alpha:(a)]



@interface Utils : NSObject

/**
 颜色值转换
 */
+ (UIColor *)colorWithHex:(NSInteger)hexValue;


/**
 MD5算法
 */
+ (NSString *)md5Hex:(NSString *)str;

/*
 app文档目录
 */
+ (NSString *)documentDirectory;

/**
 AES算法加密
 */
+ (NSString *)AESEncrypt:(NSString *)text key:(NSString *)key;

/**
 AES算法解密
 */
+ (NSString *)AESDecrypt:(NSString *)text key:(NSString *)key;
@end
