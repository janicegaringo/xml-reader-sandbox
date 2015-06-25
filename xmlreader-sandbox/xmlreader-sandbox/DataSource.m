//
//  DataSource.m
//  xmlreader-sandbox
//
//  Created by Janice Taylor on 6/25/15.
//  Copyright (c) 2015 Janice Taylor. All rights reserved.
//

#import "DataSource.h"
#import "XMLDictionary.h"

@implementation DataSource

#pragma mark - Initialization

+ (instancetype)masterDataSource;
{
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    
    return instance;
}


- (NSDictionary *)loadXMLWithUrl:(NSURL *)url
{
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
    
    if(error) {
        NSLog(@"error : %@", error.localizedDescription);
        return nil;
    }
    
    XMLDictionaryParser *parser = [XMLDictionaryParser new];
    NSDictionary *dictionary = [parser dictionaryWithData:data];
    return dictionary; 
}

@end
