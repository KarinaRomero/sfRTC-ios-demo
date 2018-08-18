//
//  ViewControllerMessage.h
//  sfRTC-ios-demo
//
//  Created by Karina Betzabe Romero Ulloa on 15/08/18.
//  Copyright © 2018 Karina Betzabe Romero Ulloa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerCall.h"

@interface ViewControllerMessage : UIViewController <UITextFieldDelegate>
@property (nonatomic, assign) NSString* message;
@property (nonatomic) PeerConnectionClient* peerConnectionClient;
@end
