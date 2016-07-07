//
//  LoginViewController.m
//  Jpake
//
//  Created by Renu Srijith on 15/04/2016.
//  Copyright © 2016 newcastle university. All rights reserved.
//

#import "LoginViewController.h"
#import <Firebase.h>
#import "DataBasics.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton =YES;
    //Firebase *ref = [[Firebase alloc] initWithUrl:@"https://radiant-inferno-8210.firebaseio.com"];
    
    Firebase *ref = [[Firebase alloc] initWithUrl:@"https://securejpake.firebaseio.com"];
    

    
    
    [ref observeAuthEventWithBlock:^(FAuthData *authData) {
        if (authData) {
            // user authenticated
           NSLog(@"inside loginVC moving to inbox");
            [self performSegueWithIdentifier:@"showConversations" sender:self];
            
        } else {
            // No user is signed in
            NSLog(@"inside login vC  no user signed in ");
        }
    }];
    

    
        
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
- (IBAction)login:(id)sender {
    
    NSString *email=[self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password=[self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    if([email length]==0 || [password length]==0  )
    {
        
        [self loginError:@"Login Error !! " message:@"Make sure you enter a valid username and password !! "];
//        
        
    }
    
    else
    {
        
        //DataBasics *mydat=[DataBasics dataBasicsInstance];
        [[DataBasics dataBasicsInstance].ref authUser:email password:password
        withCompletionBlock:^(NSError *error, FAuthData *authData) {
      if (error)
            {
                NSLog(@"Error logging in %@",error);
                NSString *Err=error.description;
                [self loginError:@"Login Error " message:Err];
            }
      else {
          
          [[DataBasics dataBasicsInstance] loginUserWithData:authData];
           [[NSUserDefaults standardUserDefaults] setValue:authData.uid forKey:@"uid"];
           [self.navigationController popToRootViewControllerAnimated:YES];
          [self performSegueWithIdentifier:@"showConversations" sender:self];

            }
        }];

//            {
//                [self.navigationController popToRootViewControllerAnimated:YES];
//            }
    
        

        
        
        
    }
    
}
-(void)loginError:(NSString* )title  message:(NSString*) message
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
