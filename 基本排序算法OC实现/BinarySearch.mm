//
//  BinarySearch.m
//  基本排序算法OC实现
//
//  Created by july on 2019/3/29.
//  Copyright © 2019 july. All rights reserved.
//

/*
    二分查找
    1. 也叫折半查找,只对有序数组有效
    2. 说白了就是查找目标数在一个有序数列中的位置（下标）
    3. 从中间开始取值比较，目标值小于这个值，取前半部分，大于再取后半部分，然后再从中间开始...
    4. 该方法每次减少一半的搜索区域
 
    二分查找有递归和非递归，非递归就是while循环
 
    时间复杂度:
            O(logn)
 
    空间复杂度:
            O(1)
 
 */

#import "BinarySearch.h"

@implementation BinarySearch

#pragma mark 二分查找 递归 OC
- (int)binarySearchRecursive:(NSMutableArray *)list withNum:(int)num start:(int)startNum end:(int)endNum{
    //递归方式：判断主体就是本身，所以需要将新排序体在原数组中的开始和结束下标提取出来 也可以将这个循环体单独提出来在下面会提到
    if (startNum > endNum) //如果开始大于结束，直接结束
        return -1;
    
    //取到开始和结束的中间值
    int mid = startNum + (endNum - startNum) / 2;
    //判断如果大于目标值
    if ([list[mid] intValue] > num){
        //传入原数组，原目标值，开始还是开始下标，结束下标为mid - 1  这样就减去了后半部分
        return [self binarySearchRecursive:list withNum:num start:startNum end:mid - 1];
    //如果小于目标值
    }else if([list[mid] intValue] < num){
        //传入原数组，原目标值，开始下标为mid + 1，结束下标还是原结束下标  这样就减去了前半部分
        return [self binarySearchRecursive:list withNum:num start:mid + 1 end:endNum];
    }else{
        //大于小于都不是 就剩等于了 直接返回下标
        return mid;
    }
}


#pragma mark 二分查找 递归 C
int binarySearch(const int arr[], int start, int end, int khey) {
    //这里就不解释了。和上述OC 写法完全一致
    if (start > end)
        return -1;
    int mid = start + (end - start) / 2;
    if (arr[mid] > khey)
        return binarySearch(arr, start, mid - 1, khey);
    else if (arr[mid] < khey)
        return binarySearch(arr, mid + 1, end, khey);
    else
        return mid;
}



#pragma mark 二分查找 非递归 OC
- (int)binarySearchNoRecursive:(NSMutableArray *)list withNum:(int)num{
    int ret = -1;   //最后输出下标，如果没有匹配就是-1
    int mid;        //中间数
    int start = 0;  //开始下标
    int end = (int)list.count - 1;//结束下标
    
    //结束条件开始下标小于等于结束下标  比如数组为空或者只有一个数
    while (start <= end) {
        mid = start + (end - start) / 2;                //取开始和结束的中间
        if ([list[mid] intValue] < num){                //如果小于
              start = mid + 1;                          //改变开始下标，结束下标不变
        }else if ([list[mid] intValue] > num){          //如果大于
             end = mid - 1;                             //修改结束下标，开始下标不变
        }else {
            ret = mid;                                  //不大不小 表示找到，赋值下标 结束循环
            break;
        }
    }
    return ret;
}

#pragma mark 二分查找 非递归 C while循环
int binary_search(const int arr[], int start, int end, int key) {
    
    int ret = -1;
    int mid;
    while (start <= end) {
        mid = start + (end - start) / 2;
        if (arr[mid] < key)
            start = mid + 1;
        else if (arr[mid] > key)
            end = mid - 1;
        else {
            ret = mid;
            break;
        }
    }
    
    return ret;     // 单一出口
}


//两个函数提取了参数，在使用的时候只需要传入’数组‘和’目标数‘就行了
- (int)binarySearchWithRecursion:(NSArray *)list withNum:(int)num{
    int startNum = 0;
    int endNum = (int)[list count] - 1;
    return [self binSearch:list start:startNum end:endNum withNum:num];
}

- (int)binSearch:(NSArray *)list start:(int)startNum end:(int)endNum withNum:(int)num{
    if (startNum <= endNum) {
        int mid = (startNum + endNum)/2;
        if (num == [list[mid] intValue]){
            return mid;
        }else if(num < [list[mid] intValue]){
            return [self binSearch:list start:startNum end:(mid - 1) withNum:num];
        }else{
            return [self binSearch:list start:mid+1 end:endNum withNum:num];
        }
    }else{
        return -1;
    }
}

@end
