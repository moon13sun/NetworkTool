//
//  NetworkTool.m
//  DoctorOnline
//
//  Created by leergou on 16/7/5.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

#import "NetworkTool.h"

@implementation NetworkTool



/** 单例 实例化 */
+ (instancetype)shareManager{
    
    static NetworkTool *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        //1.实例化
        instance = [[NetworkTool alloc] initWithSessionConfiguration:configuration];
        
        //2.可接受格式
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
        
        //3.请求格式（默认：二进制）
        instance.requestSerializer = [AFJSONRequestSerializer serializer];
        
        //4.超时
        instance.requestSerializer.timeoutInterval = 10.0;
        
    });
    
    return instance;
}

/** 自定义的 GET 请求 */
- (void)GET_RequestWithUrlString:(NSString *)urlString
                          parmas:(NSDictionary *)params
                   successBloock:(SuccessCompletedBlock)success
                    failureBlock:(FailureCompletedBlock)failure{
    
    [[NetworkTool shareManager] GET:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
}

/** 自定义的 POST 请求 */
- (void)POST_RequestWithUrlString:(NSString *)urlString
                           parmas:(NSDictionary *)params
                    successBloock:(SuccessCompletedBlock)success
                     failureBlock:(FailureCompletedBlock)failure{
    
    [[NetworkTool shareManager] POST:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
}


@end
