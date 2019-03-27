//
//  BubbleSort.m
//  基本排序算法OC实现
//
//  Created by july on 2019/3/23.
//  Copyright © 2019 july. All rights reserved.
//

/*
  冒泡排序就是把小的元素往前调或者把大的元素往后调。比较是相邻的两个元素比较，交换也发生在这两个元素之间。所以，如果两个元素相等，是不会再交换的；如果两个相等的元素没有相邻，那么即使通过前面的两两交换把两个相邻起来，这时候也不会交换，所以相同元素的前后顺序并没有改变，所以冒泡排序是一种稳定排序算法。
    步骤拆分：
    1.比较相邻的元素。如果第一个比第二个大，就交换他们两个。
    2.对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对。这步做完后，最后的元素会是最大的数。
    3.针对所有的元素重复以上的步骤，除了最后一个。
    4.持续每次对越来越少的元素重复上面的步骤，直到没有任何一对数字需要比较
 
    算法复杂度
        最好最坏都是：O(n^2)
    所以冒泡在数据量大的时候是不推荐的，效率低下
 
 */


/*
    鸡尾酒排序（定向冒泡排序）
    可以说鸡尾酒排序是冒牌排序的改良
    不同于冒泡的从左到右比较
    鸡尾酒排序是第一趟左向右排序，第二趟 右向左排序，往返，直至左右相遇
    算法复杂度
        最坏：O(n^2)
        最好：O(n)
    所以在部分排序好的情况下 花费接近 O(n)
 
 */

#import "BubbleSort.h"

@implementation BubbleSort

#pragma mark 冒泡排序  OC
- (void)bubble_sort:(NSMutableArray *)list{//接收一个可变数据list
    //循环数组大小的次数 因为要走访要排序的数列
    for (int i = 0; i < list.count; i++) {
        //相应i下标位置开始位置需要对比的次数
        for (int j = 0; j < list.count - i - 1; j++) {
            //如果j下标位置 小于 j+1位置的
            if (list[j] < list[j+1]) {
                //循环主体，使用temp临时存放 j 小标的数
                int temp = [list[j] intValue];
                //将 j+1 下标的数放入 j 下标的数
                list[j] = list[j + 1];
                //再将temp 放入 j+1 位置
                list[j + 1] = [NSNumber numberWithInt:temp];
            }
        }
    }
}

#pragma mark 冒泡排序  C
//void bubble_sort(int a[], int n)
//{
//    int i, j, temp;
//    for (j = 0; j < n - 1; j++)
//        for (i = 0; i < n - 1 - j; i++)
//        {
//            if(a[i] > a[i + 1])
//            {
//                temp = a[i];
//                a[i] = a[i + 1];
//                a[i + 1] = temp;
//            }
//        }
//}


#pragma mark 鸡尾酒排序
-(void)cocktail_sort:(NSMutableArray *)list{
    
    int i;
    int left = 0;
    int right = (int)list.count - 1;
    int temp;
    
    while (left < right) {
        //                                      假设是第一次循环
        //i 从 0 开始往右循环一遍，类似于冒泡，把最大的放到最后
        for (i = left; i < right; i++){
            //判断条件和冒泡一致
            if (list[i] > list[i + 1]) {
                //temp 临时存放
                temp = [list[i] intValue];
                //将 i+1 下标的数放入 i 下标的数
                list[i] = list[i + 1];
                //再将temp 放入 i+1 位置
                list[i + 1] = [NSNumber numberWithInt:temp];
            }
        }
        //右边减减 是因为最大的已经被放到最后了，所以右边不需要从最后一位开始
        right--;
        //同时开始从右到左排序，把最小的放到最前
        for (i = right; i > left; i--){
            if (list[i - 1] > list[i]) {
                //tmp 临时存放
                temp = [list[i] intValue];
                //将 i-1 下标的数放入 i 下标的数
                list[i] = list[i - 1];
                //再将temp 放入 j-1 位置
                list[i - 1] = [NSNumber numberWithInt:temp];
            }
        }
        //待到最小的放到了最前，这个left就可以从第二位开始循环了
        left++;
        
    }
    
}

@end
