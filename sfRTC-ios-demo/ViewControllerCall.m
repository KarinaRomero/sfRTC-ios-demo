//
//  ViewControllerCall.m
//  sfRTC-ios-demo
//
//  Created by Karina Betzabe Romero Ulloa on 15/08/18.
//  Copyright © 2018 Karina Betzabe Romero Ulloa. All rights reserved.
//

#import "ViewControllerCall.h"

@interface ViewControllerCall ()

@end

@implementation ViewControllerCall

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"MessageSegue"]) {
        ViewControllerMessage *callView = [segue destinationViewController];
        
        callView.message = @"_userName";
    }
}


- (IBAction)txtUserName:(id)sender {
}

- (IBAction)btnLogin:(id)sender {
}
@end
