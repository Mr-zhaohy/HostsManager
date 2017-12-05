//
//  HostsManager.h
//  HostsChangeDemo
//
//  Created by Mr_zhaohy on 2017/11/9.
//  Copyright © 2017年 Mr_zhaohy. All rights reserved.
//

#import <Foundation/Foundation.h>
#define HostsUrl @"url"
#define DefaultHosts @"default"

@interface HostsManager : NSObject

/**
 当前设置的url
 */
@property (nonatomic,copy,readonly) NSString *currentHostsUrl;

/**
 列出所有的url
 */
@property (nonatomic,copy,readonly) NSArray *hostsArray;

/**
 创建单例类

 @return HostsManager单例
 */
+ (instancetype)shared;

/**
 添加url

 @param url 新增的url
 @param isDefault 是否设置为默认
 */
- (void)addHostsUrl:(NSString *)url default:(BOOL)isDefault;

/**
 删除指定url

 @param url 要删除的url
 */
- (void)removeHostsUrl:(NSString *)url;
@end
