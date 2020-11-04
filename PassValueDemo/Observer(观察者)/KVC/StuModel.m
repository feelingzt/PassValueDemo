//
//  StuModel.m
//  KVC
//
//  Created by uen on 2018/12/3.
//  Copyright © 2018 TT. All rights reserved.
//

#import "StuModel.h"

@implementation StuModel
{
    NSString *weight;
    NSString *_height;
}


// 使用KVC的时候一定要写此方法

// 在使用KVC赋值的时候，当key没有找到 set方法 _属性 属性 的时候会调用这个方法
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%@", key);
}

//在使用KVC取值的时候，当key没有找到 get方法 _属性 属性 的时候会调用这个方法
-(id)valueForUndefinedKey:(NSString *)key
{
    return key;
}

@end
