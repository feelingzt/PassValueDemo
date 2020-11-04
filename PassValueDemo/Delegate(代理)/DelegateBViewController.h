//
//  DelegateBViewController.h
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import <UIKit/UIKit.h>

// 定义协议
@protocol BViewControllerDelegate <NSObject>

@optional

-(void)sendValue:(NSString *)value;

@end



@interface DelegateBViewController : UIViewController

// 代理属性
@property (nonatomic, weak) id<BViewControllerDelegate> delegate;

@end


/*
 协议&代理是一种设计模式其写法：
 准备：先确定谁是主动，谁是被动(基本理解主动方是主动提供数据，被动方是想使用主动方提供的数据)
      在这里DelegateBViewController是主动方提供数据，DelegateAViewController是被动方使用主动方提供的数据；
 
 1.在主动里面：定义协议；
 2.在主动里面：声明属性；定义一个 弱引用、id类型、遵从1中定义的协议 的属性(代理delegate)；
 3.在主动里面：让delegate属性去调用协议中的方法并传值。
 4.在被动里面：让被动遵从协议；
 5.在被动里面：将被动设置成主动的代理人；
 6.在被动里面：实现协议中的方法；
 注意：一定要让被动成为主动的代理--->设置代理人
 */

/*
 ≈
 ARC模式下: weak(weak比assign多了一个操作:指针指向的对象被销毁时,会帮你自动置为nil)、strong
 MRC模式下: retain、assign
 代理属性建议用weak而不用assign(防止循环引用)，避免强强引用；
 */
