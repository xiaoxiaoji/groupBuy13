//
//  secondPopViewController.m
//  groupBuy13
//
//  Created by 耿米民管会 on 15/9/21.
//  Copyright (c) 2015年 gmh. All rights reserved.
//

#import "secondPopViewController.h"
#import "changeCityViewController.h"
#import "navViewController.h"
@interface secondPopViewController ()
- (IBAction)changeCityClick:(id)sender;

@end

@implementation secondPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)changeCityClick:(id)sender {
    changeCityViewController *ccvc=[[changeCityViewController alloc]initWithNibName:@"changeCityViewController" bundle:nil];
    navViewController *nav=[[navViewController alloc]initWithRootViewController:ccvc];
    nav.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:nav animated:YES completion:nil];
}
@end
