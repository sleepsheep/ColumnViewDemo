//
//  WYColumnView.h
//  WYXW
//
//  Created by yangL on 15/3/24.
//  Copyright (c) 2015年 yangL. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, NSTextAlignmentStyle) {
    NSTextAlignmentStyleLeft      = 1,
    NSTextAlignmentStyleCenter,
    NSTextAlignmentStyleRight
};

@protocol WYColumnViewDelegate;
@interface WYColumnView : UIView

@property (nonatomic) NSTextAlignmentStyle columnAlignment;               // default is UITextAlignmentLeft

@property (nonatomic, strong) id<WYColumnViewDelegate> delegate;

@end

@protocol WYColumnViewDelegate <NSObject>

//设置column的item的个数
- (NSInteger)numberOfColumnView:(WYColumnView *)columnView;

//设置每个item上的文字
- (NSString *)columnView:(WYColumnView *)columnView atIndex:(NSInteger)index ;

- (void)columnView:(WYColumnView *)columnView didSelectedAtIndex:(NSInteger)index;

@end
