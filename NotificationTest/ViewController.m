//
//  ViewController.m
//  NotificationTest
//
//  Created by Killian O'Connell on 30/11/2016.
//  Copyright © 2016 BIG HEALTH LTD. All rights reserved.
//

#import "ViewController.h"
@import UserNotifications;


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    UNAuthorizationOptions options = (
                                      UNAuthorizationOptionBadge|UNAuthorizationOptionSound|UNAuthorizationOptionAlert
                                      );
    [center requestAuthorizationWithOptions:options
                          completionHandler:^(BOOL granted, NSError * _Nullable error)
    {
        
        UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
        content.body = @"Hello there!";
        content.categoryIdentifier = @"myNotificationCategory";
        
        UNNotificationAction *action = [UNNotificationAction actionWithIdentifier:@"accept"
                                                                            title:@"Sounds great!"
                                                                          options:0];
        
        UNNotificationCategory *category = [UNNotificationCategory categoryWithIdentifier:@"myNotificationCategory"
                                                                                  actions:@[action]
                                                                        intentIdentifiers:@[]
                                                                                  options:0];
        NSSet *categories = [NSSet setWithObjects:category, nil];
        [[UNUserNotificationCenter currentNotificationCenter] setNotificationCategories:categories];
        UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5.0 repeats:false];
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"" content:content trigger:trigger];
        [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:nil];
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
