<t>How to use it?</t>
<p>1、#import "UIViewController+PopoverPresent.h"</p>
<p>2、create a viewcontroller and set it's preferredContentSize property, finaly use 'pp_presentViewController:' method to present the viewcontroller you just created</p>
<code>
    <div>UIViewController *vc = [UIViewController new];<\div>
    <div>vc.view.backgroundColor = [UIColor redColor];<\div>
    <div>vc.preferredContentSize = CGSizeMake(100, 100);<\div>
    <div>[self pp_presentViewController:vc sourceView:sender];<\div>
</code>

    
