//
//  DetailViewController.m
//  xmlreader-sandbox
//
//  Created by Janice Taylor on 6/28/15.
//  Copyright (c) 2015 Janice Taylor. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if(self.detailViewUrl) {
        NSURL *url = [NSURL URLWithString:self.detailViewUrl];
        NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObject];
    }

}

@end
