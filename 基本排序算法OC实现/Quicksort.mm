//
//  Quicksort.m
//  基本排序算法OC实现
//
//  Created by july on 2019/4/1.
//  Copyright © 2019 july. All rights reserved.
/*
    快速排序
 
    简单分为几步：
        1.找一个基准数
        2.把大于这个数的全放到右边，小于到放到左边
        3.再在左右两个区间分别找基准数，重复上述操作
        4.直到区间内只有一个数
 
    复杂度：
        最佳 O(nlogn)
        最坏 O(n^2)
 
    缺点：不稳定
    优点：快速
 
 解释一下：下面排序 是针对下方的 quickSortWithArray 函数得到的结果
 
        5  3  9  4  6  7  2  8  1
 
 【1】   1  3  2  4  5  7  6  8  9          基准数：5
                    -
 【2】   1  3  2  4  5  _  _  _  _          基准数：1  位置正确 所以没有变
        -
 【3】   1  2  3  4  5  _  _  _  _          基准数：3  左边子树会递归深入，所以在实际中，是先排序好一边，再排序第二边,至此左子树排序完成
              -
 【4】   1  3  2  4  5  6  7  8  9          基准数：7  将 7 位置摆正
                          -
 【5】   1  3  2  4  5  6  7  8  9          基准数：8  机器不知道 7摆正之后就是有序，所以还会进行这一趟排序
 
 第【1】趟拆分，基准数：5，结束条件（i < j）：
  1.    5  3  9  4  6  7  2  8  1           i = 0 ，j = 8
  2.    1  3  9  4  6  7  2  8  1           i = 2 ，j = 8
  3.    1  3  2  4  6  7  6  8  9           i = 4 ，j = 6
  3.    1  3  2  4  5  7  6  8  9           i = 4 ，j = 4
 
 注：这里出现两数一样的情况，是没有将基准数填回去的操作，在最后填回去就好了，不用每次都填回去
 
 */

#import "Quicksort.h"

@implementation Quicksort

#pragma mark oc 递归法
+ (void)quickSortWithArray:(NSMutableArray *)array withLeft:(NSInteger)left andRight:(NSInteger)right{
    
    //如果左下标大于等于右下标就结束  防止无限递归下去
    if (left >= right) return;
    
    //定义两个NSInteger型变量存储，在下面循环过程中的左右下标递进位置
    NSInteger i = left;
    NSInteger j = right;
    
    //基准值 取左下标位置数据
    NSInteger key = [array[left] integerValue];

    //循环主体，第一趟
    while (i < j) {
        //这里从右边开始判断，注意一点，当前的左边第一个值被提取出来，放到了key中当做基准值使用了，也就是array[i]这个位置的坑被挖出来了
        while (i < j && key <= [array[j] integerValue]) {
            j--;
        }
        
        //将array[j] 这个值，放到了挖好的array[i]这个坑里面，无论上述while条件是否成立都进行调换，不急，array[i]的值已经被挖到了 基准值中放着了，不会丢
        //如果上述(i < j && key <= [array[j] integerValue])未成立，就导致了array[i] 和 array[j] 的两个值一样的错误假象，但是问题不大，后续判断会解决这个问题
        array[i] = array[j];
        
        //刚才被挖到这里[array[i] 的值，再进行判断，若上判断未成立，这里的判断 key >= [array[i] integerValue] 就是成立的
        while (i < j && key >= [array[i] integerValue]) {
            i++;
        }
        
        //上述两个判断有一个会成立，导致，j 或者 i 其中有一个一定会发生变化 ，再执行 array[j] = array[i]，把array[i]的值挖出来丢到array[j]里面
        array[j] = array[i];
    }
    
    //一趟结束，左右排序完成，i这个位置空出来，需要将基准值埋回去
    array[i] = [NSNumber numberWithInteger:key];
    
    //递归 重复上述操作，数组不变，左右下标，为前一趟划分好的左右下标，递归的结束条件在函数开头，也就是说，最后左右相等的时候，还会调用函数，只是被(left >= right) 判断调用的return 巧妙的结束掉了递归
    [[self class] quickSortWithArray:array withLeft:left andRight:i - 1];
    [[self class] quickSortWithArray:array withLeft:i + 1 andRight:right];
}

#pragma mark C 递归法
void quick_sort_m(int arr[], int len) {
    quick_sort_recursive(arr, 0, len - 1);
}

//循环本体
void quick_sort_recursive(int arr[], int start, int end) {
    
    //用于结束递归的判断
    if (start >= end)
        return;
    
    //end下标当基准值
    int mid = arr[end];
    
    //两局部变量，存储递进下标位置
    int left = start, right = end - 1;
    
    //循环主体
    while (left < right) {
        while (arr[left] < mid && left < right)
            left++;
        while (arr[right] >= mid && left < right)
            right--;
        swap(&arr[left], &arr[right]);
    }
    if (arr[left] >= arr[end])
        swap(&arr[left], &arr[end]);
    else
        left++;
    if (left)
    //调用自身，范围缩小
    quick_sort_recursive(arr, start, left - 1);
    quick_sort_recursive(arr, left + 1, end);
}



#pragma mark C 迭代法
typedef struct _Range {
    //结构体定义一个开始和一个结束两个成员变量
    int start, end;
} Range;

//函数 new_Range 返回一个新的结构体 接受两个参数，即开始和结束两个参数
Range new_Range(int s, int e) {
    Range r;
    r.start = s;
    r.end = e;
    return r;
}

//函数quick_sort 接受一个int型的数组 ‘arr[]’，以及一个数组长度 ‘len’
void quick_sort(int arr[], const int len) {
    
    //防止长度有误，这里加了判断
    if (len <= 0)
        return;
    //Range结构体类型的数组
    Range r[len];
    int p = 0;
    r[p++] = new_Range(0, len - 1); // 放入值
    while (p) {
        Range range = r[--p];  // 取值
        if (range.start >= range.end) // 如果开始大于结束就没必要继续了 直接退出
            continue;
        int mid = arr[(range.start + range.end) / 2]; // 取中间数为基准值
        int left = range.start, right = range.end;    //得到左右位置
        do {
            //下为循环体
            while (arr[left] < mid) ++left;   // 左边是否小于 基准值，左边加一
            while (arr[right] > mid) --right; // 右边下标的数是否大于 基准值 右边下标减减
            if (left <= right) {
                swap(&arr[left], &arr[right]);//交换函数
                left++;
                right--;
            }
        } while (left <= right);//do while 循环判断 左边小于等于右边
        
        if (range.start < right) r[p++] = new_Range(range.start, right);
        if (range.end > left) r[p++] = new_Range(left, range.end);
    }
}

//迭代和递归两函数的交换函数
//函数 swap传入两个 int 型的指针 用于交换两数
void swap(int *x, int *y) {
    int t = *x;
    *x = *y;
    *y = t;
}

@end
