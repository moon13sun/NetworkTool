//
//  NetworkTool.h
//  DoctorOnline
//
//  Created by leergou on 16/7/5.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface NetworkTool : AFHTTPSessionManager

/** 成功回调 */
typedef void(^SuccessCompletedBlock)(id responseObject);

/** 失败回调 */
typedef void(^FailureCompletedBlock)(NSError *error);


/** 单例 实例化 */
+ (instancetype)shareManager;

/** 自定义的 GET 请求 */
- (void)GET_RequestWithUrlString:(NSString *)urlString
                          parmas:(NSDictionary *)params
                   successBloock:(SuccessCompletedBlock)success
                    failureBlock:(FailureCompletedBlock)failure;


/** 自定义的 POST 请求 */
- (void)POST_RequestWithUrlString:(NSString *)urlString
                           parmas:(NSDictionary *)params
                    successBloock:(SuccessCompletedBlock)success
                     failureBlock:(FailureCompletedBlock)failure;


@end
