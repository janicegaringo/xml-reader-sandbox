//
//  ArticleTableViewCell.m
//  xmlreader-sandbox
//
//  Created by Janice Taylor on 6/25/15.
//  Copyright (c) 2015 Janice Taylor. All rights reserved.
//

#import "ArticleTableViewCell.h"

@interface ArticleTableViewCell ()



@end

@implementation ArticleTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)awakeFromNib
{
    self.imageView.autoresizesSubviews = NO;
    self.imageView.clipsToBounds = YES;
}


- (void)prepareForReuse
{
    self.imageView.autoresizesSubviews = NO;
    self.imageView.clipsToBounds = YES;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0,0,150.0,184.0);    
}

@end
