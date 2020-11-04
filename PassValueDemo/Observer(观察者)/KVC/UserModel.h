//
//  UserModel.h
//  KVC和KVO
//
//  Created by uen on 2017/7/19.
//  Copyright © 2017年 UEN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
{
    NSString *_testStr;
}
-(void)setTestStr:(NSString *)testStr;
-(NSString *)testStr;

@end
