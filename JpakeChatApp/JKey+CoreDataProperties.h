//
//  JKey+CoreDataProperties.h
//  
//
//  Created by Renu Srijith on 31/05/2016.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "JKey.h"

NS_ASSUME_NONNULL_BEGIN

@interface JKey (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *myName;
@property (nullable, nonatomic, retain) NSString *toName;
@property (nullable, nonatomic, retain) NSString *key;

@end

NS_ASSUME_NONNULL_END
