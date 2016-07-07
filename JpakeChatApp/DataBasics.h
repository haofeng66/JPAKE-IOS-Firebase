//
//  DataBasics.h
//  Jpake
//
//  Created by Renu Srijith on 20/04/2016.
//  Copyright © 2016 newcastle university. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Firebase.h>
#import "User.h"
#import <JSQMessages.h>

@interface DataBasics : NSObject{}

@property(nonatomic,strong) Firebase *ref;
@property(nonatomic,strong) User* currentUser;



+(DataBasics*)dataBasicsInstance;



-(void)loginUserWithData:(FAuthData*) authData;
-(Firebase*)getUsersRef;









-(Firebase*)getConversationsRef;
-(Firebase*)getKeysRef;
-(Firebase*)getFriendsRef;



-(Firebase*)pathToConversation:(NSString*)convId;
-(Firebase*)pathToFriends:(NSString*)chatId;

-(Firebase*)pathToKeys:(NSString*)chatId;

-(Firebase*)pathToUserConversation:(NSString*)user  otherUserID:(NSString*)otherUserId;

-(Firebase*)getConnectionsRef:(NSString*)userId;

-(Firebase*)getMyUserConversation:(NSString*)uid;


//-(void)sendMessage:(JSQMessage*) msg convID:(NSString*)convId;
-(void)sendMessage:(JSQMessage*) msg convID:(NSString*)convId macTag:(NSString*)mtag  iv:(NSString*)iv;





@end
