//
//  main.m
//  基本排序算法OC实现
//
//  Created by july on 2019/3/21.
//  Copyright © 2019 july. All rights reserved.
//

/*
 * 该项目为练手项目，复习使用OC以及C实现基本的几种排序算法
 */

#import <Foundation/Foundation.h>

/** 插入排序 */
#import "InsertSort.h"
/** 冒泡排序 以及 鸡尾酒排序 */
#import "BubbleSort.h"
/** 二分查找 */
#import "BinarySearch.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *array = [NSMutableArray arrayWithArray:@[@1,@2,@3,@4,@5]];
//        InsertSort *insert = [InsertSort new];
//        [insert insert_sort:array];
//        BubbleSort *bubbleSort = [BubbleSort new];
//        [bubbleSort cocktail_sort:array];
        
        BinarySearch *binarySearch = [BinarySearch new];
    
        int recursiveNum = [binarySearch binarySearchRecursive:array withNum:4 start:0 end:4];
        int noRecursiveNum = [binarySearch binarySearchNoRecursive:array withNum:4];
        NSLog(@">>> recursiveNum:%d noRecursiveNum:%d",recursiveNum,noRecursiveNum);
    }
    return 0;
}
