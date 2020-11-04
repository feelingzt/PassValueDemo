//
//  BlockBViewController.h
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import <UIKit/UIKit.h>

// 定义Block
typedef void (^NameOneBlock)(NSString *str);

@interface BlockBViewController : UIViewController

// Block属性
@property (nonatomic, copy) NameOneBlock  oneBlock;

// Block属性
@property (nonatomic, copy) dispatch_block_t twoBlock;


@end


/*
 Block传值写法:
 准备: 先确定谁是主动, 谁是被动(基本理解主动方就是主动提供数据, 被动方是想使用主动方提供的数据);
 当前案例, BlockBViewController是主动(提供数据), BlockAViewController是被动(使用主动提供的数据);
 1.在主动里面：定义Block的类型；
 2.在主动里面：定义一个copy修饰、1中类型的属性(Block)；
 3.在主动里面：调用Block提供数据；
 4.在被动里面：实现Block使用主动方提供的数据；
 
 注意:
 1.要把被动实现的Block赋值给主动的属性;
 2.为了规避强强引用，Block的代码块中尽量不要出现强引用指针;
 3.实现Block中，最好让Block中的代码在被动方不持有强引用指针;
 */


/*
 * 定义Block
 * Block名称(NameOneBlock)
 * Block无返回值(void)
 * Block不传参数(void)
 * Block传入一个参数(NSString *str)
 * Block传入多个参数用逗号分隔(NSString *str1, NSString *str2)
 
 * 备注说明:
 * 无参数和返回值可以使用更高效的 dispatch_block_t
 * 无参数和返回值可以当作点击事件的传递;
 */


/*
 * Block属性
 * 声明一个oneBlock对象, 注意对象属性设置为copy, 接到block参数时, 便会自动复制一份;
 > Block用copy修饰, 因为Block的代码是在栈里的, 需要拷贝到堆里之后才能用;
 > 但是用strong也是没有关系的, 系统会自动帮你转成copy(也就是意味着必须得用copy);
 
 * 备注说明:
 * 也可以像下面这样写，直接用NameOneBlock代替block
 * @property (nonatomic, copy) void (^NameOneBlock)(NSString *str);
 */
