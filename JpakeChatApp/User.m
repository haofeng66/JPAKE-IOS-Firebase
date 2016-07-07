//
//  User.m
//  Jpake
//
//  Created by Renu Srijith on 22/04/2016.
//  Copyright © 2016 newcastle university. All rights reserved.
//

#import "User.h"

@implementation User
-(id)initwithData:(NSString*)email id:(NSString*)ID
{
    
    
   // self = [super init];
    if (self ) {

  //  self.userName=name;
    self.userEmail=email;
    self.uId    =ID;
       
    
    
    }
    
    return self;
    
    

}




@end
