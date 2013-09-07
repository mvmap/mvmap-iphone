//
//  VerticallyAlignedLabel.m
//  mvmap-iphone
//
//  Created by XHB on 13-9-7.
//  Copyright (c) 2013年 XHB. All rights reserved.
//

#import "VerticallyAlignedLabel.h"

@implementation VerticallyAlignedLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _verticalAlignment = VerticalAlignmentMiddle;
    }
    return self;
}


- (void)setVerticalAlignment:(VerticalAlignment)verticalAlignment {
    
    _verticalAlignment = verticalAlignment;
    
    [self setNeedsDisplay];
}


-(void)drawTextInRect:(CGRect)rect {
    CGRect textRect = [super textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    switch (self.verticalAlignment) {
        case VerticalAlignmentTop:
            textRect.origin.y = rect.origin.y;
            break;
        case VerticalAlignmentBottom:
            textRect.origin.y = rect.origin.y + rect.size.height - textRect.size.height;
            break;
        case VerticalAlignmentMiddle:
            // Fall through.
        default:
            textRect.origin.y = rect.origin.y + (rect.size.height - textRect.size.height) / 2.0;
    }
    [super drawTextInRect:textRect];
}

@end
