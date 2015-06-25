//
//  ViewController.m
//  xmlreader-sandbox
//
//  Created by Janice Taylor on 6/25/15.
//  Copyright (c) 2015 Janice Taylor. All rights reserved.
//

#import "ViewController.h"
#import "DataSource.h" 

static NSString *xmlUrl = @"http://www.cbc.ca/cmlink/rss-topstories";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    DataSource *datasource = [DataSource masterDataSource];
    
    NSURL *url = [NSURL URLWithString:xmlUrl];
    [datasource loadXMLWithUrl:url];
    
    
}


@end
