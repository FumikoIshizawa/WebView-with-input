//
//  WFViewController.m
//  WFSampleApp
//
//  Created by FumikoIshizawa on 2015/06/21.
//  Copyright (c) 2015年 FumikoIshiawa. All rights reserved.
//

#import "WFViewController.h"

@interface WFViewController () {
  UIWebView *_webView;
}

@end

@implementation WFViewController

@synthesize webUrl;
@synthesize formDescription;
@synthesize formName;

- (id)initWithURL:(NSString *)url
         formName:(NSString *)name
  formDescription:(NSString *)description {
  self = [super init];
  if (self) {
    self.webUrl = [NSURL URLWithString:url];
    self.formName = name;
    self.formDescription = description;
    
    _webView = [[UIWebView alloc] init];
    _webView.delegate = self;
    _webView.frame = CGRectMake(0,
                                0,
                                self.view.frame.size.width,
                                self.view.frame.size.height);
    [self.view addSubview:_webView];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.webUrl];
    [_webView loadRequest:request];
  }
  
  return self;
}

- (void)enableBackButton:(BOOL)enable {
  UIButton *inputButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  inputButton.frame = CGRectMake(20,
                                 40,
                                 50,
                                 40);
  [inputButton setTitle:@"Back"
               forState:UIControlStateNormal];
  [inputButton addTarget:self
                  action:@selector(buttonTapped:)
        forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:inputButton];
}

- (void)buttonTapped:(UIButton *)button {
  if (_webView.canGoBack) {
    [_webView goBack];
  } else {
    [self dismissViewControllerAnimated:YES
                             completion:^{
                               NSLog(@"Web View is disappeared!");
                             }];
  }
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
  [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
  [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
  
  NSMutableString *input =
      [NSMutableString stringWithString:@"form = document.getElementsByName(\""];
  [input appendString:self.formName];
  [input appendString:@"\");form.item(0).value = \""];
  [input appendString:self.formDescription];
  [input appendString:@"\""];
  [webView stringByEvaluatingJavaScriptFromString:input];
}

@end
