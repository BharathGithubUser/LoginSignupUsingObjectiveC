//
//  ViewController.m
//  LoginScreenTask
//
//  Created by user on 09/03/18.
//  Copyright © 2018 user. All rights reserved.
//

#import "ViewController.h"
#import "WelcomeScreen.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Came inside ViewController.m viewDidLoad");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"Came inside ViewController.m didReceiveMemoryWarning");
}

- (IBAction)forgotPasswordButton:(id)sender {
    NSLog(@"Came inside ViewController.m forgotPasswordButton");
    [self alertMessage:@"ForgotPassword" :@"It seems that there is no any existing account...please sign up in order to use this option" :@"Ok"];
}

- (IBAction)signUpButton:(id)sender {
    NSLog(@"Came inside ViewController.m signUpButton");
    [self alertMessage:@"Sign Up" :@"Signup page creation is in progress...we will let you soon there!" :@"Ok"];
}

- (IBAction)signInButton:(id)sender {
    
    if([self.emailText hasText]){  //checking isEmpty(email)
        
        if([self validateEmail:self.emailText.text]){ //validating(email)
            
            if([self.emailText hasText]){  //checking isEmpty(password)
                
                if([self validatePassword:self.passwordText.text]){ //validating(password)
                    
                    NSLog(@"Password validated successfully!");
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    WelcomeScreen* controller = [storyboard instantiateViewControllerWithIdentifier:@"welcomeScreen"];
                    [self.navigationController pushViewController:controller animated:YES];
                    
                }else{
                    
                    NSLog(@"Password Must have minimum 6 characters!");
                    [self alertMessage:@"Password Error" :@"The Password Field must have atleast 6 characters" :@"Ok, I got it!"];
                    
                }
            }else{
                
                NSLog(@"Empty Password!");
                [self alertMessage:@"Empty Password" :@"The Password Field Couldn't be Empty" :@"Ok, I got it!"];
                
            }
        }else{
            
            NSLog(@"Invalid Email!");
            [self alertMessage:@"Invalid Email" :@"Please Enter Valid Email! Eg. domain@example.com" :@"Ok, I got it!"];
            
        }
    }else{
        
        NSLog(@"Empty Email!");
        [self alertMessage:@"Empty Email" :@"The Email Field Couldn't be empty" :@"Ok, I got it!"];
        
    }
    
}
-(void) alertMessage: (NSString *) title :(NSString *) messageBody:(NSString *) actionText{
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:title
                                 message:messageBody
                                 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:actionText
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   [self dismissViewControllerAnimated:YES completion:nil];
                               }];
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
}
- (BOOL) validateEmail: (NSString *) email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

- (BOOL) validatePassword: (NSString *) password{
    if ( [password length]<6 )
        return NO;
    else
        return YES;
}

@end
