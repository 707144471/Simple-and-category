//
//  NSObject+DELEGATE_demol.m
//  单例模式demol
//
//  Created by 123 on 2017/6/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "NSObject+DELEGATE_demol.h"
#import "ShaoLin.h"
@implementation NSObject (DELEGATE_demol)
-(NSString *)string{
return @"我是返回值";
}
-(BOOL)whyIsYesAndNo{
    ShaoLin *shao=[ShaoLin hanXianSheng];
    return shao.why;
}
@end
