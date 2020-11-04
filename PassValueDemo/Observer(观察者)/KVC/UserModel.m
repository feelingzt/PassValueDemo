//
//  UserModel.m
//  KVC和KVO
//
//  Created by uen on 2017/7/19.
//  Copyright © 2017年 UEN. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

-(void)setTestStr:(NSString *)testStr {
    _testStr = testStr;
}

-(NSString *)testStr {
    return _testStr;
}

@end
