//
//  NSData+AES256.h
//  JpakeChatApp
//
//  Created by Renu Srijith on 03/06/2016.
//  Copyright © 2016 newcastle university. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES256)
//- (NSData *)AES256EncryptWithKey:(NSString *)key;
- (NSData *)AES256EncryptWithKey:(NSString *)key  iv:(NSData ** )iv;
//- (NSData *)AES256DecryptWithKey:(NSString *)key;

 - (NSData *)AES256DecryptWithKey:(NSString *)key  iv:(NSData ** )iv; 
@end
