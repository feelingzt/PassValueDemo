//
//  NotificationCenterAVController.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import "NotificationCenterAVController.h"
#import "NotificationCenterBVController.h"

@interface NotificationCenterAVController ()

@end

@implementation NotificationCenterAVController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    // Do any additional setup after loading the view.
    
    /*
     * 接收通知
     * 第一个参数：接收通知的人(self)
     * 第二个参数：接收通知后所做的操作<方法不带参数或者带参数>
     * 第三个参数：通知名字
     * 第四个参数：携带参数(nil)
     * 通知中心的注意点：一个界面必须接收通知后，再发送的通知才能接收到 add－post
     */
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notification)
                                                 name:@"nameone"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notificationObjectStr:)
                                                 name:@"nametwo"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notificationObjectArray:)
                                                 name:@"namethree"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notificationUserInfo:)
                                                 name:@"namefour"
                                               object:nil];
}

- (void)notification {
    self.view.backgroundColor = [UIColor redColor];
}

- (void)notificationObjectStr:(NSNotification *)notif{
    // 获取通知所传入的参数
    NSString *str = (NSString *)[notif object];
    NSLog(@"%@", str);
}

- (void)notificationObjectArray:(NSNotification *)notif{
    // 获取通知所传入的参数
    NSArray *array=[[NSArray alloc]initWithArray:notif.object];
    NSLog(@"%@", array);
}

- (void)notificationUserInfo:(NSNotification *)notif{
    // 获取object参数
    NSString *str = (NSString *)[notif object];
    
    // 获取userInfo的内容
    NSDictionary *dic = [notif userInfo];
    
    NSLog(@"%@  %@", str, dic);
}

//使用完通知需要注销
- (void)dealloc{
    //注销通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"nameone" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"nametwo" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"namethree" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"namefour" object:nil];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NotificationCenterBVController *bvc = [[NotificationCenterBVController alloc] init];
    [self.navigationController pushViewController:bvc animated:YES];
}

@end
