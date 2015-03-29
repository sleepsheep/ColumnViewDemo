//
//  SystemConst.h
//  TabbarDemo
//
//  Created by yangL on 15/3/18.
//  Copyright (c) 2015年 yangL. All rights reserved.
//

#import "SystemConst.h"

#ifdef DEBUG
#define LYLOG(...) NSLog(__VA_ARGS__)
#else
#define LYLOG(...)
#endif

//字体
#define FONT14 [UIFont systemFontOfSize:14]
#define FONT16 [UIFont systemFontOfSize:16]
#define FONT18 [UIFont systemFontOfSize:18]
#define FONT19 [UIFont systemFontOfSize:19]
#define FONT20 [UIFont systemFontOfSize:20]
#define FONT21 [UIFont systemFontOfSize:21]
#define FONT22 [UIFont systemFontOfSize:22]