//
//  JHTopSlideInputVC.h
//  JHKit
//
//  Created by HaoCold on 2017/8/16.
//  Copyright © 2017年 HaoCold. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHTopSlideInputVC : UIViewController
@property (copy,    nonatomic) void (^finishInputBlock)(NSString *text);

- (void)jh_showIn:(UIViewController *)vc;

@end
