//
//  UENSingleTon.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import "UENSingleTon.h"

static UENSingleTon *singleTon = nil;

@implementation UENSingleTon

+ (UENSingleTon *)sharedUENSingleTon {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!singleTon) { //只执行1次的代码(这里面默认是线程安全的)
            singleTon = [[UENSingleTon alloc] init];
        }
    });
    return singleTon;
}

@end
