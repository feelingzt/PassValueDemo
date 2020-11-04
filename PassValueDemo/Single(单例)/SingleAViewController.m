//
//  SingleAViewController.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import "SingleAViewController.h"
#import "AppDelegate.h"
#import "UENSingleTon.h"
#import "SingleBViewController.h"

@interface SingleAViewController ()

@end

@implementation SingleAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"SingleA";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    /*
     * 需要先对单例进行初始化, 再进行赋值.
     */
    
    UENSingleTon *uens = [UENSingleTon sharedUENSingleTon];
    uens.nameStr = @"明师傅";
    uens.sexxStr = @"性别男";
    
    //[UENSingleTon sharedXTGSingleTon].nameStr = @"明师傅";
    //[UENSingleTon sharedXTGSingleTon].sexxStr = @"性别男";
    
    
    
    // 获取应用程序的单例对象
    UIApplication *app = [UIApplication sharedApplication];
    // 获取应用程序的单例对象的代理对象
    AppDelegate *delegate = (AppDelegate *)app.delegate;
    
    delegate.appDelegateStr1 = @"XTGDEmoOne"; // 开始赋值
    delegate.appDelegateStr2 = @"XTGDEmoTwo"; // 开始赋值
    
    
    SingleBViewController *bvc = [[SingleBViewController alloc] init];
    [self.navigationController pushViewController:bvc animated:YES];
    
}

@end
