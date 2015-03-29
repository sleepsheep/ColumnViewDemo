//
//  ViewController.m
//  ColumnViewDemo
//
//  Created by yangL on 15/3/29.
//  Copyright (c) 2015年 yangL. All rights reserved.
//

#import "ViewController.h"
#import "WYColumnView.h"

@interface ViewController ()<WYColumnViewDelegate>

@property (nonatomic, strong) WYColumnView *columnView;
@property (nonatomic, strong) NSMutableArray *muTitleArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    //头条 娱乐 热点
    //体育  财经  科技  汽车  军事  时尚  本地
    _muTitleArr = [NSMutableArray arrayWithObjects:@"头条头条",@"娱乐le",@"NBA",@"体育",@"财经",@"头条",@"娱乐",@"热点热点",@"体育体育体育",@"财经", nil];
    
    _columnView = [[WYColumnView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    _columnView.delegate = self;
    
    [self.view addSubview:_columnView];
}

#pragma mark --<WYColumnViewDelegate>

//设置column的item的个数
- (NSInteger)numberOfColumnView:(WYColumnView *)columnView {
    return self.muTitleArr.count;
}

//设置每个item上的文字
- (NSString *)columnView:(WYColumnView *)columnView atIndex:(NSInteger)index {
    return self.muTitleArr[index];
}

- (void)columnView:(WYColumnView *)columnView didSelectedAtIndex:(NSInteger)index {
    
}- (void)didReceiveMemoryWarning {
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
