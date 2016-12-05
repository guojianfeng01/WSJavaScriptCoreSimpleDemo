//
//  ViewController.m
//  WSJsDemo
//
//  Created by guojianfeng on 16/11/30.
//  Copyright © 2016年 guojianfeng. All rights reserved.
//

#import "ViewController.h"
#import "WSOC_JSVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *locationButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 64, 100, 44)];
    [self.view addSubview:locationButton];
    locationButton.backgroundColor = [UIColor redColor];
    [locationButton setTitle:@"location" forState:UIControlStateNormal];
    [locationButton addTarget:self action:@selector(locationButtonClick) forControlEvents:UIControlEventTouchUpInside];
}


-(void)locationButtonClick{
    WSOC_JSVC *vc = [[WSOC_JSVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
