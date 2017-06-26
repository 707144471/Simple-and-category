//
//  ShaoLin.h
//  单例模式demol
//
//  Created by 123 on 2017/6/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShaoLin : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)BOOL why;
+(ShaoLin *)hanXianSheng;
@end
