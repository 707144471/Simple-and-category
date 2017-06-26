//
//  ViewController.m
//  单例模式demol
//
//  Created by 123 on 2017/6/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+DELEGATE_demol.h"
#import "ShaoLin.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor greenColor];
    NSString *str=[self string];//类别
    NSLog(@"str=====%@",str);
    ShaoLin *a=[ShaoLin hanXianSheng];//单利
    a.name=@"我是a的name的值";
    if (a.why) {
        NSLog(@"++++++是不是yes");
    }
    ShaoLin *b=[ShaoLin hanXianSheng];
    b.why=YES;
    NSLog(@"b.name====%@",b.name);
    NSLog(@"%@",a);
    NSLog(@"%@",b);
    
    if ([self whyIsYesAndNo]) {
        NSLog(@"-----是不是yes");
    }
   
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
