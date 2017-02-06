//
//  ViewController.m
//  CalendarDemo
//
//  Created by XQQ on 16/8/22.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "ViewController.h"
#import "CJCalendarViewController.h"

#define iphoneWidth  [UIScreen mainScreen].bounds.size.width
#define iphoneHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<CalendarViewControllerDelegate>
/**
 *  显示的label
 */
@property(nonatomic, strong)  UILabel  *  label;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 90, 90, 44);
    [button setTitle:@"开启日历" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonDidPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake(50, 150,iphoneWidth - 100 , 44)];
    _label.text = @"2016年-8月-25日";
    _label.backgroundColor = [UIColor grayColor];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];
}
#pragma mark - activity
- (void)buttonDidPress{
    CJCalendarViewController * cj = [[CJCalendarViewController alloc]init];
    cj.view.frame = self.view.frame;
    cj.delegate = self;
    //选择传入的日期
    [cj setYear:@"2016" month:@"08" day:@"25"];
    [self presentViewController:cj animated:YES completion:nil];
}

#pragma mark - CalendarViewControllerDelegate

-(void) CalendarViewController:(CJCalendarViewController *)controller didSelectActionYear:(NSString *)year month:(NSString *)month day:(NSString *)day{
    _label.text = [NSString stringWithFormat:@"%@年-%@月-%@日",year,month,day];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
