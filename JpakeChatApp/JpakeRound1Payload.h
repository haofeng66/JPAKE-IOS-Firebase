//
//  JpakeRound1Payload.h
//  coolhash
//
//  Created by Renu Srijith on 01/07/2015.
//  Copyright (c) 2015 newcastle university. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BigInteger.h"


@interface JpakeRound1Payload : NSObject<NSCoding>
{

}

//participant who created this payload
@property(nonatomic,strong)NSString* participantId;
//value of g^x1
@property(nonatomic,strong)BigInteger* gx1;
//value of g^x2
@property(nonatomic,strong)BigInteger* gx2;
//
@property(nonatomic,strong) NSArray* ZkpArrayX1;

@property(nonatomic,strong) NSArray* ZkpArrayX2;
@property(nonatomic,strong)BigInteger* ZkpX10;
@property(nonatomic,strong)BigInteger* ZkpX11;
@property(nonatomic,strong)BigInteger* ZkpX20;
@property(nonatomic,strong)BigInteger* ZkpX21;




- (id)initWithParticipantId:(NSString *)ParticipantId
                        gX1:(BigInteger*)gx1
                        gX2:(BigInteger*)gx2
                      ZkpX1:(NSArray*)zkpX1
                      ZkpX2:(NSArray*)zkpX2
                    ZkpX10:(BigInteger*)ZkpX10
                    ZkpX11:(BigInteger*)ZkpX11
                    ZkpX20:(BigInteger*)ZkpX20
                    ZkpX21:(BigInteger*)ZkpX21
;


-(NSString*)getParticipantID;
-(BigInteger*)getGx1;
-(BigInteger*)getGx2;
-(NSArray*)getZkpArrayX1;
-(NSArray*)getZkpArrayX2;

-(BigInteger*)getZkpX10;
-(BigInteger*)getZkpX11;
-(BigInteger*)getZkpX20;
-(BigInteger*)getZkpX21;

@end