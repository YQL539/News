//
//  NewsViewController.m
//  新闻APP
//
//  Created by 胡锦吾 on 16/6/9.
//  Copyright © 2016年 YQL. All rights reserved.
//

#import "NewsViewController.h"
#import "TopChannelContainerView.h"
#import "ContentTableViewController.h"
@interface NewsViewController ()
@property (nonatomic,strong)NSMutableArray *currentChannelArray;
@property (nonatomic,strong)TopChannelContainerView *topChannelContainerView;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupTopContainerView];
    
}


-(void)setupTopContainerView{
    CGFloat top = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    TopChannelContainerView *topContainView = [[TopChannelContainerView alloc]initWithFrame:CGRectMake(0, top, [UIScreen mainScreen].bounds.size.width, 30)];
    topContainView.channelNameArray = self.currentChannelArray;
    self.topChannelContainerView = topContainView;
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:topContainView];
}

-(NSMutableArray *)currentChannelArray{
    if (_currentChannelArray==nil) {
        _currentChannelArray = [NSMutableArray array];
        NSArray *array = [[NSUserDefaults standardUserDefaults]objectForKey:@"currentChannelsArray"];
        [_currentChannelArray addObjectsFromArray:array];
        if (_currentChannelArray.count ==0) {
            [_currentChannelArray addObjectsFromArray:@[@"国内", @"国际", @"娱乐", @"互联网", @"体育", @"财经", @"科技", @"汽车"]];
            [self updateCurrentChannelsDefaults];
        }
    }
    return _currentChannelArray;
}

-(void)updateCurrentChannelsDefaults{
    [[NSUserDefaults standardUserDefaults]setObject:self.currentChannelArray forKey:@"currentChannelsArray"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

-(void)setupChildController{
    for (int i ; i<self.currentChannelArray.count; i++) {
        ContentTableViewController *contentController = [[ContentTableViewController alloc]init];
        contentController.channelName = self.currentChannelArray[i];
        contentController.channelID = 
    }
}

@end
