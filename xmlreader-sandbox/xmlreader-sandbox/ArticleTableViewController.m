//
//  ArticleTableViewController.m
//  xmlreader-sandbox
//
//  Created by Janice Taylor on 6/25/15.
//  Copyright (c) 2015 Janice Taylor. All rights reserved.
//

#import "ArticleTableViewController.h"
#import "ArticleTableViewCell.h"
#import "DataSource.h"
#import "Article.h" 
#import "DetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

static NSString *xmlUrl = @"http://www.cbc.ca/cmlink/rss-topstories";

@interface ArticleTableViewController ()

@property (nonatomic) NSMutableArray *articles;

@end

@implementation ArticleTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.articles = [@[] mutableCopy];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;    
   
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self createArticles];
    
}


- (void)createArticles
{
    DataSource *datasource = [DataSource masterDataSource];
    
    NSURL *url = [NSURL URLWithString:xmlUrl];
    NSDictionary *xmlDictionary = [datasource loadXMLWithUrl:url];
    
    NSDictionary *channelDictionary = xmlDictionary[@"channel"];
    
    NSArray *titles = [channelDictionary valueForKeyPath:@"item.title"];
    NSArray *links = [channelDictionary valueForKeyPath:@"item.link"];
    NSArray *pubdates = [channelDictionary valueForKeyPath:@"item.pubDate"];
    NSArray *authors = [channelDictionary valueForKeyPath:@"item.author"];
    NSArray *descriptions = [channelDictionary valueForKeyPath:@"item.description"];

    for(int i=0; i<titles.count; i++) {
        
        Article *article = [Article new];
        
        article.title = (titles[i] != (id)[NSNull null]) ? titles[i] : @"";
        article.pubDate = (pubdates[i] != (id)[NSNull null]) ? pubdates[i] : @"";
        article.author = (authors[i] != (id)[NSNull null]) ? authors[i] : @"";
        article.articleUrl = (links[i] != (id)[NSNull null]) ? links[i] : @"";

        NSString *str = descriptions[i];
        NSArray *output = [str componentsSeparatedByString:@"src='"];
        NSArray *output2 = [output[1] componentsSeparatedByString:@"' />"];
        article.imageURL = output2[0];
        
        [self.articles addObject:article];
    }
    
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85.0;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.articles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    static NSString *cellIdentifier = @"Cell";
    
    ArticleTableViewCell *cell = (ArticleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    
    Article *article = self.articles[indexPath.row];
    cell.titleLabel.text = article.title;
    cell.pubDateLabel.text = article.pubDate;
    cell.authorLabel.text = article.author;
    cell.detailUrl = article.articleUrl;
    
    [cell.articleImageView sd_setImageWithURL:[NSURL URLWithString:article.imageURL]
                      placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    return cell;
}


- (UIImage *)getImageFromURL:(NSString *)fileURL
{
    UIImage *result;
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    return result;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleTableViewCell *cell = (ArticleTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    NSString *cellUrl = cell.detailUrl;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    DetailViewController *detailViewController = (DetailViewController*)[storyboard instantiateViewControllerWithIdentifier:@"detailViewController"];
    
    detailViewController.detailViewUrl = cellUrl;
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
}

@end
