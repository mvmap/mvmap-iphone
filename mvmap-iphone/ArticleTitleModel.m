//
//  ArticleTitleModel.m
//  mvmap-iphone
//
//  Created by XHB on 13-9-7.
//  Copyright (c) 2013年 XHB. All rights reserved.
//

#import "ArticleTitleModel.h"

@implementation ArticleTitleModel

- (void)dealloc{
    
    [self.title release];
    [self.feedName release];
    [self.img release];
    
    [super dealloc];
}

@end
