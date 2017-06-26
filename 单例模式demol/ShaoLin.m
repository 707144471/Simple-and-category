//
//  ShaoLin.m
//  单例模式demol
//
//  Created by 123 on 2017/6/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "ShaoLin.h"
static ShaoLin *shao = nil;
@implementation ShaoLin
+(ShaoLin *)hanXianSheng{
    static dispatch_once_t token;
    dispatch_once(&token,^{
        if(shao == nil){
           shao = [[ShaoLin alloc]init];
        }
    } );
    return shao;
}
+(id)allocWithZone:(NSZone *)zone{
    @synchronized(self){
        if (!shao) {
            shao = [super allocWithZone:zone]; //确保使用同一块内存地址
            return shao;
        }
        return nil;
    }
}

//适当实现copyWithZone，release和autorelease。
- (id)init;
{
    @synchronized(self) {
        if (self = [super init]){
            return self;
        }
        return nil;
    }
}
@end
