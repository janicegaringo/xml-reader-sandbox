//
//  Article.h
//  xmlreader-sandbox
//
//  Created by Janice Taylor on 6/25/15.
//  Copyright (c) 2015 Janice Taylor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property (nonatomic) NSString *imageURL;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *pubDate;
@property (nonatomic) NSString *author;
@property (nonatomic) NSURL *articleUrl;

@end
