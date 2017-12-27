How to use?
1、#import "UIViewController+PopoverPresent.h"
2、create a viewcontroller and set it's preferredContentSize property
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor redColor];
    vc.preferredContentSize = CGSizeMake(100, 100);
3、[self pp_presentViewController:vc sourceView:sender];
    
