# JHTopSlideInputVC
顶部下滑输入框

使用 & Use:
```
    JHTopSlideInputVC *vc = [[JHTopSlideInputVC alloc] init];
    vc.finishInputBlock = ^(NSString *text) {
        NSLog(@"input：%@",text);
    };
    [vc jh_showIn:self.tabBarController];
```
