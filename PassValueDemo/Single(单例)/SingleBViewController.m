//
//  SingleBViewController.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import "SingleBViewController.h"
#import "AppDelegate.h"
#import "UENSingleTon.h"

@interface SingleBViewController ()

@end

@implementation SingleBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSLog(@"%@", [UENSingleTon sharedUENSingleTon].nameStr);
    NSLog(@"%@", [UENSingleTon sharedUENSingleTon].sexxStr);
    
    // 获取单例对象
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    NSLog(@"%@", delegate.appDelegateStr1);
    NSLog(@"%@", delegate.appDelegateStr2);
    
}


@end
