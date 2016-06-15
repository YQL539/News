//
//  NormalNewsModel.h
//  新闻APP
//
//  Created by 胡锦吾 on 16/6/13.
//  Copyright © 2016年 YQL. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum{
    kNormalNewsTypeNoPicture = 1,
    kNormalNewsTypeSinglePicture,
    kNormalNewsTypeMutiPicture,
}kNormalNewsType;

@interface NormalNewsModel : NSObject
@property (nonatomic, copy) NSString *channelId;
@property (nonatomic, copy) NSString *desc;//简介
@property (nonatomic, strong) NSArray *imageurls;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, copy) NSString *pubDate;//发布日期
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger allPages;


//自定义的变量
@property (nonatomic,assign)kNormalNewsType nomalNewsType;
@property (nonatomic,assign)NSInteger createdtime;
@property (nonatomic,assign)CGFloat cellHeight;
@end
