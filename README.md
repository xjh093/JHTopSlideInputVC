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

```
like this:
```

![image](https://github.com/xjh093/JHTopSlideInputVC/blob/master/Screen%20Shot%202017-09-15%20at%2009.09.24.png)

