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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *array = [NSMutableArray arrayWithArray:@[@4,@2,@6,@1,@5]];
        InsertSort *insert = [InsertSort new];
        [insert insert_sort:array];
        
    }
    return 0;
}
