//
//  DataSource.h
//  xmlreader-sandbox
//
//  Created by Janice Taylor on 6/25/15.
//  Copyright (c) 2015 Janice Taylor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSource : NSObject

+ (instancetype)masterDataSource;

- (void)loadXMLWithUrl:(NSURL *)url;

@end
