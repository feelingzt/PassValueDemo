//
//  TeacherModel.h
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import <Foundation/Foundation.h>
#import "UENProtocol.h"

@interface TeacherModel : NSObject <UENProtocol>

// 保存Teacher收到的作业数据
@property (nonatomic, copy) NSString *receiveData;

@end

