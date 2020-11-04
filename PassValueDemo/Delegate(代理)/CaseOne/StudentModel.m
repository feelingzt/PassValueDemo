//
//  StudentModel.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import "StudentModel.h"

@implementation StudentModel

-(void)sendHomeWorkToTeacher {
    NSString *homeWorkStr = @"我的作业";
    [self.delegate receiveHomeWork:homeWorkStr];
}

@end
