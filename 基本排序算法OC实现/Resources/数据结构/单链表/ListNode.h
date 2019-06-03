//
//  ListNode.h
//  基本排序算法OC实现
//
//  Created by july on 2019/5/29.
//  Copyright © 2019 july. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListNode : NSObject

+ (ListNode *)addNode:(ListNode *)p andValue:(NSString *)value;

+ (int)getNodeLength:(ListNode *)p;

+ (void)printNodeData:(ListNode *)p;

+ (void)deleteNode:(ListNode *)p withNum:(int)num;

+ (void)insertListNode:(ListNode *)oldP newNode:(ListNode *)newP Num:(int)num;

+ (void)printReverseNodeData:(ListNode *)p;

+ (ListNode *)reverseNode:(ListNode *)head;

+ (ListNode *)reverseList:(ListNode *)head;

@end
