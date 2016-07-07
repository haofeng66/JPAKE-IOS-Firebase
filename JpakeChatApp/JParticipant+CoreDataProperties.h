//
//  JParticipant+CoreDataProperties.h
//  JChatApp
//
//  Created by Renu Srijith on 02/01/2016.
//  Copyright © 2016 newcastle university. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "JParticipant.h"

NS_ASSUME_NONNULL_BEGIN

@interface JParticipant (CoreDataProperties)

@property (nullable, nonatomic, retain) NSData *data;
@property (nullable, nonatomic, retain) NSString *myName;
@property (nullable, nonatomic, retain) NSString *toName;

@end

NS_ASSUME_NONNULL_END
