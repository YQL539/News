//
//  TopChannelContainerView.h
//  新闻APP
//
//  Created by 胡锦吾 on 16/6/12.
//  Copyright © 2016年 YQL. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TopChannelContainerViewDelegate<NSObject>
-(void)chooseChannelWithIndex:(NSInteger)index;

@end

@interface TopChannelContainerView : UIView
@property (nonatomic,strong)NSArray *channelNameArray;
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UIButton *addButton;
@property (nonatomic,weak)id<TopChannelContainerViewDelegate> delegate;
-(instancetype)initWithFrame:(CGRect)frame;



@end
