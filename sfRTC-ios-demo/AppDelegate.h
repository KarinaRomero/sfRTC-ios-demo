//
//  AppDelegate.h
//  sfRTC-ios-demo
//
//  Created by Karina Betzabe Romero Ulloa on 15/08/18.
//  Copyright © 2018 Karina Betzabe Romero Ulloa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

