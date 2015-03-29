//
//  WYLabel.m
//  WYXW
//
//  Created by yangL on 15/3/24.
//  Copyright (c) 2015年 yangL. All rights reserved.
//

#import "WYLabel.h"
#import "SystemConst.h"

@interface WYLabel()

@property (nonatomic, strong) id target;
@property (nonatomic, assign) SEL sel;

@end

@implementation WYLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        _isNormal = YES;
        self.font = FONT16;
    }
    return self;
}

//点击事件
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

    _itemblock(self);
    
    //如果当前的按钮的状态是选择状态  再点击的话也是选择状态
    if (!_isNormal) {
        self.font = FONT18;
        self.textColor = _highLightColor;
    }
    
    _isNormal = !_isNormal;
}

- (void)addTarget:(id)target andBlock:(itemBlock)itemblock {
    _target = target;
    self.itemblock = itemblock;
}

@end
