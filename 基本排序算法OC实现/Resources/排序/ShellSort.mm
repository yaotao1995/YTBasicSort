//
//  ShellSort.m
//  基本排序算法OC实现
//
//  Created by july on 2019/4/8.
//  Copyright © 2019 july. All rights reserved.
/*
    希尔排序（递减增量排序算法）:
        1. 使用步长分区，并且逐渐减小步长来进行的排序方法
        2. 是插入排序的高效改进版本，不过是不稳定的
        3. 优先比较距离较远的元素
        4.将所有数据分几个区来提升插入排序性能，简单点就是 可以将一个数朝目标位置前进一大步，不用一步步走
        一般步长取一半
 
 
    注意：希尔排序是基于插入排序的，而当步长为1的时候，它就是插入排序
         数据体量大的时候，希尔排序的优势比较明显
 
    复杂度
     最坏：根据步长来决定的
     好的： O(nlog^2n)
     最好： O(n)
 
 
    一、假设有如下数组
    5，1，7，9，4，6，3，8，2，10

    二、初始步长5，得到如下二维数组，对每列排序
    5，1，7，9，4
    6，3，8，2，10

    三、排完序的
    5，1，7，2，4
    6，3，8，9，10
 
    四、步长减少到3
    5，1，7
    2，4，6
    3，8，9
    10
 
    五、排完
    2，1，6
    3，4，7
    5，8，9
    10
 
    此时步长到了1时候就是插入排序了，大体位置已经排好
 复杂度：
 
 */

#import "ShellSort.h"

@implementation ShellSort

#pragma mark OC
+ (void)shellSort:(NSMutableArray *)list{
    //根据可变数组的长度 除二得到 步长gap
    int gap = [list count] / 2.0;
    //条件步长大于等于1都执行
    while (gap >= 1) {
        
        for (int i = gap ; i < [list count]; i++) {
            
            //取到步长位置的数,先取出来，以防被覆盖
            NSInteger temp = [[list objectAtIndex:i] integerValue];
            int j = i;
            
            //再取到相隔步长的数比较
            while (j >= gap && temp < [[list objectAtIndex:(j-gap)] integerValue]) {
                
                //条件成立，就将大的数，丢到temp原来的位置上，也就是占据了temp的坑位
                [list replaceObjectAtIndex:j withObject:[list objectAtIndex:j-gap]];
                j-=gap;
            }
            //若上述while循环执行，那么表示temp原来的位置，已经被占据了，所以执行了j-=gap得到temp应该去的新位置的下标，也就是占据数的原来位置
            //若上述while循环没有执行，就将temp丢回原来的位置
            [list replaceObjectAtIndex:j withObject:[NSNumber numberWithInteger:temp]];
        }
        //每次循环步长取一半
        gap = gap / 2;
    }
}

#pragma mark C
void shell_sort(int arr[], int len) {
    int gap, i, j;
    int temp;
    for (gap = len >> 1; gap > 0; gap >>= 1)
        for (i = gap; i < len; i++) {
            temp = arr[i];
            for (j = i - gap; j >= 0 && arr[j] > temp; j -= gap)
                arr[j + gap] = arr[j];
            arr[j + gap] = temp;
        }
}


@end
