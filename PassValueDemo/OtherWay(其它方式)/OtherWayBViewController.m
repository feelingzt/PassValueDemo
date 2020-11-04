//
//  OtherWayBViewController.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import "OtherWayBViewController.h"

@interface OtherWayBViewController ()

@end

@implementation OtherWayBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"~~~ %@", self.userName);
    NSLog(@"~~~ %@", self.passWord);
    
    /*==== NSUserDefaults取值 ====*/
    NSLog(@"=== %@", [[NSUserDefaults standardUserDefaults]objectForKey:@"UserName"]);
    NSLog(@"=== %@", [[NSUserDefaults standardUserDefaults]objectForKey:@"PassWord"]);
    /*==== NSUserDefaults取值 ====*/
}

-(id)initWithUserName:(NSString *)userName WithPassWord:(NSString *)passWord{
    self = [super init];
    if (self) {
        NSLog(@"来自OtherWayAViewController的数据：%@", userName);
        NSLog(@"来自OtherWayAViewController的数据：%@", passWord);
    }
    return self;;
}


@end
