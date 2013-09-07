//
//  AlertUtils.h
//  YADR
//
//  Created by XHB on 13-5-22.
//  Copyright (c) 2013年 XHB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GRAlertView.h"

@interface AlertUtils : NSObject

+ (void)showMessage:(NSString *)message;

+ (void)showMessage:(NSString *)message style:(GRAlertViewStyle)style;

@end
