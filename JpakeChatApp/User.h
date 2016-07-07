//
//  User.h
//  Jpake
//
//  Created by Renu Srijith on 22/04/2016.
//  Copyright © 2016 newcastle university. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
//@property(nonatomic,strong) NSString* userName;
@property(nonatomic,strong) NSString* userEmail;
@property(nonatomic,strong) NSString* uId;

-(id)initwithData:(NSString*)email id:(NSString*)ID;

@end
