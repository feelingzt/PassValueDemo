//
//  DelegateAViewController.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import "DelegateAViewController.h"
#import "DelegateBViewController.h"

@interface DelegateAViewController () <BViewControllerDelegate> //遵守协议(要先导入定义协议的那个头文件)

@end

@implementation DelegateAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"代理123";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    DelegateBViewController *bvc = [[DelegateBViewController alloc] init];
    bvc.delegate = self;//***将被动设置成主动的代理人***
    [self.navigationController pushViewController:bvc animated:YES];
    
}

/*
 * 既然遵守了协议，也成为了协议的代理人，则要实现BViewControllerDelegate的代理方法
 */
- (void)sendValue:(NSString *)value{
    self.navigationItem.title = value;
}


@end
