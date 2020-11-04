//
//  NotificationCenterBVController.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import "NotificationCenterBVController.h"

@interface NotificationCenterBVController ()

@end

@implementation NotificationCenterBVController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    /*
     * 通知中心
     * 整个工程有且只有一个通知中心: 单例
     * 通知中心: [NSNotificationCenter defaultCenter]
     * 发送通知：postNotificationName:(NSString *) object:(id)]
     */

    /*
     * 通知名字
     * 不传参数(nil)
     */
    [[NSNotificationCenter defaultCenter] postNotificationName:@"nameone"
                                                        object:nil];
    
    /*
     * 通知名字
     * 传入参数(id任意类型) //字符串
     */
    [[NSNotificationCenter defaultCenter] postNotificationName:@"nametwo"
                                                        object:@"123456"];
    
    /*
     * 通知名字
     * 传入参数(id任意类型) //数组
     */
    [[NSNotificationCenter defaultCenter] postNotificationName:@"namethree"
                                                        object:@[@"账号123456", @"密码123456"]];
    
    /*
     * 通知名字
     * 传入参数(id任意类型) 
     * 携带较大的数据(字典类型)
     */
    [[NSNotificationCenter defaultCenter] postNotificationName:@"namefour"
                                                        object:@"123456"
                                                      userInfo:@{@"账号":@"123456", @"密码":@"123456"}];
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
