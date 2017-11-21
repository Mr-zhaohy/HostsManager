//
//  UIViewController+Accelerometer.m
//  HostsChangeDemo
//
//  Created by Mr_zhaohy on 2017/11/13.
//  Copyright © 2017年 Mr_zhaohy. All rights reserved.
//

#import "NSObject+Accelerometer.h"
#import "CustomHostsView.h"
#import <objc/runtime.h>

static char *kManagerObj;

@interface NSObject ()
@property (nonatomic,strong)CMMotionManager *manager;
@end

@implementation NSObject (Accelerometer)

/* 系统摇一摇功能
-(void)activateAccelerometer{
//    [UIApplication sharedApplication].applicationSupportsShakeToEdit = YES;
//    [self becomeFirstResponder];
}
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
//    [[[CustomHostsView alloc]init] show];
}
-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    
}
 */

-(void)startAccelerometer:(CGFloat)accelerameter withHandel:(void (^)(BOOL))callBack
{
    if (!self.manager) {
        self.manager = [[CMMotionManager alloc] init];//一般在viewDidLoad中进行
        self.manager.accelerometerUpdateInterval = 0.2f;//加速仪更新频率，以秒为单位
    }
    //以push的方式更新并在block中接收加速度
    [self.manager startAccelerometerUpdatesToQueue:[[NSOperationQueue alloc]init]
                                             withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
                                                 [self outputAccelertionData:accelerometerData.acceleration accelerometer:accelerameter block:callBack];
                                                 if (error) {
                                                     NSLog(@"motion error:%@",error);
                                                     callBack(NO);
                                                 }
                                             }];
}
-(void)outputAccelertionData:(CMAcceleration)acceleration accelerometer:(CGFloat)acc  block:(void (^)(BOOL))callBack{
    //综合3个方向的加速度
    double accelerameter =sqrt(pow( acceleration.x , 2 ) + pow( acceleration.y , 2 )
                               + pow( acceleration.z , 2) );
    //当综合加速度大于4.0时，就激活效果（此数值根据需求可以调整，数据越小，用户摇动的动作就越小，越容易激活，反之加大难度，但不容易误触发）
    if (accelerameter>acc) {
        //立即停止更新加速仪（很重要！）
        [self stopAccelerometer];
        dispatch_async(dispatch_get_main_queue(), ^{
            //UI线程必须在此block内执行，例如摇一摇动画、UIAlertView之类
            callBack(YES);
        });
    }
}
-(void)stopAccelerometer{
    [self.manager stopAccelerometerUpdates];
}
-(CMMotionManager *)manager{
    return objc_getAssociatedObject(self, kManagerObj);
}
-(void)setManager:(CMMotionManager *)manager{
    objc_setAssociatedObject(self, kManagerObj, manager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
