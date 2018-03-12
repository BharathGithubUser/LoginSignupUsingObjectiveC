//
//  ViewController.h
//  LoginScreenTask
//
//  Created by user on 09/03/18.
//  Copyright © 2018 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UITextField *emailText;
- (IBAction)forgotPasswordButton:(id)sender;
- (IBAction)signUpButton:(id)sender;
- (IBAction)signInButton:(id)sender;


@end

