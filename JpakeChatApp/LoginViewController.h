//
//  LoginViewController.h
//  Jpake
//
//  Created by Renu Srijith on 15/04/2016.
//  Copyright © 2016 newcastle university. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase.h>
@interface LoginViewController : UIViewController
@property (strong, nonatomic) Firebase *ref;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;



- (IBAction)login:(id)sender;



@end
