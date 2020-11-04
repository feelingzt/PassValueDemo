//
//  OtherWayBViewController.h
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import <UIKit/UIKit.h>

@interface OtherWayBViewController : UIViewController

@property(nonatomic,strong)NSString *userName;//属性传值
@property(nonatomic,strong)NSString *passWord;//属性传值

-(id)initWithUserName:(NSString *)userName WithPassWord:(NSString *)passWord;//初始化传值

@end

