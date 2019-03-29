//
//  InsertSort.m
//  基本排序算法OC实现
//
//  Created by july on 2019/3/21.
//  Copyright © 2019 july. All rights reserved.
//

/*
    通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。
    简单讲就是将新元素以递归的方式向前扫描有序数列判断位置丢进去
 
    算法复杂度：
        最好的情况就是已经是有序数列 n-1次 就行了
        最坏的情况  O(n^2)
    所以，插入排序不适合对于数据量比较大的排序应用
 */

#import "InsertSort.h"

@implementation InsertSort

#pragma mark 插入排序 OC
- (void)insert_sort:(NSMutableArray *)list{
    
    // 函数 insert_sort 接收 可变数组 list
    // replaceObjectAtIndex 函数是NSArray内的替换元素方法
    
    //1. 循环传入的数组大小(第一个没必要排序，所以从下标1开始)
    for (int i = 1; i < [list count]; i++) {
        //2. 循环到几就表示该下标之前为有序数列，j表示当前循环到的下标
        int j = i;
        //3. list内当前下标的值
        NSInteger temp = [[list objectAtIndex:i] integerValue];
        //4. 判断是否下标大于0，是否小于前面的数，因为下标前为有序数列，只要和最后一个对比
        while (j > 0 && temp < [[list objectAtIndex:j - 1] integerValue]) {
            //5. 条件成立就将前一个数往后移动
            [list replaceObjectAtIndex:j withObject:[list objectAtIndex:(j - 1)]];
            //6. 递归往前，只要条件成立
            j--;
        }
        //7. 循环条件不成立，就将需要移动的元素，放入循环到的下标位置内
        //8.若元素无需移动，将元素重新往自己的位置覆盖一遍
        [list replaceObjectAtIndex:j withObject:[NSNumber numberWithInteger:temp]];
    }
    
}

#pragma mark 插入排序 C
void insert_sort(int arr[], int len){
    int i,j,key;
    for (i=1;i<len;i++){
        key = arr[i];
        j=i-1;
        while((j>=0) && (arr[j]>key)) {
            arr[j+1] = arr[j];
            j--;
        }
        arr[j+1] = key;
    }
}

@end
