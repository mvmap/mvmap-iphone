//
//  ChannelViewController.m
//  mvmap-iphone
//
//  Created by XHB on 13-9-7.
//  Copyright (c) 2013年 XHB. All rights reserved.
//

#import "ChannelViewController.h"
#import "IIViewDeckController.h"
#import "HttpClient.h"
#import "ListViewController.h"

@interface ChannelViewController ()

@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation ChannelViewController


- (void)dealloc{
    
    [self.dataArray release];
    
    [super dealloc];
}


- (void)viewDidLoad{
    [super viewDidLoad];
    

    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navigation_list_background"]];
    self.tableView.separatorColor = [UIColor grayColor];
    
    
    [self initNavigationBarButtons];
    

    NSString *data = [[HttpClient sharedInstance] getUrl:@"http://api.mvmap.com/item/category"];
    NSDictionary *dict = [data objectFromJSONString];
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[dict count]];
    NSEnumerator *enumerator = [dict objectEnumerator];
    id value;
    while((value = [enumerator nextObject])){
        [array addObject:value];
    }
    self.dataArray = array;
    
}

//初始化导航栏按钮
- (void)initNavigationBarButtons{
    
    UIImage *image = [UIImage imageNamed:@"navigation_top_bar_setting_btn.png"];
    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    settingButton.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    [settingButton setBackgroundImage:image forState:UIControlStateNormal];
    [settingButton addTarget:self action:@selector(settingButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *settingButtonItem = [[UIBarButtonItem alloc] initWithCustomView:settingButton];
    self.navigationItem.rightBarButtonItem = settingButtonItem;
    [settingButtonItem release];
}

- (void)settingButtonClick:(id)sender{
    
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}


#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.viewDeckController closeLeftViewAnimated:YES duration:0.5 completion:^(IIViewDeckController *controller, BOOL success) {
        if ([controller.centerController isKindOfClass:[UINavigationController class]]) {
            ListViewController *cc = (ListViewController *)((UINavigationController*)controller.centerController).topViewController;
            cc.navigationItem.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
            
            [cc openCategory:3];
        }

    }];
    
}

@end
