//
//  CTPerson.h
//  WSJsDemo
//
//  Created by guojianfeng on 16/12/2.
//  Copyright © 2016年 guojianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol WSPersonProrocol <JSExport>
- (void)jsCallWithString:(NSString *)string;
@end


@interface WSPerson : NSObject<WSPersonProrocol>
- (void)jsCallWithString:(NSString *)string;
@end
