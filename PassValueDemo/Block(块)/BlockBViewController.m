//
//  BlockBViewController.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import "BlockBViewController.h"

@interface BlockBViewController ()

@end

@implementation BlockBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (self.oneBlock) {
        self.oneBlock(@"Block456");
    }
    
    !_twoBlock ? : _twoBlock();
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
