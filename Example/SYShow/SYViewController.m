//
//  SYViewController.m
//  SYShow
//
//  Created by YangShi123 on 12/08/2021.
//  Copyright (c) 2021 YangShi123. All rights reserved.
//

#import "SYViewController.h"
#import "SYShow.h"

@interface SYViewController ()

@end

@implementation SYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)fromCenter:(id)sender {
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    view.backgroundColor = [UIColor redColor];
    [SYShow show:view option:SYShowOptionFromCenter backgroundColor:nil enableDismiss:YES];
}

- (IBAction)fromBottom:(id)sender {
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    view.backgroundColor = [UIColor blueColor];
    [SYShow show:view option:SYShowOptionFromBottom backgroundColor:nil enableDismiss:YES];
}

- (IBAction)fromBottomToSheet:(id)sender {
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    view.backgroundColor = [UIColor yellowColor];
    [SYShow show:view option:SYShowOptionFromBottomToSheet backgroundColor:nil enableDismiss:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
