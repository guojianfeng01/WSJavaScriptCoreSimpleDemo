//
//  WSOC_JSVC.m
//  WSJsDemo
//
//  Created by guojianfeng on 16/11/30.
//  Copyright © 2016年 guojianfeng. All rights reserved.
//

#import "WSOC_JSVC.h"
#import "WSPerson.h"
@interface WSOC_JSVC ()<UIWebViewDelegate>
@property(nonatomic,weak) UIWebView * webView;
@property(nonatomic,strong) JSContext * jsContext;
@property(nonatomic,strong) JSManagedValue * managedValue;
@end

@implementation WSOC_JSVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    webView.delegate =self;
    webView.scrollView.bounces = NO;
    [self.view addSubview:webView];
    self.webView = webView;
    
    NSURL * jsFileUrl = [[NSBundle mainBundle] URLForResource:@"jsOCTest.html" withExtension:nil];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:jsFileUrl];
    [self.webView loadRequest:request];
    // Do any additional setup after loading the view.
}


-(void)webViewDidFinishLoad:(UIWebView *)webView{
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exception) {
        NSLog(@"%@", exception);
        context.exception = exception;
    };
    // 错误测试
    [self.jsContext evaluateScript:@"nibaba();"];
    
    WSPerson *jsObject = [[WSPerson alloc]init];
    self.jsContext[@"boy"] = jsObject;
    self.jsContext[@"Person"] = [WSPerson class];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString * str = request.URL.absoluteString;
    NSLog(@"%@", str);
    
    // 当点击首页(上面被我们改成了~"嘻嘻")时我们弹出一个VC
    NSRange range = [str rangeOfString:@"h5/index?h5=1"];
    if (range.location != NSNotFound) {
        [self popToViewController];
    }
    
    return YES;
}

- (void)popToViewController
{
    UIViewController * vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor purpleColor];
    
    [self presentViewController:vc animated:YES completion:nil];
}

@end
