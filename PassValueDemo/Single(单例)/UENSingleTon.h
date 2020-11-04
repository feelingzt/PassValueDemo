//
//  UENSingleTon.h
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import <Foundation/Foundation.h>

@interface UENSingleTon : NSObject

// 声明一个+方法也就是一个类方法
+ (UENSingleTon *)sharedUENSingleTon;

// 声明属性(用于传值或存值)
@property (nonatomic, copy) NSString *nameStr;
@property (nonatomic, copy) NSString *sexxStr;

@end

