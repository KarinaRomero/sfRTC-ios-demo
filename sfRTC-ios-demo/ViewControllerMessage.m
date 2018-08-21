//
//  ViewControllerMessage.m
//  sfRTC-ios-demo
//
//  Created by Karina Betzabe Romero Ulloa on 15/08/18.
//  Copyright © 2018 Karina Betzabe Romero Ulloa. All rights reserved.
//

#import "ViewControllerMessage.h"

@interface ViewControllerMessage ()
@property (strong, nonatomic) IBOutlet UILabel *lblMessageReceived;
@property (nonatomic) IBOutlet UITextField *txtMessageToSend;
@property (strong, nonatomic) IBOutlet UIButton *btnSendMessage;

@end

@implementation ViewControllerMessage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _txtMessageToSend.delegate = self;
    _lblMessageReceived.text = _message;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
- (IBAction)actionBtnSendMessage:(id)sender {
    [_peerConnectionClient sendMessageDataChannel:_txtMessageToSend.text];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
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
