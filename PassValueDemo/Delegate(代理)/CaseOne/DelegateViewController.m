//
//  DelegateViewController.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import "DelegateViewController.h"
#import "TeacherModel.h"
#import "StudentModel.h"

@interface DelegateViewController ()

@end

@implementation DelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     * 案例
     * Student是主动方需要提供作业数据；
     * Teacher是被动方需要使用(查看审阅)Student的作业数据；
     */
    
    
    TeacherModel *LiuTeacher = [[TeacherModel alloc] init];
    
    StudentModel *XiaoMingStudent = [[StudentModel alloc] init];
    
    /*
     * 代理人设为LiuTeacher;
     * LiuTeacher需遵守协议并实现协议里的方法;
     */
    XiaoMingStudent.delegate = LiuTeacher;
    
    
    // XiaoMingStudent开始发送作业给LiuTeacher
    [XiaoMingStudent sendHomeWorkToTeacher];
    
    // 打印LiuTeacher收到的作业数据
    NSLog(@"LiuTeacher收到的XiaoMingStudent的作业：%@", LiuTeacher.receiveData);
    
}


@end
