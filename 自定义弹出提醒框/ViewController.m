//
//  ViewController.m
//  自定义弹出提醒框
//
//  Created by TianLi on 2018/8/7.
//  Copyright © 2018年 TianLi. All rights reserved.
//

#import "ViewController.h"
#import "PureLayout.h"
#import "JSCAlertView.h"

//根据rgb取色
#define JyColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //第一种，未封装的方法
    UIButton *btn = [[UIButton alloc] init];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(10, 100, 50, 50);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    
    
    //第二种，封装之后的方法
    UIButton *jscbtn = [[UIButton alloc] init];
    jscbtn.backgroundColor = [UIColor greenColor];
    jscbtn.frame = CGRectMake(10, 200, 50, 50);
    [self.view addSubview:jscbtn];
    [jscbtn addTarget:self action:@selector(jscbtnclick) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (void)jscbtnclick{
    JSCAlertView *jscview = [[JSCAlertView alloc] init];
    jscview.messageLB.text= @"sadghsdfh";
    [jscview show];
}
- (void)btnclick{
    
    
    UIWindow * keyWindow  = [UIApplication sharedApplication].keyWindow;
    UIView * backgroundView = [[UIView alloc] initWithFrame:keyWindow.bounds];
    backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    backgroundView.userInteractionEnabled = YES;
    backgroundView.tag = 611611;
    [keyWindow addSubview:backgroundView];
    
    UIView * hintView = [[UIView alloc] init];
    hintView.backgroundColor = [UIColor whiteColor];
    hintView.layer.cornerRadius = 10.0;
    hintView.layer.masksToBounds = YES;
    [backgroundView addSubview:hintView];
    [hintView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [hintView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [hintView autoSetDimension:ALDimensionHeight toSize:270];
    [hintView autoSetDimension:ALDimensionWidth toSize:270];
    
    UILabel * titleLB = [UILabel new];
    titleLB.text = @"小精灵提示";
    titleLB.textColor = JyColor(0, 151, 232, 1);
    titleLB.textAlignment = NSTextAlignmentCenter;
    titleLB.font = [UIFont systemFontOfSize:20];
    [hintView addSubview:titleLB];
    [titleLB autoSetDimension:ALDimensionWidth toSize:270];
    [titleLB autoSetDimension:ALDimensionHeight toSize:30];
    [titleLB autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [titleLB autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:hintView withOffset:10];
    
    UIImageView *imageview = [[UIImageView alloc] init];
    imageview.image = [UIImage imageNamed:@"xiaojingling.png"];
    imageview.contentMode=UIViewContentModeScaleAspectFit;
    [hintView addSubview:imageview];
    [imageview autoSetDimension:ALDimensionWidth toSize:100];
    [imageview autoSetDimension:ALDimensionHeight toSize:100];
    [imageview autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [imageview autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:titleLB withOffset:10];
    
    
    UILabel * messageLB = [UILabel new];
    messageLB.text =[NSString stringWithFormat:@"今天是姨妈期，记得多喝热水，注意保暖哦!"];
    messageLB.numberOfLines = 2;
    messageLB.font = [UIFont systemFontOfSize:16];
    messageLB.textAlignment = NSTextAlignmentCenter;
    [hintView addSubview:messageLB];
    [messageLB autoSetDimension:ALDimensionWidth toSize:230];
    [messageLB autoSetDimension:ALDimensionHeight toSize:60];
    [messageLB autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [messageLB autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:imageview withOffset:10];
    
    UIButton * button1 = [UIButton new];
    [button1 setTitle:@"知道了" forState:(UIControlStateNormal)];
    [button1 setTitleColor:JyColor(0, 151, 232, 1) forState:(UIControlStateNormal)];
    button1.titleLabel.font = [UIFont systemFontOfSize:18];
    [button1 addTarget:self action:@selector(updateFormAppStore:) forControlEvents:(UIControlEventTouchUpInside)];
    [hintView addSubview:button1];
    [button1 autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:hintView];
    [button1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:hintView];
    [button1 autoSetDimension:ALDimensionHeight toSize:50];
    [button1 autoSetDimension:ALDimensionWidth toSize:270];
    
}
-(void)updateFormAppStore:(UIButton *)sender{
    UIView * view = [[UIApplication sharedApplication].keyWindow viewWithTag:611611];
    [view removeFromSuperview];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
