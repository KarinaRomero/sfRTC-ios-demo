//
//  ViewControllerCall.h
//  sfRTC-ios-demo
//
//  Created by Karina Betzabe Romero Ulloa on 15/08/18.
//  Copyright © 2018 Karina Betzabe Romero Ulloa. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <sfRTC_iOS_framework/PeerConnectionClient.h>

#import <WebRTC/RTCEAGLVideoView.h>
#import <WebRTC/RTCVideoTrack.h>

#import "ViewControllerMessage.h"


@interface ViewControllerCall : UIViewController <RTCEAGLVideoViewDelegate, RTCShowVideoProtocol, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *lblUserConnected;
@property (strong, nonatomic) IBOutlet UITextField *txtCallTo;
@property (strong, nonatomic) IBOutlet UIButton *btnCall;
@property (strong, nonatomic) IBOutlet UIButton *btnHangUp;

@property (nonatomic, assign) NSString* userName;

@property (strong, nonatomic) IBOutlet RTCEAGLVideoView *localView;
@property (strong, nonatomic) IBOutlet RTCEAGLVideoView *remoteView;

@property (strong, nonatomic) RTCVideoTrack *localVideoTrack;
@property (strong, nonatomic) RTCVideoTrack *remoteVideoTrack;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer *previewLayer;

@end

