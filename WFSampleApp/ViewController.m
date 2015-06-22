//
//  ViewController.m
//  WFSampleApp
//
//  Created by FumikoIshizawa on 2015/06/21.
//  Copyright (c) 2015年 FumikoIshiawa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
  WFViewController *wfViewController = [[WFViewController alloc] initWithURL:@"http://google.com"
                                                                    formName:@"q"
                                                             formDescription:@"hogehoge"];
  [wfViewController enableBackButton:YES];
  [self presentViewController:wfViewController
                     animated:YES
                   completion:^{
                     NSLog(@"Web View is opened!");
                   }];

}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
