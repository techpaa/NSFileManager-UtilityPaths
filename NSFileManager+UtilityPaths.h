//
//  NSFileManager+UtilityPaths.h
//
//  Created by TechPaa on 28/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (TPUtilityPaths)

- (NSString *)documentDirectoryPath;
- (NSString *)applicationSupportDirectory;
- (NSString *)cacheDirectoryPath;
- (NSString *)temporaryDirectoryPath;
- (NSString *)resourcePath;

- (NSString *)pathForDocumentDirectoryFile:(NSString *)file;
- (NSString *)pathForapplicationSupportFile:(NSString *)file;
- (NSString *)pathForTemporaryFile:(NSString *)file;
- (NSString *)pathForResource:(NSString *)file;
- (NSString *)pathForCacheFile:(NSString *)file;


- (NSString *)pathForDocumentDirectoryFile:(NSString *)file ofType:(NSString*)fileType;

- (NSString *)pathForapplicationSupportFile:(NSString *)file ofType:(NSString*)fileType;

- (NSString *)pathForTemporaryFile:(NSString *)file ofType:(NSString*)fileType;

- (NSString *)pathForResource:(NSString *)file ofType:(NSString*)fileType;

- (NSString *)pathForCacheFile:(NSString *)file ofType:(NSString*)fileType;

@end
