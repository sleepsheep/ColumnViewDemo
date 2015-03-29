//
//  WYLabel.h
//  WYXW
//
//  Created by yangL on 15/3/24.
//  Copyright (c) 2015年 yangL. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WYLabel;
typedef void (^itemBlock) (WYLabel *label);
@interface WYLabel : UILabel

@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *highLightColor;
@property (nonatomic, assign) BOOL isNormal;
@property (nonatomic, copy) itemBlock itemblock;

- (void)addTarget:(id)target andBlock:(itemBlock)itemblock;

@end
