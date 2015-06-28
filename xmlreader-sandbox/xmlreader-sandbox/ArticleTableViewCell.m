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
}


- (void)awakeFromNib
{
    self.articleImageView.autoresizesSubviews = NO;
    self.articleImageView.clipsToBounds = YES;
    self.articleImageView.contentMode = UIViewContentModeScaleAspectFill;

}


- (void)prepareForReuse
{
    self.articleImageView.autoresizesSubviews = NO;
    self.articleImageView.clipsToBounds = YES;
    self.articleImageView.contentMode = UIViewContentModeScaleAspectFill;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
