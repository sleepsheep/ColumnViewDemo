//
//  WYColumnView.m
//  WYXW
//
//  Created by yangL on 15/3/24.
//  Copyright (c) 2015年 yangL. All rights reserved.
//

#import "WYColumnView.h"
#import "WYLabel.h"
#import "SystemConst.h"

@interface WYColumnView() <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) WYLabel *curLabel;

@end

@implementation WYColumnView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
        _curLabel = [[WYLabel alloc]init];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        _scrollView = [[UIScrollView alloc] initWithFrame:frame];
    }
    return self;
}

//set方法中增加自己要实现的逻辑代码
- (void)setDelegate:(id<WYColumnViewDelegate>)delegate {
    if (_delegate != delegate) {
        
        _delegate = delegate;
        
        [self makeView];
    }
}


#define ITEMPAD 30//两个按钮间的间距
#define SETTAG(a) a + 100
- (void)makeView {
    
    NSInteger num = 0;
    if ([self.delegate respondsToSelector:@selector(numberOfColumnView:)]) {
        num = [self.delegate numberOfColumnView:self];
    }
    
    CGFloat totalWidth = 0;
    
    for (int i = 0; i < num; i++) {
        
        if ([self.delegate respondsToSelector:@selector(columnView:atIndex:)]) {
            NSString *title = [self.delegate columnView:self atIndex:i];
            
            NSDictionary *dict = [NSDictionary dictionaryWithObject:FONT18 forKey:NSFontAttributeName];
            CGFloat width = [title sizeWithAttributes:dict].width;
            WYLabel *label = [[WYLabel alloc] initWithFrame:CGRectMake(ITEMPAD + totalWidth, 0, width, self.frame.size.height)];
            [label setNormalColor:[UIColor blackColor]];
            [label setHighLightColor:[UIColor redColor]];
            [label addTarget:self andBlock:^(WYLabel *label) {
                [self label_clicked:label];
            }];
            label.text = title;
            label.tag = SETTAG(i);
            if (0 == i) {
                [self label_clicked:label];
            }
            
            totalWidth = totalWidth + width + ITEMPAD;//scrollView的跨度
            [_scrollView addSubview:label];
        }
    }
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    [_scrollView setContentSize:CGSizeMake(totalWidth + ITEMPAD, self.frame.size.height)];
    
    [self addSubview:_scrollView];
}

- (void)label_clicked:(WYLabel *)label {
    
    label.font = FONT18;
    label.textColor = [UIColor redColor];
    label.isNormal = NO;
    _curLabel.font = FONT16;
    _curLabel.textColor = [UIColor blackColor];
    _curLabel = label;
    
    [UIView animateWithDuration:1 animations:^{
        label.transform = CGAffineTransformMakeRotation(M_PI);
        _curLabel.transform = CGAffineTransformMakeRotation(0);
        
    } completion:^(BOOL finishFlag){

    }];
    
    NSInteger index = label.tag - 100;
    if ([self.delegate respondsToSelector:@selector(columnView:didSelectedAtIndex:)]) {
        [self.delegate columnView:self didSelectedAtIndex:index];
    }
}

@end
