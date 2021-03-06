//
//  JpakeRound1Payload.m
//  coolhash
//
//  Created by Renu Srijith on 01/07/2015.
//  Copyright (c) 2015 newcastle university. All rights reserved.
//

#import "JpakeRound1Payload.h"

@implementation JpakeRound1Payload



- (id)initWithParticipantId:(NSString *)ParticipantId
                        gX1:(BigInteger*)gx1
                        gX2:(BigInteger*)gx2
                      ZkpX1:(NSArray*)zkpX1
                      ZkpX2:(NSArray*)zkpX2
                     ZkpX10:(BigInteger*)zkpX10
                     ZkpX11:(BigInteger*)zkpX11
                     ZkpX20:(BigInteger*)zkpX20
                     ZkpX21:(BigInteger*)zkpX21
{
    if( self = [super init] )
    {
//check for object not null //
        self.participantId=ParticipantId;
        self.gx1=gx1;
        self.gx2=gx2;
        self.ZkpArrayX1=zkpX1;
        self.ZkpArrayX2=zkpX2;
        self.ZkpX10=zkpX10;
        self.ZkpX11=zkpX11;
        self.ZkpX20=zkpX20;
        self.ZkpX21=zkpX21;
        
    }
    
    return self;



}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.participantId forKey:@"participantId"];
    [coder encodeObject:self.gx1         forKey:@"gx1"];
    [coder encodeObject:self.gx2         forKey:@"gx2"];

    [coder encodeObject:self.ZkpX10 forKey:@"ZkpX10"];
    [coder encodeObject:self.ZkpX11 forKey:@"ZkpX11"];
    [coder encodeObject:self.ZkpX20 forKey:@"ZkpX20"];
    [coder encodeObject:self.ZkpX21 forKey:@"ZkpX21"];


}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if(self!=nil)
    {
    self.participantId  = [coder decodeObjectForKey:@"participantId"];
    self.gx1    = [coder decodeObjectForKey:@"gx1"];
    self.gx2 = [coder decodeObjectForKey:@"gx2"];
        self.ZkpX10=[coder decodeObjectForKey:@"ZkpX10"];
        self.ZkpX11=[coder decodeObjectForKey:@"ZkpX11"];

        self.ZkpX20=[coder decodeObjectForKey:@"ZkpX20"];

        self.ZkpX21=[coder decodeObjectForKey:@"ZkpX21"];
        
}
    
    return self;
}




-(NSString*)getParticipantID
{
    return  [self participantId];
}
-(BigInteger*)getGx1
{
    return [self gx1];
}
-(BigInteger*)getGx2
{
    return [self gx2];
    
}
-(NSArray*)getZkpArrayX1
{
    return [self ZkpArrayX1];
}

-(NSArray*)getZkpArrayX2
{
    return [self ZkpArrayX2];
}
-(BigInteger*)getZkpX10
{
    return [self ZkpX10];
    
}
-(BigInteger*)getZkpX11
{
    return [self ZkpX11];
    
}
-(BigInteger*)getZkpX20
{
    return [self ZkpX20];
    
}

-(BigInteger*)getZkpX21
{
    return [self ZkpX21];
    
}


@end
