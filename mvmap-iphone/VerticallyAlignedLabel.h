//
//  VerticallyAlignedLabel.h
//  mvmap-iphone
//
//  Created by XHB on 13-9-7.
//  Copyright (c) 2013年 XHB. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum{
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom
} VerticalAlignment;

@interface VerticallyAlignedLabel : UILabel

@property (nonatomic) VerticalAlignment verticalAlignment;

@end
