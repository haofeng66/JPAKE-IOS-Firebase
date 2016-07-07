//
//  signupViewController.m
//  Jpake
//
//  Created by Renu Srijith on 15/04/2016.
//  Copyright © 2016 newcastle university. All rights reserved.
//

#import "signupViewController.h"
#import <Firebase.h>
#include "InboxTableViewController.h"
#include "DataBasics.h"



@interface signupViewController ()

@end

@implementation signupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton =YES;
    self.ref =[[Firebase alloc] initWithUrl:@"https://securejpake.firebaseio.com"];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signup:(id)sender {
    NSString *username=[self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password=[self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *email=[self.emailaddressField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([username length]==0 || [password length]==0  || [email length]==0)
    {
        

        NSString * errortitle=@" Signup  Error ";
        NSString *message=@"Oops make sure you enter valid username and password !!!";
        [self signupError:errortitle message:message];
        
    }
    
    else
        {
                       [self.ref createUser:email   password:password
            withValueCompletionBlock:^(NSError *error, NSDictionary *result) {
       
                
                if (error)
                {
           
                    NSLog(@"Error %@",error);
                    [self signupError:@"Error in signing up with firebase" message:@"try again"];
                }
       
                else
                {
           //  Login the New User with authUser
                    
                    NSLog(@"user createed successfully .now trying to logggin that user in ");

                    [self.ref authUser:email password:password
              withCompletionBlock:^(NSError *error, FAuthData *authData) {
                  if (error)
                  {
                      NSLog(@"Error logging in %@",error);
                  }
                  else {
                      NSDictionary *newUser = @{
                                                @"provider": authData.provider,
                                                @"username": username,
                                                @"email": email
                                                };
                      NSLog(@"users dictionary %@" ,newUser);
                      [[[self.ref childByAppendingPath:@"users"]
                        childByAppendingPath:authData.uid] updateChildValues:newUser];
                  [[DataBasics dataBasicsInstance] loginUserWithData:authData];
                      [[NSUserDefaults standardUserDefaults] setValue:authData.uid forKey:@"uid"];
                      
                  }
              }];

           NSString *uid = [result objectForKey:@"uid"];
           NSLog(@"Successfully created user account with uid: %@", uid);
                    
          // [self.navigationController popToRootViewControllerAnimated:YES];
                    InboxTableViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"Inbox"];
                    
                    [self presentViewController:vc animated:YES completion:nil];
                    
                    
            //[self performSegueWithIdentifier:@"NewUserLoggedIn" sender:self];
                    

       }
   }];
           
           
}
    
}

-(void)signupError:(NSString* )title  message:(NSString*) message
{
         
             UIAlertController *alert= [UIAlertController
                                        alertControllerWithTitle:title
                                        message:message
                                        preferredStyle:UIAlertControllerStyleAlert];
             
             UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                        handler:nil];
             UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel
                                                            handler:nil];
             
             [alert addAction:ok];
             [alert addAction:cancel];
             [self presentViewController:alert animated:YES completion:nil];
    
    
    
    
}

@end
