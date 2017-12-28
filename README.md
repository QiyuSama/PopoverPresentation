<t>How to use it?</t>
<p>1、#import "UIViewController+PopoverPresent.h"</p>
<p>2、create a viewcontroller and set it's preferredContentSize property</p>
<code>
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor redColor];
    vc.preferredContentSize = CGSizeMake(100, 100);
</code>
3、[self pp_presentViewController:vc sourceView:sender];
    
