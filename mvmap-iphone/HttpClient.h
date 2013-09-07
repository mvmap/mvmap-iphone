//
//  HttpClient.h
//  mvmap-iphone
//
//  Created by XHB on 13-9-4.
//  Copyright (c) 2013年 XHB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONKit.h"

#define kBaseURL        (@"http://")



@interface HttpClient : NSObject <UIAlertViewDelegate>

+ (HttpClient *)sharedInstance;

//检查网络连接
- (BOOL)checkNetworkAvailable;


//发送POST请求，同步返回数据
- (NSString *)postUrl:(NSString *)url data:(NSDictionary *)data;


//发送GET请求，同步返回数据
- (NSString *)getUrl:(NSString *)url;




@end
