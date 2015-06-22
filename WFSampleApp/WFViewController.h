//
//  WFViewController.h
//  WFSampleApp
//
//  Created by FumikoIshizawa on 2015/06/21.
//  Copyright (c) 2015年 FumikoIshiawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFViewController : UIViewController <UIWebViewDelegate>

// name: フォームの名前を指定
// description: フォームに入力したい内容
- (id)initWithURL:(NSString *)url
         formName:(NSString *)name
  formDescription:(NSString *)description;
- (void)enableBackButton:(BOOL)enable;

@property (nonatomic) NSURL *webUrl;
@property (nonatomic) NSString *formName;
@property (nonatomic) NSString *formDescription;

@end
