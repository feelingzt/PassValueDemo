//
//  BlockAViewController.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import "BlockAViewController.h"
#import "BlockBViewController.h"

@interface BlockAViewController ()

@end

@implementation BlockAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Block123";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    BlockBViewController *bvc = [[BlockBViewController alloc] init];
    
    //定义弱引用类型的self
    __weak typeof(self) weakSelf = self;
    bvc.oneBlock = ^(NSString *str) {
       
        //使用主动方提供的数据：直接完成传值的形式
        weakSelf.navigationItem.title = str;
        
        //使用主动方提供的数据：抽取方法的形式
        //[weakSelf changeNavigationItem:str];
    };
    
    bvc.twoBlock = ^{
        NSLog(@"....");
    };
    
    [self.navigationController pushViewController:bvc animated:YES];
}

- (void)changeNavigationItem:(NSString *)title{
    self.navigationItem.title = title;
}


@end
