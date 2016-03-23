两行代码快速集成高斯模糊的活动指示器
好难解释, 额..就像支付宝如果你进去后台再回到前台的时候会有一个模糊效果

_testHUD = [[JYFrostedProgressHUD alloc] initWithView:self.view];
WithView可以传你想要覆盖的view层

[self.view addSubview:_testHUD];

调用[_testHUD stop]HUD停止
