//
//  StudentModel.h
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import <Foundation/Foundation.h>
#import "UENProtocol.h"

@interface StudentModel : NSObject

/*
 * 声明代理属性
 * delegate就是一个遵从协议的id指针;
 * 那么该指针变量只能指向遵从相同协议的对象;
 */
@property (nonatomic, weak) id <UENProtocol> delegate;

-(void)sendHomeWorkToTeacher;

@end

