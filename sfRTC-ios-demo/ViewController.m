//
//  ViewController.m
//  VideoCall-WebRTC
//
//  Created by Karina Betzabe Romero Ulloa on 28/05/18.
//  Copyright © 2018 Karina Betzabe Romero Ulloa. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *buttonSend;
@property (strong, nonatomic) IBOutlet UITextField *textUserName;
@property (nonatomic) NSString *loginName;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)buttonSend:(id)sender {
    _loginName= self.textUserName.text;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"CallSegue"]) {
        ViewControllerCall *callView = [segue destinationViewController];
        
        callView.userName = _loginName;
    }
}
@end















