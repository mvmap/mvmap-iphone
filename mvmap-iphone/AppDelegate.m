//
//  AppDelegate.m
//  mvmap-iphone
//
//  Created by XHB on 13-9-3.
//  Copyright (c) 2013年 XHB. All rights reserved.
//

#import "AppDelegate.h"
#import "IIViewDeckController.h"
#import "ChannelViewController.h"
#import "ListViewController.h"


@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self launchingApp];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)launchingApp{
    
//    CGSize size = [UIScreen mainScreen].bounds.size;
    
    ChannelViewController *channelViewController = [[ChannelViewController alloc] init];
    UINavigationController *leftViewController = [[UINavigationController alloc] initWithRootViewController:channelViewController];
    [leftViewController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation_top_bar_background"] forBarMetrics:UIBarMetricsDefault];
    [channelViewController release];
    
    ListViewController *listViewController = [[ListViewController alloc] init];
    UINavigationController *centerViewController = [[UINavigationController alloc] initWithRootViewController:listViewController];
    [centerViewController.navigationBar setBackgroundImage:[UIImage imageNamed:@"title_bar_background"] forBarMetrics:UIBarMetricsDefault];
    [listViewController release];

    IIViewDeckController *viewDeckController = [[IIViewDeckController alloc] initWithCenterViewController:centerViewController leftViewController:leftViewController];
    viewDeckController.panningMode = IIViewDeckPanningViewPanning;
    viewDeckController.panningView = listViewController.view;
    self.window.rootViewController = viewDeckController;
    
    [leftViewController release];
    [centerViewController release];
    [viewDeckController release];
    
}

@end
