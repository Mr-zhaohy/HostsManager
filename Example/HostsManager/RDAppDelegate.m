//
//  RDAppDelegate.m
//  HostsManager
//
//  Created by Mr_zhaohy on 11/21/2017.
//  Copyright (c) 2017 Mr_zhaohy. All rights reserved.
//

#import "RDAppDelegate.h"
#import <HostsManager/HostsManager.h>
#import <HostsManager/CustomHostsView.h>
#import <HostsManager/AccelerometerManager.h>

@interface RDAppDelegate()<CustomHostsViewDelegate>
@end

@implementation RDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *url = @"http://www.baidu.com/";
    if(![[HostsManager shared].currentHostsUrl isEqualToString:url]){
        [[HostsManager shared] addHostsUrl:url default:NO];
    }
    NSLog(@"当前地址：%@",[HostsManager shared].currentHostsUrl);

    [self startAccelerometer];
    // Override point for customization after application launch.
    return YES;
}
-(void)setDefaultWithUrl:(NSString *)url{
    NSLog(@"默认地址：%@",[HostsManager shared].currentHostsUrl);
}
-(void)customHostsViewDismiss{
    [self startAccelerometer];
}
-(void)startAccelerometer{
    CustomHostsView *custonView = [[CustomHostsView alloc]init];
    custonView.delegate = self;
    [[AccelerometerManager sharedManager] startAccelerometer:4.0 withHandel:^(BOOL active) {
        if (active) {
            [custonView show];
        }
    }];
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

@end
