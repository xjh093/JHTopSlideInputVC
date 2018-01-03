//
//  JHTopSlideInputVC.m
//  JHKit
//
//  Created by HaoCold on 2017/8/16.
//  Copyright © 2017年 HaoCold. All rights reserved.
//
//  MIT License
//
//  Copyright (c) 2017 xjh093
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "JHTopSlideInputVC.h"

@interface JHTopSlideInputVC ()
@property (strong,  nonatomic) UIView           *topView;
@property (strong,  nonatomic) UITextField      *textField;
@end

@implementation JHTopSlideInputVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self jh_setupViews];
}

- (void)jh_setupViews
{
    //灰色View
    UIView *grayView = [[UIView alloc] init];
    grayView.frame = self.view.bounds;
    grayView.backgroundColor = [UIColor blackColor];
    grayView.alpha = 0.2;
    [self.view addSubview:grayView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xx_hide)];
    [grayView addGestureRecognizer:tap];
    
    CGFloat W = [UIScreen mainScreen].bounds.size.width;
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, -100, W, 100);
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    _topView = view;
    
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(10, 25, W-20, 30);
    textField.placeholder = @"在此输入内容";
    textField.borderStyle = 3;
    textField.clearButtonMode = 3;
    [view addSubview:textField];
    _textField = textField;
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(textField.frame.origin.x, CGRectGetMaxY(textField.frame)+10, CGRectGetWidth(textField.frame), CGRectGetHeight(textField.frame));
    button.layer.cornerRadius = 5;
    button.layer.borderWidth = .5;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:@"确    定" forState:0];
    [button setTitleColor:[UIColor blackColor] forState:0];
    [button addTarget:self action:@selector(jh_hide:) forControlEvents:1<<6];
    [view addSubview:button];
}

- (void)jh_showIn:(UIViewController *)vc{
    
    [self xx_showIn:vc];
    
    [UIView animateWithDuration:0.25 animations:^{
        CGRect frame = _topView.frame;
        frame.origin.y = 0;
        _topView.frame = frame;
    } completion:^(BOOL finished) {
        [_textField becomeFirstResponder];
    }];
}

- (void)jh_hide:(UIButton *)button{
    
    [self.view endEditing:YES];
    
    [UIView animateWithDuration:0.25 animations:^{
        CGRect frame = _topView.frame;
        frame.origin.y = -100;
        _topView.frame = frame;
    } completion:^(BOOL finished) {
        if (_finishInputBlock && _textField.text.length > 0 && button) {
            _finishInputBlock(_textField.text);
        }
        [self xx_hideOut];
    }];
}

- (void)xx_showIn:(UIViewController *)vc
{
    [vc addChildViewController:self];
    [vc.view addSubview:self.view];
    [self.view setFrame:vc.view.bounds];
    [self didMoveToParentViewController:vc];
}

- (void)xx_hide
{
    [self jh_hide:nil];
}

- (void)xx_hideOut{
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
