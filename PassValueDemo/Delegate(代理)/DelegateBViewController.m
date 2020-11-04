//
//  DelegateBViewController.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import "DelegateBViewController.h"

@interface DelegateBViewController ()

@end

@implementation DelegateBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    /*
     判断self.delegate要调用协议中的方法是否存在，判断用respondsToSelector这个方法；
     因为.h里的协议继承了NSObject，而-(BOOL)respondsToSelector:(SEL)aSelector是NSObject里的方法，所以可以用这个方法。
     */
    if ([self.delegate respondsToSelector:@selector(sendValue:)]) {
        [self.delegate sendValue:@"代理456"];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
