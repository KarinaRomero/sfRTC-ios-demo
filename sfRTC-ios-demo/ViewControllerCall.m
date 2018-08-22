//
//  ViewControllerCall.m
//  sfRTC-ios-demo
//
//  Created by Karina Betzabe Romero Ulloa on 15/08/18.
//  Copyright © 2018 Karina Betzabe Romero Ulloa. All rights reserved.
//

#import "ViewControllerCall.h"

@interface ViewControllerCall ()

@property (nonatomic) PeerConnectionClient* peerConnectionClient;
@property (nonatomic, assign) NSString* url;
@property (nonatomic) NSString* message;

@property (nonatomic, strong) RTCMediaStream *localStream;
@property (nonatomic, strong) RTCMediaStream *remoteStream;

@end

@implementation ViewControllerCall

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupConnection];
    
    _txtCallTo.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)actionBtnCall:(id)sender {
    [_peerConnectionClient call:_txtCallTo.text];
}

- (IBAction)actionBtnHangUp:(id)sender {
     [_peerConnectionClient hangUp];
}

-(void)setupConnection{
    // If user name is diferent of null create a new connection
    if(_userName){
        _lblUserConnected.text = _userName;
        _url = @"ws://your.url.signaling";
        _peerConnectionClient =  [[PeerConnectionClient alloc] initWhitNameUrlVideoDelegateEnableDataChannel:_userName :_url: self: true];
        
    }else{
        NSLog(@"User name cannot found");
    }
}



#pragma mark - RTCShowVideoProtocol

- (void)didReceiveData:(NSString *)message {
    self.message = message;
}

- (void)didReceiveLocalStream:(RTCMediaStream *)localVideoTrack {
    self.localStream = localVideoTrack;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    
    self.localView = [[RTCEAGLVideoView alloc] initWithFrame:CGRectMake(0, height/3, width/2, height/3+100)];
    [self.view addSubview:self.localView];
    if (self.localStream.videoTracks.count > 0) {
        RTCVideoTrack *videoTrack = self.localStream.videoTracks.firstObject;
        [videoTrack addRenderer:self.localView];
    }
}

- (void)didReceiveRemoteStream:(RTCMediaStream *)remoteVideoTrack {
    self.remoteStream = remoteVideoTrack;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    self.remoteView = [[RTCEAGLVideoView alloc] initWithFrame:CGRectMake(width/2, height/3, width/2, height/3+100)];
    [self.view addSubview:self.remoteView];
    
    if (self.remoteStream.videoTracks.count > 0) {
        RTCVideoTrack *videoTrack = self.remoteStream.videoTracks.firstObject;
        [videoTrack addRenderer:self.remoteView];
    }
}

- (void)didReceiveCall:(NSString *)callId {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Recibiendo llamada de:  "
                                                                   message:callId
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Answer" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              [self->_peerConnectionClient answer];
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)didRemoveRemoteStream:(NSString *)callId {
    NSLog(@"%@", callId);
    
    self.remoteView = [[RTCEAGLVideoView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self.view addSubview:self.remoteView];
}


- (void)didStatusChanged:(NSString *)status {
    NSLog(@"%@", status);
}

#pragma mark - RTCEAGLVideoViewDelegate
- (void)videoView:(nonnull RTCEAGLVideoView *)videoView didChangeVideoSize:(CGSize)size {
    
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    return parentSize;
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    
}

- (void)setNeedsFocusUpdate {
    
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
     return YES;
}

- (void)updateFocusIfNeeded {
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"MessageSegue"]) {
        ViewControllerMessage *callView = [segue destinationViewController];
        
        callView.message = self.message;
        callView.peerConnectionClient = self.peerConnectionClient;
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

// It is important for you to hide the keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
