//
//  BubbleSort.h
//  基本排序算法OC实现
//
//  Created by july on 2019/3/23.
//  Copyright © 2019 july. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BubbleSort : NSObject

//冒泡排序
- (void)bubble_sort:(NSMutableArray *)list;

//鸡尾酒排序
-(void)cocktail_sort:(NSMutableArray *)list;

@end

