//
//  AlertUtils.m
//  YADR
//
//  Created by XHB on 13-5-22.
//  Copyright (c) 2013年 XHB. All rights reserved.
//

#import "AlertUtils.h"


@implementation AlertUtils

+ (void)showMessage:(NSString *)message{
    
    [AlertUtils showMessage:message style:GRAlertViewStyleNone];
}


+ (void)showMessage:(NSString *)message style:(GRAlertViewStyle)style{
    if(message == nil){
        return;
    }
    NSLog(@"alert message = %@",message);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        GRAlertView *alertView = [[GRAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        alertView.style = style;
        [alertView show];
        [alertView release];
    });
}

@end
