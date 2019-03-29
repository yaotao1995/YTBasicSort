//
//  BinarySearch.h
//  基本排序算法OC实现
//
//  Created by july on 2019/3/29.
//  Copyright © 2019 july. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinarySearch : NSObject

//递归
- (int)binarySearchRecursive:(NSMutableArray *)list withNum:(int)num start:(int)startNum end:(int)endNum;
//非递归
- (int)binarySearchNoRecursive:(NSMutableArray *)list withNum:(int)num;

@end
