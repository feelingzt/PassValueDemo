//
//  TeacherModel.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import "TeacherModel.h"

@implementation TeacherModel

// 需遵守协议并实现协议里的方法;
- (void)receiveHomeWork:(NSString *)str {
    self.receiveData = str; //完成收取Student的作业;
}

@end
