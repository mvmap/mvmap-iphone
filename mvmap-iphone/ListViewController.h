//
//  ListViewController.h
//  mvmap-iphone
//
//  Created by XHB on 13-9-7.
//  Copyright (c) 2013年 XHB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"

@interface ListViewController : UITableViewController <EGORefreshTableHeaderDelegate>


- (void)openCategory:(NSInteger)catId;

@end
