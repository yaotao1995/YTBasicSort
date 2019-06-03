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

/** 快排*/
#import "Quicksort.h"

/** 希尔排序 */
#import "ShellSort.h"

/** 单链表 */
#import "ListNode.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

//        NSMutableArray *array = [NSMutableArray arrayWithArray:@[@5,@3,@9,@4,@6,@7,@2,@8,@1]];
//        [InsertSort insert_sort:array];
//        [BubbleSort cocktail_sort:array];
//        BinarySearch *binarySearch = [BinarySearch new];
//        int recursiveNum = [binarySearch binarySearchRecursive:array withNum:4 start:0 end:4];
//        int noRecursiveNum = [binarySearch binarySearchNoRecursive:array withNum:4];
//        [Quicksort quickSortWithArray:array withLeft:0 andRight:array.count - 1];
//        [ShellSort shellSort:array];
        

//单链表
        ListNode *p = [ListNode addNode:nil andValue:@"1"];
        ListNode *b = [ListNode addNode:p andValue:@"2"];
        ListNode *t = [ListNode addNode:b andValue:@"3"];
        ListNode *q = [ListNode addNode:t andValue:@"4"];
        ListNode *s = [ListNode addNode:q andValue:@"5"];
        
//       NSLog(@"链表长度：%d",[ListNode getNodeLength:s]);
//        [ListNode deleteNode:s withNum:2];//第三个节点
//         ListNode *aa = [ListNode addNode:nil andValue:@"插入的新节点"];
//        [ListNode insertListNode:s newNode:aa Num:3];
//        [ListNode printReverseNodeData:s];
       ListNode *reverse = [ListNode reverseNode:s];//逆序后
      [ListNode printNodeData:reverse];
        
        
        
    }
    return 0;
}

