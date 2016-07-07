//
//  jpakeKey.h
//  iosJpakeApp
//
//  Created by Renu Srijith on 01/01/2016.
//  Copyright © 2016 newcastle university. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BigInteger.h"

@interface jpakeKey : NSObject<NSCoding>
{}

@property(nonatomic,strong)BigInteger *keyingMaterial;
- (id)initWithkeyingMaterial:(BigInteger*)key;
-(BigInteger*)getKeyingMaterial;
@end
