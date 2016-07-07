//
//  JpakeRound3Payload.m
//  Jpake
//
//  Created by Renu Srijith on 08/07/2015.
//  Copyright (c) 2015 newcastle university. All rights reserved.
//

#import "JpakeRound3Payload.h"

@implementation JpakeRound3Payload
- (id)initWithParticipantId:(NSString *)ParticipantId  macTag:(BigInteger*)macTag;

{
    if( self = [super init] )
    {
        //check for object not null //
        self.participantId=ParticipantId;
        self.macTag =macTag;
        }

    return self;

}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.participantId forKey:@"participantId"];
    [coder encodeObject:self.macTag             forKey:@"macTag"];
    
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if(self!=nil)
    {
        self.participantId  = [coder decodeObjectForKey:@"participantId"];
        self.macTag    = [coder decodeObjectForKey:@"macTag"];
        
               
        
        
    }
    
    return self;
}



-(NSString*)getParticipantID
{
    return  [self participantId];
}
-(BigInteger*)getMactag
{
    return [self macTag];
}


@end
