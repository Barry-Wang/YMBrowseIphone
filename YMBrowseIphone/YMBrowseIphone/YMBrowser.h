//
//  YMBrowser.h
//  YMBrowseIphone
//
//  Created by barryclass on 15/7/11.
//  Copyright (c) 2015年 barry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPServer.h"
#import "HTTPConnection.h"
#import "YMConnection.h"

@interface YMBrowser : NSObject
@property (nonatomic, strong) HTTPServer *httpServer;
@property (nonatomic, strong) HTTPConnection *httpConnection;
@property (nonatomic, strong) NSString *searchDocumentPath;
+(id)shareInstance;
- (void)start;
@end
