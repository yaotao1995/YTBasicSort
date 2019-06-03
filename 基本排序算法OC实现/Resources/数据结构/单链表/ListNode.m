//
//  ListNode.m
//  基本排序算法OC实现
//
//  Created by july on 2019/5/29.
//  Copyright © 2019 july. All rights reserved.
//

#import "ListNode.h"

@interface ListNode(){
    NSString *val;
    ListNode *next;
}

@end

@implementation ListNode

#pragma mark - 添加节点，该函数只限于往头部添加节点
+ (ListNode *)addNode:(ListNode *)p andValue:(NSString *)value{
    //注：这里添加节点包括尾节点空，所以这里添加了判断
    if (p == nil) {
        p = [[ListNode alloc] init];
        p->val = value;
        p->next = nil;
    }else{
        //调用函数本身，以递归的方式添加节点
        p->next = [ListNode addNode:p->next andValue:value];
    }
    return p;
}

#pragma mark - 单链表逆序
+ (ListNode *)reverseNode:(ListNode *)head{
    
    ListNode *newHead;
    if((head == nil) || (head->next == nil)){//递归部分表示，不断递归进到后一个指向nil的节点开始返回
         return head;
    }
    //递归
    //也就是一直往里走，走到上面判断也就是为空时候开始返回
    newHead = [self reverseNode:head->next];
    //回溯
    //最开始执行到的节点就是，最后面的一个节点
    head->next->next = head;
    head->next = NULL;
    return newHead;
}

#pragma mark - 获取链表长度
+ (int)getNodeLength:(ListNode *)p{
    ListNode *nP;
    int length=0;
    nP = p->next;
    //只要p不为nil
    while (p) {
        length++;
        p = p->next;
    }
    return length;
}

#pragma mark - 打印所有节点 方法同获取长度/获取第i个节点数据
+ (void)printNodeData:(ListNode *)p{

    int i = 0;
    if (p == nil) {
        NSLog(@"该链表是空链表");
        return;
    }
    //只要p不为nil
    while (p) {
        i++;
        NSLog(@"第%d个节点的数据是:%@",i,p->val);
        p = p->next;
    }
}

//打印所有值
//+ (void)printNodeData:(ListNode *)p{
//
//    if (p->next == nil) {
//        NSLog(@"值：%@", p->val);
//        return;
//    }
//    NSLog(@"值：%@", p->val);
//    [ListNode printNodeData:p->next];
//}

#pragma mark - 删除指定节点
+ (void)deleteNode:(ListNode *)p withNum:(int)num{
    if (num > [ListNode getNodeLength:p] -1) {
        NSLog(@"请输入有效节点位置！");
        return;
    }
    int i = 0;
    ListNode *newP = p;
    //只要p不为nil
    while (newP && i < num - 1) {
        i++;
        newP = newP->next;
    }
    //直接跳过，没回收那块内存啊这里
    newP->next = newP->next->next;
}

#pragma mark - 指定位置插入节点
+ (void)insertListNode:(ListNode *)oldP newNode:(ListNode *)newP Num:(int)num{
    if (num > [ListNode getNodeLength:oldP] -1) {
        NSLog(@"请输入有效节点位置！");
        return;
    }
    int i = 0;
    //找到插入的位置
    while (oldP && i < num - 1) {
        i++;
        oldP = oldP->next;
    }
    newP->next = oldP->next;
    oldP->next = newP;
}

#pragma mark - 链表逆序打印
+ (void)printReverseNodeData:(ListNode *)p{
    if (p == nil) {
        return;
    }else{
        [ListNode printReverseNodeData:p->next];
        NSLog(@">>>%@",p->val);
    }
}

#pragma mark - 单链表逆序 循环
+ (ListNode *)reverseList:(ListNode *)head{

    ListNode *next;
    ListNode *prev = NULL;
    while(head != NULL)
    {
       next = head->next;
       head->next = prev;
       prev = head;
      head = next;
    }
    return prev;
    
}


@end
