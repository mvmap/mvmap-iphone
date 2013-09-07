//
//  ArticleModel.h
//  mvmap-iphone
//
//  Created by XHB on 13-9-7.
//  Copyright (c) 2013年 XHB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticleModel : NSObject

@property (assign, nonatomic) NSInteger aid;
@property (assign, nonatomic) NSInteger catId;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *feedName;
@property (strong, nonatomic) NSString *img;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSString *from;


@end
