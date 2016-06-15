//
//  TopChannelContainerView.m
//  新闻APP
//
//  Created by 胡锦吾 on 16/6/12.
//  Copyright © 2016年 YQL. All rights reserved.
//

#import "TopChannelContainerView.h"
#define kTitleLabelNormalFont  15
#define kTitleLabelSelectedFont  18
#define kAddChannelWidth  30.0
#define kSliderViewWidth 20

@interface TopChannelContainerView()
@property (nonatomic,strong) UIView *indicatorView;
@property (nonatomic,strong) UIButton *currentSelectedChannelButton;

@end

@implementation TopChannelContainerView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initialization];
    }
    return self;
}
-(void)setChannelNameArray:(NSArray *)channelNameArray{
    _channelNameArray = channelNameArray;
    CGFloat buttonWidth = self.scrollView.frame.size.width/5;
    self.scrollView.contentSize = CGSizeMake(buttonWidth * channelNameArray.count, 0);
//    NSLog(@"%@",NSStringFromCGSize(self.scrollView.contentSize));
    for (int i = 0; i<channelNameArray.count; i++) {
        UIButton *button = [self createChannelButton];
        button.frame = CGRectMake(i*buttonWidth, 0, buttonWidth, self.frame.size.height);
        [button setTitle:channelNameArray[i] forState:UIControlStateNormal];
        [self.scrollView addSubview:button];
//        NSLog(@"%f,%f,%f,%f",button.frame.origin.x,button.frame.origin.y,button.frame.size.width,button.frame.size.height);
    }
//默认选中第三个channelButton，第三个对应scrollVeiw的subView的index是3
    
   
}

-(void)initialization{
    self.alpha = 0.9;
//    初始化UIScrollView
    UIScrollView *scrollView = [self createScrollView];
    self.scrollView = scrollView;
//    self.scrollView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.scrollView];
    
    //初始化scrollview右侧的显示阴影效果的imageView;
    [self addSubview:[self createSliderView]];
    
    //初始化选中channelButton的红线，indicatorView
    UIView *indicatorView = [self createIndicatorView];
    self.indicatorView = indicatorView;
    [self.scrollView addSubview:self.indicatorView];
    
    //初始化右侧的+btn
    UIButton *button = [self createAddButton];
    self.addButton = button;
    [self addSubview:self.addButton];
    
}

//创建ScrollView
-(UIScrollView *)createScrollView{
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    self.scrollView = scrollView;
    _scrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - kAddChannelWidth, self.frame.size.height);
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    return _scrollView;
}
//初始化右侧的阴影
-(UIView *)createSliderView{
    UIImageView *sliderView = [[UIImageView alloc]init];
    sliderView.frame = CGRectMake(self.frame.size.width - kAddChannelWidth - kSliderViewWidth, 0, kSliderViewWidth, self.frame.size.height);
    sliderView.alpha = 0.9;
    sliderView.image = [UIImage imageNamed:@"slidetab_mask"];
    return sliderView;
}
//添加+号按钮
-(UIButton *)createAddButton{
    UIButton *addChannelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.addButton = addChannelBtn;
    [addChannelBtn setImage:[UIImage imageNamed:@"home_header_add_slim"] forState:UIControlStateNormal];
    addChannelBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - kAddChannelWidth, 0, kAddChannelWidth, kAddChannelWidth);
    [addChannelBtn addTarget:self action:@selector(AddDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    return addChannelBtn;
}

-(void)AddDidClicked:(UIButton *)btn{
#warning 点击按钮事件未实现

}
//初始化btton下面的红线
-(UIView *)createIndicatorView{
    UIView *indicatorView = [[UIView alloc]init];
    indicatorView.backgroundColor = [UIColor colorWithRed:243/255.0 green:75/255.0 blue:80/255.0 alpha:1.0];
    [self addSubview:indicatorView];
    return indicatorView;
}



-(UIButton *)createChannelButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:243/255.0 green:75/255.0 blue:80/255.0 alpha:1.0] forState:UIControlStateDisabled];
    [button.titleLabel setFont:[UIFont systemFontOfSize:kTitleLabelNormalFont]];
    [button addTarget:self action:@selector(ChannelButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button layoutIfNeeded];
    return button;
    
}

-(void)ChannelButtonDidClicked:(UIButton *)sender{
    self.currentSelectedChannelButton.titleLabel.font = [UIFont systemFontOfSize:kTitleLabelNormalFont];
    self.currentSelectedChannelButton.enabled = YES;
    self.currentSelectedChannelButton = sender;
    self.currentSelectedChannelButton.enabled = NO;
    CGFloat offsetX = sender.center.x - [UIScreen mainScreen].bounds.size.width*0.5;
    if (offsetX<0) {
        offsetX = 0;
    }
    if (offsetX>self.scrollView.contentSize.width - self.scrollView.frame.size.width) {
        offsetX = self.scrollView.contentSize.width - self.scrollView.frame.size.width;
    }
    [UIView animateWithDuration:0.25 animations:^{
        [sender layoutIfNeeded];
        [sender.titleLabel setFont:[UIFont systemFontOfSize:kTitleLabelSelectedFont]];
        [self.scrollView setContentOffset:CGPointMake(offsetX, 0)];
        //indicatorView宽度比titlelalel宽20,ceterx与titilelabel相同
        self.indicatorView.frame = CGRectMake(sender.frame.origin.x+sender.titleLabel.frame.origin.x - 10, self.frame.size.height-2, sender.titleLabel.frame.size.width+20, 2);
    }];
    //因为subView包含indicatorVeiw，所以index减一
    NSInteger index = [self.scrollView.subviews indexOfObject:sender]-1;
    if ([self.delegate respondsToSelector:@selector(chooseChannelWithIndex:)]) {
        [self.delegate chooseChannelWithIndex:index];
    }
}


@end

















