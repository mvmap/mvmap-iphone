//
//  ListTableViewCell.m
//  mvmap-iphone
//
//  Created by XHB on 13-9-7.
//  Copyright (c) 2013年 XHB. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ListTableViewCell.h"
#import "VerticallyAlignedLabel.h"


#define kHeight (70)


@interface ListTableViewCell ()


@end

@implementation ListTableViewCell

- (void)dealloc{
    
    [self.imgView release];
    [self.titleLabel release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CGSize size = [UIScreen mainScreen].bounds.size;
        
        self.frame = CGRectMake(0, 0, size.width, kHeight);
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 2, 100, 66)];
        [self addSubview:imgView];
        self.imgView = imgView;
        [imgView release];
        
        
        VerticallyAlignedLabel *titleLabel = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(110, 2, size.width-115, 66)];
        titleLabel.layer.borderWidth = 0;
        titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        titleLabel.numberOfLines = 0;
        titleLabel.verticalAlignment = VerticalAlignmentTop;
        titleLabel.font = [UIFont fontWithName:@"FZLanTingHeiS-R-GB" size:14];
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
        [titleLabel release];

    }
    return self;
}

+ (CGFloat)getHeight{
    return kHeight;
}


@end
