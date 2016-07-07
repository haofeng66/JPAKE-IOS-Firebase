//
//  JpakeRound2Payload.m
//  coolhash
//
//  Created by Renu Srijith on 01/07/2015.
//  Copyright (c) 2015 newcastle university. All rights reserved.
//

#import "JpakeRound2Payload.h"

@implementation JpakeRound2Payload

- (id)initWithParticipantId:(NSString *)ParticipantId
                        a:(BigInteger*)a
                        Zkpx2s:(NSArray*)zkpx2s
                    Zkpx2s0:(BigInteger*)zkpx2s0
                    Zkpx2s1:(BigInteger*)zkpx2s1


    {
    if( self = [super init] )
    {
        //check for object not null //
        self.participantId=ParticipantId;
        self.a=a;
        self.ZkpArrayX2s =zkpx2s;
        self.ZkpX2s0=zkpx2s0;
        self.ZkpX2s1=zkpx2s1;
        
    }
    
    return self;
   
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.participantId forKey:@"participantId"];
    [coder encodeObject:self.a         forKey:@"a"];
    
    
    [coder encodeObject:self.ZkpX2s0 forKey:@"ZkpX2s0"];
    [coder encodeObject:self.ZkpX2s1 forKey:@"ZkpX2s1"];
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if(self!=nil)
    {
        self.participantId  = [coder decodeObjectForKey:@"participantId"];
        self.a    = [coder decodeObjectForKey:@"a"];
       
        self.ZkpX2s0=[coder decodeObjectForKey:@"ZkpX2s0"];
        self.ZkpX2s1=[coder decodeObjectForKey:@"ZkpX2s1"];
        
        
    }
    return self;
}


-(NSString*)getParticipantID
{
    return  [self participantId];
}
-(BigInteger*)geta
{
    return [self a];
}

-(NSArray*)getZkpX2s
{
    return [self ZkpArrayX2s];
}
-(BigInteger*)getZkpX2s0
{

    return[self ZkpX2s0];
}
-(BigInteger*)getZkpX2s1
{
    
    return[self ZkpX2s1];
}


@end
