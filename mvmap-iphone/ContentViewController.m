//
//  ContentViewController.m
//  mvmap-iphone
//
//  Created by XHB on 13-9-7.
//  Copyright (c) 2013年 XHB. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ContentViewController.h"
#import "HttpClient.h"

@interface ContentViewController ()

@property (strong, nonatomic) UIWebView *webView;

@end

@implementation ContentViewController

- (void)dealloc{
    
    [self.webView release];
    
    [super dealloc];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height - 66)];
    webView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:webView];
    self.webView = webView;
    [webView release];
    
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, size.height - 66, size.width, 46)];
    [toolBar setBackgroundImage:[UIImage imageNamed:@"text_page_tool_bar.png"] forToolbarPosition:UIToolbarPositionBottom barMetrics:UIBarMetricsDefault];
    [self.view addSubview:toolBar];
    [toolBar release];
    
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backButtonImage = [UIImage imageNamed:@"text_page_tool_bar_back_btn.png"];
    backButton.frame = CGRectMake(2, 3, backButtonImage.size.width, backButtonImage.size.height);
    [backButton setBackgroundImage:backButtonImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [toolBar addSubview:backButton];
    
    UIButton *likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *likeButtonImage = [UIImage imageNamed:@"text_page_tool_bar_like_btn.png"];
    likeButton.frame = CGRectMake(80, 3, likeButtonImage.size.width, likeButtonImage.size.height);
    [likeButton setBackgroundImage:likeButtonImage forState:UIControlStateNormal];
    [likeButton addTarget:self action:@selector(likeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [toolBar addSubview:likeButton];
    
    UIButton *collectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *collectButtonImage = [UIImage imageNamed:@"text_page_tool_bar_collect_btn.png"];
    collectButton.frame = CGRectMake(160, 3, collectButtonImage.size.width, collectButtonImage.size.height);
    [collectButton setBackgroundImage:collectButtonImage forState:UIControlStateNormal];
    [collectButton addTarget:self action:@selector(collectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [toolBar addSubview:collectButton];
    
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *shareButtonImage = [UIImage imageNamed:@"text_page_tool_bar_share_btn.png"];
    shareButton.frame = CGRectMake(240, 3, shareButtonImage.size.width, shareButtonImage.size.height);
    [shareButton setBackgroundImage:shareButtonImage forState:UIControlStateNormal];
    [shareButton addTarget:self action:@selector(shareButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [toolBar addSubview:shareButton];
    
    
    NSString *url = [NSString stringWithFormat:@"http://api.mvmap.com/item/%i",_aid];
    NSString *data = [[HttpClient sharedInstance] getUrl:url];
    NSArray *array = [data objectFromJSONString];
    NSDictionary *dict = [array objectAtIndex:0];
    [self.webView loadHTMLString:[dict objectForKey:@"content"] baseURL:nil];
    NSLog(@"content = %@",data);
    
}

- (void)backButtonClick:(id)sender{
    
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)likeButtonClick:(id)sender{
    
    
}

- (void)collectButtonClick:(id)sender{
    
    
}

- (void)shareButtonClick:(id)sender{
    
    
}

@end
