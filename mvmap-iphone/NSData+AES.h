//
//  NSData+AES.h
//
//  Created by XHB on 13-4-6.
//  Copyright (c) 2013年 XHB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES)

- (NSData *)AES256EncryptWithKey:(NSString *)key;

- (NSData *)AES256DecryptWithKey:(NSString *)key;

@end
