//
//  theCoreDataStack.h
//  JChatApp
//
//  Created by Renu Srijith on 02/01/2016.
//  Copyright © 2016 newcastle university. All rights reserved.
//
#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>

//this class generates a singleton instance of Coredata 

@interface theCoreDataStack : NSObject
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;



+(instancetype)defaultStack;
@end
