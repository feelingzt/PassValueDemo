//
//  KVOCaseThreeViewController.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import "KVOCaseThreeViewController.h"

//什么情况下用到自动提示宏
//逗号表达式:只取逗号最右边的值  (void)表示我不用你;
//宏里面的#   会自动把后面的参数变成C语言的字符串(就是相当于给右边的标识符keyPath加上双引号""，变成了C语言字符串)
//宏里面的@() 把c语言字符串转为oc字符串
//宏的操作原理，每输入一个字母就会直接把宏右边的拷贝，并且会自动补齐前面的内容。
#define keyPath(objc,keyPath) @(((void)objc.keyPath,#keyPath))


@interface KVOCaseThreeViewController ()


@property(nonatomic,weak)UIView *mainView;
@property(nonatomic,weak)UIView *leftView;
@property(nonatomic,weak)UIView *rightView;

@end

@implementation KVOCaseThreeViewController

-(void)panGestureAction:(UIPanGestureRecognizer *)pan
{
    //获取平移手势的移动位置
    //translationInView:获取到的是手指移动后，在相对坐标中的偏移量
    CGPoint transPan = [pan translationInView:self.view];
    
    // 获取x轴的偏移量
    CGFloat offsetX = transPan.x;
    
    // 修改mainV的Frame
    self.mainView.frame = [self frameWithOffsetX:offsetX];
    
    //复位
    [pan setTranslation:CGPointZero inView:self.view];
}

- (CGRect)frameWithOffsetX:(CGFloat)offsetX
{
    CGRect frame = self.mainView.frame;
    frame.origin.x += offsetX;
    return frame;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*逗号表达式
     只取逗号最右边的值;
     (void)表示我不用你;
     */
    int a = ((void)5,(void)2,1);
    NSLog(@"%d", a);
    
    //如何把c语言字符串转为oc字符串
    char *c = "abc";
    NSLog(@"%@", [@(c) class]);
    
    
    
    // 创建三个mainView(红色)、leftView(绿色)、rightView(蓝色)，三个视图(控件)的大小和控制器自带的view的大小一样
    // 实现抽屉效果mainView往左移动可以显示leftView，往右移动可以显示rightView
    
    UIView *leftView = [[UIView alloc]initWithFrame:self.view.bounds];
    leftView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:leftView];
    
    UIView *rightView = [[UIView alloc]initWithFrame:self.view.bounds];
    rightView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:rightView];
    
    UIView *mainView = [[UIView alloc]initWithFrame:self.view.bounds];
    mainView.backgroundColor = [UIColor redColor];
    [self.view addSubview:mainView];
    
    self.leftView = leftView;
    self.rightView = rightView;
    self.mainView = mainView;
    
    // 添加Pan平移手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureAction:)];
    [self.view addGestureRecognizer:panGesture];
    
    /*
     iOS观察者模式是什么:
     观察者模式定义了一种一对多的依赖关系，让多个观察者对象同时监听某一个主题对象。
     这个主题对象在状态上发生变化时，会通知所有观察者对象，使它们能够自动更新自己。
     简而言之，就是A和B，A对B的变化感兴趣，A就注册为B的观察者，当B发生变化时通知A，告知B发生了变化。这个也叫做经典观察者模式。
     
     在iOS中观察者模式的实现有两种方法: Notification KVO
     */
    
    /*利用KVO时刻监听mainV的frame属性,但是这里采取KVO并不好，KVO是时刻监听的,很耗性能
     addObserver:观察者，谁想监听
     forKeyPath:监听属性
     options: 监听新值得改变
     */
    [self.mainView addObserver:self forKeyPath:keyPath(self.mainView, frame) options:NSKeyValueObservingOptionNew context:nil];
    NSLog(@"%@",keyPath(self.mainView, frame));// 结果为: @"frame"
}

// 只要监听的属性一改变，就会调用观察者的这个方法，通知你有新值
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"%@", NSStringFromCGRect(self.mainView.frame));
    if (self.mainView.frame.origin.x > 0) {
        self.rightView.hidden = YES;
    }else if(self.mainView.frame.origin.x < 0){
        self.rightView.hidden = NO;
    }
}

/*
 在对象被销毁的时候，一定要注意移除观察者
 和通知中心很像
 */
-(void)dealloc
{
    [self.mainView removeObserver:self forKeyPath:@"frame"];
}



@end
