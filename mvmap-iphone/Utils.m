//
//  Utils.m
//  mvmap-iphone
//
//  Created by XHB on 13-9-4.
//  Copyright (c) 2013年 XHB. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "Utils.h"
#import "NSData+AES.h"
#import "GTMBase64.h"


#define kRateTimes  (@"RateTimes")


@implementation Utils

static Utils *utils;


+ (UIColor *)colorWithHex:(NSInteger)hexValue{
    CGFloat r = ((hexValue & 0xFF0000) >> 16)/255.0;
    CGFloat g = ((hexValue & 0xFF00) >> 8)/255.0;
    CGFloat b = (hexValue & 0xFF)/255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

+ (NSInteger)RGB:(int)r g:(int)g b:(int)b {
    return r << 16 | g << 8 | b;
}

+ (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

+ (NSString *)md5Hex:(NSString *)str{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result);
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
    
}



+ (void) rateApp: (int)times{
    
    if(utils == nil){
        utils = [[Utils alloc] init];
    }
    
    [utils checkRate:times];
}

- (void) checkRate: (int)times{
    NSNumber *time = [[NSUserDefaults standardUserDefaults] objectForKey:kRateTimes];
    
    int timeLeft;
    
    if(time == nil){
        timeLeft = times;
    }else{
        timeLeft = [time intValue];
    }
    
    if(timeLeft > 0){
        timeLeft--;
        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:timeLeft] forKey:kRateTimes];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }else if(timeLeft == 0){
        timeLeft = -1;
        
        NSString *appName = [NSString stringWithString:NSLocalizedString(@"CFBundleDisplayName", nil)];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:[NSString stringWithFormat:@"喜欢%@吗？去评价一下吧",appName]
                                                       delegate:self
                                              cancelButtonTitle:@"下次提醒我"
                                              otherButtonTitles:@"去评价", nil];
        [alert show];
        [alert release];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    int timeLeft = 0;
    if(buttonIndex == 0) {
        timeLeft = 0;
    }else if(buttonIndex == 1){
        timeLeft = -1;
        NSString *reviewUrl = [NSString stringWithString:NSLocalizedString(@"reviewUrl", nil)];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:reviewUrl]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:timeLeft] forKey:kRateTimes];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)documentDirectory{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}


+ (NSString *)AESEncrypt:(NSString *)text key:(NSString *)key{
    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
    NSData *result = [data AES256EncryptWithKey:key];
    return [GTMBase64 stringByWebSafeEncodingData:result padded:NO];
}

+ (NSString *)AESDecrypt:(NSString *)text key:(NSString *)key{
    NSData *data = [[GTMBase64 webSafeDecodeString:text] AES256DecryptWithKey:key];
    NSString *result = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
    return result;
}


@end
