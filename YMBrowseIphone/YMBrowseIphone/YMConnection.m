//
//  YMConnection.m
//  PracticeApplication
//
//  Created by barryclass on 15/7/11.
//  Copyright (c) 2015年 barry. All rights reserved.
//

#import "YMConnection.h"
#import "HTTPDynamicFileResponse.h"
@implementation YMConnection
- (NSObject<HTTPResponse> *)httpResponseForMethod:(NSString *)method URI:(NSString *)path {
    NSMutableString *string = [[NSMutableString alloc] init];

    if ([path isEqualToString:@"/showfiles"]) {
        NSFileManager *manager = [NSFileManager defaultManager];
        NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject];
        NSArray *array = [manager subpathsAtPath:docPath];
        for (NSString *name in array) {
            [string appendFormat:@"<li><a href = %@> document/%@ </a></li>",name, name];
        }
    }
    NSString *realPath = [self filePathForURI:@"index1.html" allowDirectory:YES];
    
  HTTPDynamicFileResponse  *response =  [[HTTPDynamicFileResponse alloc] initWithFilePath:realPath forConnection:self separator:@"%%"replacementDictionary :@{@"Documet":string, @"SysTime":@"2010-04-30 03:18:24" }];
    
    return response;

}

@end
