//
//  Quicksort.h
//  基本排序算法OC实现
//
//  Created by july on 2019/4/1.
//  Copyright © 2019 july. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quicksort : NSObject

// 快速排序
+ (void)quickSortWithArray:(NSMutableArray *)array withLeft:(NSInteger)left andRight:(NSInteger)right;

@end

