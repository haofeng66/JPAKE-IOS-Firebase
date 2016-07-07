//
//  jpakeKey.m
//  iosJpakeApp
//
//  Created by Renu Srijith on 01/01/2016.
//  Copyright © 2016 newcastle university. All rights reserved.
//

#import "jpakeKey.h"

@implementation jpakeKey

- (id)initWithkeyingMaterial:(BigInteger*)key


{
    if( self = [super init] )
    {
        self.keyingMaterial=key;
        
        
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.keyingMaterial forKey:@"keyingMaterial"];
   
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if(self!=nil)
    {
        self.keyingMaterial  = [coder decodeObjectForKey:@"keyingMaterial"];
        
        
        
    }
    return self;
}

-(BigInteger*)getKeyingMaterial
{
    return [self keyingMaterial];
    
}

@end
