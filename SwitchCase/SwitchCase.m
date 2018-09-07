//
//  SwitchCase.m
//  SwitchCase
//
//  Created by Liu on 2018/9/7.
//  Copyright © 2018年 mzying.com. All rights reserved.
//

#import "SwitchCase.h"

@interface SwitchCase(){
    //测试全局变量
    NSNumber * _number;
    NSUInteger _age;
}

//测试全局属性
@property (nonatomic,strong) NSDate * date;

@end



@implementation SwitchCase


-(instancetype)init{
    self = [super init];
    
    if (self) {
        
        _number = @(100);
        _date = [NSDate date];
        
        switch (_age) {
            case 0:
                //单行引用全局变量：OK
                _number = @(_age+1);
                break;
                
            case 10:
                //多行引用全局变量：OK
                if (_number.integerValue > 100) {
                    _number = @(_age+2);
                }else{
                    _number = @(_age+1);
                }
                break;
                
            case 100:
                //多行引用全局变量 + 属性变量：OK
                if ([_date earlierDate:[NSDate date]]) {
                    _number = @(_age + 3);
                }else{
                    _number = @(_age + 4);
                }
                break;
                
            case 1000:
                //多行引用全局变量 + 属性：OK
                if ([self.date earlierDate:[NSDate date]]) {
                    _number = @(_age + 3);
                }else{
                    _number = @(_age + 4);
                }
                break;
                
                
            case 10000:{
                //多行引用全局变量 + 属性 + 局部变量：Error
                NSDate * _compareDate = [NSDate date];
                if ([self.date earlierDate:_compareDate]) {
                    _number = @(_age + 3);
                }else{
                    _number = @(_age + 4);
                }
            }
                break;
                
            default:
                break;
        }
        
    }
    
    return self;
}


@end
