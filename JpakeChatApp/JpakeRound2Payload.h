//
//  JpakeRound2Payload.h
//  coolhash
//
//  Created by Renu Srijith on 01/07/2015.
//  Copyright (c) 2015 newcastle university. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BigInteger.h"
@interface JpakeRound2Payload : NSObject<NSCoding>
{
}

@property(nonatomic,strong)NSString* participantId;

@property(nonatomic,strong)BigInteger* a;
@property(nonatomic,strong) NSArray* ZkpArrayX2s;

@property(nonatomic,strong)BigInteger* ZkpX2s0;
@property(nonatomic,strong)BigInteger* ZkpX2s1;


- (id)initWithParticipantId:(NSString *)ParticipantId  a:(BigInteger*)a
                     Zkpx2s:(NSArray*)zkpx2s
                    Zkpx2s0:(BigInteger*)zkpx2s0
                    Zkpx2s1:(BigInteger*)zkpx2s1;

-(NSString*)getParticipantID;

-(BigInteger*)geta;
-(BigInteger*)getZkpX2s0;
-(BigInteger*)getZkpX2s1;
-(NSArray*)getZkpX2s;

@end
