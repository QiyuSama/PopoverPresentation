//
//  ViewController.m
//  PopoverPresentation
//
//  Created by xiangchao on 2017/12/27.
//  Copyright © 2017年 xiangchao. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+PopoverPresent.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sourceView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)onAdd:(UIButton *)sender {
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor redColor];
    vc.preferredContentSize = CGSizeMake(100, 100);
    [self pp_presentViewController:vc sourceView:sender];
}




@end
