//
//  KVOCaseTwoViewController.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import "KVOCaseTwoViewController.h"

#define KeyPath(objc,keypath) @(((void)objc.keypath,#keypath))

@interface KVOCaseTwoViewController ()

@end

@implementation KVOCaseTwoViewController{
    UIButton *button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /************ 对于按钮点击变化状态的的监控 ************/
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 100, self.view.frame.size.width-20, 30);
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"测试Normal" forState:UIControlStateNormal];
    [button setTitle:@"测试Highlighted" forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    /*KVO(key-value-observer) 键值观察 用来观察属性值的变化（是使用KVC来修改值）
     第一个参数：观察者
     第二个参数：观察的是stu的那个key
     第三个参数：观察的是key的什么，NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld 观察key的值变化
     第四个参数：可以用来做标示，一般就写nil
     
     让self去观察button的highlighted属性，当值发生变化的时候，就让self去调用observeValueForKeyPath:ofObject:change:context:做处理
     对于系统是根据KeyPath去取的到相应的值发生改变，理论上来说是和KVC机制的道理是一样的。
     */
    [button addObserver:self forKeyPath:KeyPath(button, highlighted) options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

-(void)buttonClick:(UIButton *)btn
{
    NSLog(@"nothing to do");
}


/**
 @param keyPath 被观察的key
 @param object  被观察的对象
 @param change  数值的新旧内容,取决于定义观察者时的选项(change是一个字典，字典里面有"new"key代表新值，“old”key代表旧值)
 @param context 对应上面的context
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"%@",object);
    NSLog(@"%@",change);
    NSLog(@"%@",change[@"kind"]);
    NSLog(@"%@",change[@"new"]);
    NSLog(@"%@",change[@"old"]);
}

// dealloc中移除观察者
-(void)dealloc
{
    //第一个参数：观察者
    //第二个参数：被观察的key
    //第三个参数：对应上面的context
    [button removeObserver:self forKeyPath:KeyPath(button, highlighted) context:nil];
}



@end
