//
//  KVOCaseOneViewController.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import "KVOCaseOneViewController.h"
#import "TestModel.h"

#define KeyPath(objc,keypath) @(((void)objc.keypath,#keypath))

@interface KVOCaseOneViewController ()

@end

@implementation KVOCaseOneViewController{
    TestModel *model;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 100, self.view.frame.size.width-20, 30);
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"让model.name发生变化" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 1000;
    [self.view addSubview:button];
    
    
    model = [[TestModel alloc]init];
    model.name = @"妹子";
    
    /*KVO(key-value-observer) 键值观察 用来观察属性值的变化（是使用KVC来修改值）
     第一个参数：观察者
     第二个参数：观察的是stu的那个key
     第三个参数：观察的是key的什么，NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld 观察key的值变化
     第四个参数：可以用来做标示，一般就写nil
     
     让self去观察model的name属性，当值发生变化的时候，就让self去调用observeValueForKeyPath:ofObject:change:context:做处理
     */
    [model addObserver:self forKeyPath:KeyPath(model, name) options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

-(void)buttonClick:(UIButton *)btn
{
    if (btn.tag == 1000) {
        model.name = @"刘亦菲";
    }
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
    if (model) {
        [model removeObserver:self forKeyPath:KeyPath(model, name) context:nil];
    }
}




@end
