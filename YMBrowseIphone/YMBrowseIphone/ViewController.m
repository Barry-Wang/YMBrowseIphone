//
//  ViewController.m
//  YMBrowseIphone
//
//  Created by barryclass on 15/7/11.
//  Copyright (c) 2015年 barry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@",path);
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *array = @[@"nba",@"cba",@"cuba"];
    NSError *error;
    for (NSString *string in array) {
        
        NSString *docPath = [path stringByAppendingPathComponent:string];
        if (![manager fileExistsAtPath:docPath]) {
            [manager createDirectoryAtPath:docPath withIntermediateDirectories:YES attributes:nil error:&error];
            if (error) {
                NSLog(@"error = %@",error.description);
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
