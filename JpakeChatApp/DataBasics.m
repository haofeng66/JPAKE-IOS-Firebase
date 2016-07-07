//
//  DataBasics.m
//  Jpake
//
//  Created by Renu Srijith on 20/04/2016.
//  Copyright © 2016 newcastle university. All rights reserved.
//

#import "DataBasics.h"


@implementation DataBasics
-(id)init
{
    //self=[super init];
   // if(self){
    if (self = [super init]) {
        self.ref=[[Firebase alloc]initWithUrl:@"https://securejpake.firebaseio.com"];}
              
    return self;
}
+(DataBasics*)dataBasicsInstance{
    static DataBasics* myDatabasics=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        myDatabasics = [[self alloc] init];
    });
    return myDatabasics;

}

-(void)loginUserWithData:(FAuthData*) authData

{
    NSLog(@"authdata in daTA basics %@",authData);
    self.currentUser= [[User alloc]initwithData:authData.providerData[@"email"] id:authData.uid];
   
//    NSLog(@"from databaseics current user email %@ current user id %@",self.currentUser.userEmail,self.currentUser.uId);

}

-(Firebase*)getUsersRef
{
return [self.ref childByAppendingPath:@"users"];
}



-(Firebase*)pathToConversation:(NSString*)convId
{
    return [[self.ref childByAppendingPath:@"conversations"]childByAppendingPath:convId];
}




-(Firebase*)pathToUserConversation:(NSString*)user  otherUserID:(NSString*)otherUserId
{
    return [[[[self.ref childByAppendingPath:@"users"]childByAppendingPath:user]childByAppendingPath:@"conversations"]childByAppendingPath:otherUserId];

}

//
-(Firebase*)getConversationsRef{
    return [self.ref childByAppendingPath:@"conversations"];
}


-(Firebase*)getMyUserConversation:(NSString*)uid
{
    return [[[self.ref childByAppendingPath:@"users" ]childByAppendingPath:uid]childByAppendingPath:@"conversations"];
    
}



//-(Firebase*)pathToConversation:(NSString*)convId
//{
//    return [[self.ref childByAppendingPath:@"conversations"]childByAppendingPath:convId];
//}


-(Firebase*)pathToFriends:(NSString*)chatId
{
    return [[self.ref childByAppendingPath:@"friends"]childByAppendingPath:chatId];
    
}
-(Firebase*)pathToKeys:(NSString*)chatId
{
    return [[self.ref childByAppendingPath:@"keys"]childByAppendingPath:chatId];
    
}






-(Firebase*)getKeysRef{
    return [self.ref childByAppendingPath:@"keys"];
}

-(Firebase*)getFriendsRef{
    return [self.ref childByAppendingPath:@"friends"];
    
}
-(Firebase*)getConnectionsRef:(NSString*)userId
{
    return [[[self.ref childByAppendingPath:@"users"]childByAppendingPath:userId] childByAppendingPath:@"connections"];
}
-(void)sendMessage:(JSQMessage*) msg convID:(NSString*)convId macTag:(NSString*)mtag  iv:(NSString*)iv{
    
    
    
    //    let messagesRef = ref.childByAppendingPath("conversations/\(toChat)")
    Firebase *msgRef= [[self.ref childByAppendingPath:@"conversations"]childByAppendingPath:convId];
    NSDictionary *newUser = @{
                              @"text": msg.text,
                              @"sender": msg.senderId,
                              @"displayName": msg.senderDisplayName,
                              @"macTag":mtag,
                              @"iv":iv
                              };
    [[msgRef childByAutoId]setValue:newUser];
    
    
}


@end
