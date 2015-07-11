//
//  YMBrowser.m
//  YMBrowseIphone
//
//  Created by barryclass on 15/7/11.
//  Copyright (c) 2015年 barry. All rights reserved.
//

#import "YMBrowser.h"
#import "DDLog.h"
#import "DDTTYLogger.h"
static const int ddLogLevel = LOG_LEVEL_VERBOSE;

@implementation YMBrowser

+ (id)shareInstance {
    static dispatch_once_t once;
    static YMBrowser *browse;
    dispatch_once(&once, ^{
        browse = [[YMBrowser alloc] init];
        [browse initInstance];
    });
    return browse;
}
- (void)initInstance {
    [DDLog  addLogger:[DDTTYLogger sharedInstance]];
    self.httpServer = [[HTTPServer alloc] init];
    [self.httpServer setType:@"_http._tcp."];
    self.httpServer.port = 8888;
    [self.httpServer setConnectionClass:[YMConnection class]];
    NSString *webPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Web"];
    DDLogInfo(@"Setting document root: %@", webPath);
    [_httpServer setDocumentRoot:webPath];
    self.searchDocumentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject];

}

- (void)start {
    NSError *error;
    [_httpServer start:&error];
    if (error) {
        DDLogInfo(@"Server start success");
    } else {
        DDLogInfo(@"Server start Fail");
    }
}

@end
