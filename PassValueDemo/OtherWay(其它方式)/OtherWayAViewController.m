//
//  OtherWayAViewController.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import "OtherWayAViewController.h"
#import "OtherWayBViewController.h"

@interface OtherWayAViewController ()

@end

@implementation OtherWayAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    OtherWayBViewController *bvc = [[OtherWayBViewController alloc] initWithUserName:@"大侠" WithPassWord:@"123456"];//初始化传值
    bvc.userName = @"测试名字";//属性传值只能正向传值
    bvc.passWord = @"0000000";//属性传值只能正向传值
    
    /*==== NSUserDefaults通过存值进行传值 ====*/
    [[NSUserDefaults standardUserDefaults]setValue:@"测试名字" forKey:@"UserName"];
    [[NSUserDefaults standardUserDefaults]setValue:@"0000000" forKey:@"PassWord"];
    [[NSUserDefaults standardUserDefaults]synchronize];//将缓存中的数据强制写入磁盘
    /*==== NSUserDefaults通过存值进行传值 ====*/
    
    [self.navigationController pushViewController:bvc animated:YES];
}

@end
