//
//  ContentTableViewController.h
//  新闻APP
//
//  Created by 胡锦吾 on 16/6/13.
//  Copyright © 2016年 YQL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NormalNewsModel.h"
@interface ContentTableViewController : UITableViewController
@property (nonatomic,strong)NormalNewsModel *news;
@property (nonatomic,copy) NSString *channelID;
@property (nonatomic,copy)NSString *channelName;
@end
