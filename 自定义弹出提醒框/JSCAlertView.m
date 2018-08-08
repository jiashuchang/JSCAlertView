//
//  JSCAlertView.m
//  自定义弹出提醒框
//
//  Created by TianLi on 2018/8/7.
//  Copyright © 2018年 TianLi. All rights reserved.
//

#import "JSCAlertView.h"
#import "PureLayout.h"

//根据rgb取色
#define JyColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
//屏幕 rect
#define SCREEN_RECT ([UIScreen mainScreen].bounds)

@interface JSCAlertView(){
    UIView *_backgroundView;
    UIView *_hintView;
    UILabel *_titleLB;
    UIImageView *_imageview;
//    UILabel *_messageLB;
    UIButton *_button;
}
@end

@implementation JSCAlertView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpsubviews];
        [self initView];
    }
    return self;
}

- (void)setUpsubviews{
    
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3f];
    
    
    _hintView = [[UIView alloc] init];
    _hintView.backgroundColor = [UIColor whiteColor];
    _hintView.layer.cornerRadius = 10.0;
    _hintView.layer.masksToBounds = YES;
    [self addSubview:_hintView];

    
    _titleLB = [UILabel new];
    _titleLB.text = @"小精灵提示";
    _titleLB.textColor = JyColor(0, 151, 232, 1);
    _titleLB.textAlignment = NSTextAlignmentCenter;
    _titleLB.font = [UIFont systemFontOfSize:20];
    [_hintView addSubview:_titleLB];
    
    _imageview = [[UIImageView alloc] init];
    _imageview.image = [UIImage imageNamed:@"xiaojingling.png"];
    _imageview.contentMode=UIViewContentModeScaleAspectFit;
    [_hintView addSubview:_imageview];
    
    
    _messageLB = [UILabel new];
//    _messageLB.text =[NSString stringWithFormat:@"今天是姨妈期，记得多喝热水，注意保暖哦!"];
    _messageLB.numberOfLines = 2;
    _messageLB.font = [UIFont systemFontOfSize:16];
    _messageLB.textAlignment = NSTextAlignmentCenter;
    [_hintView addSubview:_messageLB];

    
    _button = [UIButton new];
    [_button setTitle:@"本宫知道了" forState:(UIControlStateNormal)];
    [_button setTitleColor:JyColor(0, 151, 232, 1) forState:(UIControlStateNormal)];
    _button.titleLabel.font = [UIFont systemFontOfSize:18];
    [_button addTarget:self action:@selector(updateFormAppStore:) forControlEvents:(UIControlEventTouchUpInside)];
    [_hintView addSubview:_button];

    
    
}
-(void)updateFormAppStore:(UIButton *)sender{
    [self removeFromSuperview];
    
}

- (void)initView{
    _hintView.translatesAutoresizingMaskIntoConstraints = NO;
    [_hintView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [_hintView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_hintView autoSetDimension:ALDimensionHeight toSize:270];
    [_hintView autoSetDimension:ALDimensionWidth toSize:270];
    
    _titleLB.translatesAutoresizingMaskIntoConstraints = NO;
    [_titleLB autoSetDimension:ALDimensionWidth toSize:270];
    [_titleLB autoSetDimension:ALDimensionHeight toSize:30];
    [_titleLB autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [_titleLB autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_hintView withOffset:10];
    
    _imageview.translatesAutoresizingMaskIntoConstraints = NO;
    [_imageview autoSetDimension:ALDimensionWidth toSize:100];
    [_imageview autoSetDimension:ALDimensionHeight toSize:100];
    [_imageview autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [_imageview autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLB withOffset:10];
    
    _messageLB.translatesAutoresizingMaskIntoConstraints = NO;
    [_messageLB autoSetDimension:ALDimensionWidth toSize:230];
    [_messageLB autoSetDimension:ALDimensionHeight toSize:60];
    [_messageLB autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [_messageLB autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_imageview withOffset:10];
    
    _button.translatesAutoresizingMaskIntoConstraints = NO;
    [_button autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_hintView];
    [_button autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_hintView];
    [_button autoSetDimension:ALDimensionHeight toSize:50];
    [_button autoSetDimension:ALDimensionWidth toSize:270];
    
}
- (void)show{
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    
}
@end
