//
//  NSFileManager+UtilityPaths.m
//  PathTest
//
//  Created by TechPaa on 28/06/12.
//  Copyright (c) 2012 TechPaa http://techpaa.com/ All rights reserved.
//
/*
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */


#import "NSFileManager+UtilityPaths.h"

@implementation NSFileManager (UtilityPaths)

- (NSString *)documentDirectoryPath
{
    @synchronized ([NSFileManager class])
    {
     NSString *path = nil;
    if (!path)
        {
            //user documents folder
        path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        [path copy];
        }
    return path;
    }
}

- (NSString *)applicationSupportDirectory
{
    @synchronized ([NSFileManager class])
    {
    static NSString *path = nil;
            //application support folder
    if (!path) {
        
        path = [NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) lastObject];
                
            //create the folder if it doesn't exist
        if (![self fileExistsAtPath:path isDirectory:NULL])
            {
               BOOL created = [self createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:NULL];
                if (!created){
                    path = nil;
                    return path;
                }
        }
        [path copy];
        }
    return path;
}
}

- (NSString *)cacheDirectoryPath
{
    @synchronized ([NSFileManager class])
    {
    static NSString *path = nil;
    if (!path)
        {
            //cache folder
        path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        
            //create the folder if it doesn't exist
        if (![self fileExistsAtPath:path isDirectory:NULL])
            {
            [self createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:NULL];
            }
        
            //copy path
        [path copy] ;
        }
    return path;
    }
}

- (NSString *)temporaryDirectoryPath
{
    static NSString *path = nil;
    if (!path)
        {
            path = NSTemporaryDirectory();
                //copy path
            [path copy];
        }
    return path;
}

- (NSString *)resourcePath
{
    static NSString *path = nil;
    if (!path)
        {
            //bundle path
        path = [[[NSBundle mainBundle] resourcePath]copy];
        }
    return path;
}

- (NSString *)pathForDocumentDirectoryFile:(NSString *)file
{
	return [[self documentDirectoryPath] stringByAppendingPathComponent:file];
}

- (NSString *)pathForapplicationSupportFile:(NSString *)file
{
    return [[self applicationSupportDirectory] stringByAppendingPathComponent:file];
}

- (NSString *)pathForTemporaryFile:(NSString *)file
{
    return [[self temporaryDirectoryPath] stringByAppendingPathComponent:file];
}

- (NSString *)pathForResource:(NSString *)file
{
    return [[self resourcePath] stringByAppendingPathComponent:file];
}

- (NSString *)pathForCacheFile:(NSString *)file
{
    return [[self cacheDirectoryPath] stringByAppendingPathComponent:file];
}

#pragma mark -
#pragma mark file type Methods -

- (NSString *)pathForDocumentDirectoryFile:(NSString *)file ofType:(NSString*)fileType
{
    return [[[self documentDirectoryPath] stringByAppendingPathComponent:file] stringByAppendingPathExtension:fileType];
}

- (NSString *)pathForapplicationSupportFile:(NSString *)file ofType:(NSString*)fileType
{
    return [[[self applicationSupportDirectory] stringByAppendingPathComponent:file] stringByAppendingPathExtension:fileType];
}

- (NSString *)pathForTemporaryFile:(NSString *)file ofType:(NSString*)fileType
{
    return [[[self temporaryDirectoryPath] stringByAppendingPathComponent:file] stringByAppendingPathExtension:fileType];
}

- (NSString *)pathForResource:(NSString *)file ofType:(NSString*)fileType
{
    return [[[self resourcePath] stringByAppendingPathComponent:file] stringByAppendingPathExtension:fileType];
}
- (NSString *)pathForCacheFile:(NSString *)file ofType:(NSString*)fileType
{
    return [[[self cacheDirectoryPath] stringByAppendingPathComponent:file] stringByAppendingPathExtension:fileType];
}

@end
