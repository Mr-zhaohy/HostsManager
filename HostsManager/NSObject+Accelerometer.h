//
//  UIViewController+Accelerometer.h
//  HostsChangeDemo
//
//  Created by Mr_zhaohy on 2017/11/13.
//  Copyright © 2017年 Mr_zhaohy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CMMotionManager.h>

@interface NSObject (Accelerometer)

/**
 激活速度传感器

 @param accelerameter 触发阈值
 @param callBack 回调
 */
-(void)startAccelerometer:(CGFloat)accelerameter withHandel:(void (^)(BOOL active))callBack;

/**
 停止速度传感器检测
 */
-(void)stopAccelerometer;

@end
