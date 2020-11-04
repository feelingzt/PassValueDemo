//
//  KVCCaseViewController.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import "KVCCaseViewController.h"
#import "StuModel.h"

@interface KVCCaseViewController ()

@end

@implementation KVCCaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
     KVC -- key-value-coding -- 键值编码
     KVC是一种赋值方式，其中点语法是一种特殊的KVC 点语法是给model属性赋值的一种方式;
     
     setValue:forKey:根据key的值来写对象的属性
     赋值顺序：
     1.先查找set方法：-(void)setName:(NSString *)name如果有就赋值;
     2.没有就查找_name的属性，有就赋值;
     3.没有就查找name的属性，有就赋值;
     4.没有就调用类中的setValue:forUndefinedKey://如果还没有这个方法，程序就会崩溃.
     
     valueForKey: 根据key的值读取对象的属性
     读取顺序：
     1.先查找get方法：-(NSString *)name 如果有就取值;
     2.没有就查找_name的属性，有就取值;
     3.没有就查找name的属性，有就取值;
     4.没有就调用类中的valueForUndefinedKey://如果还没有这个方法，程序就会崩溃.
     
     */
    
    StuModel *stumodel = [[StuModel alloc]init];
    
    stumodel.name = @"小明";
    NSLog(@"name:%@", stumodel.name);
    [stumodel setValue:@"小张" forKey:@"name"];
    NSLog(@"name:%@", [stumodel valueForKey:@"name"]);
    
    //验证protect类型的属性可以被修改值
    [stumodel setValue:@"27" forKey:@"age"];
    NSLog(@"age:%@",[stumodel valueForKey:@"age"]);
    
    //验证了私有类型可以被访问
    [stumodel setValue:@"100" forKey:@"weight"];
    NSLog(@"weigth:%@", [stumodel valueForKey:@"weight"]);
    
    //验证了私有类型可以被访问，key="height"会找到_height的属性
    [stumodel setValue:@"162" forKey:@"height"];
    NSLog(@"height:%@",[stumodel valueForKey:@"height"]);
    
    
    /*
     根据字典中的key值，给model的属性挨个赋值
     1.字典中的key尽量和model的属性名一致;
     2.一定要在model中重写setValue:forUndefinedKey:方法;
     */
    NSDictionary *dic = @{@"name":@"dst",@"age":@"18",@"height":@"188",@"weight":@"88"};
    StuModel *tempStuModel = [[StuModel alloc] init];
    [tempStuModel setValuesForKeysWithDictionary:dic];
    
    NSLog(@"--%@",[tempStuModel valueForKey:@"name"]);
    NSLog(@"--%@",[tempStuModel valueForKey:@"age"]);
    NSLog(@"--%@",[tempStuModel valueForKey:@"weight"]);
    NSLog(@"--%@",[tempStuModel valueForKey:@"height"]);
    
}



@end
