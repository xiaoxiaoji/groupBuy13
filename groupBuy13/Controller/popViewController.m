//
//  popViewController.m
//  groupBuy13
//
//  Created by 耿米民管会 on 15/9/21.
//  Copyright (c) 2015年 gmh. All rights reserved.
//

#import "popViewController.h"
#import "popV.h"
#import "categoriesModel.h"
@interface popViewController ()<myPopViewDataSource,myPopViewDelegate>{
    categoriesModel *selectedModel;
}

@end

@implementation popViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    popV *pop=[popV makePopView];
    
    pop.dataSource=self;
    pop.delegate=self;
    pop.autoresizingMask=UIViewAutoresizingNone;
    self.preferredContentSize=CGSizeMake(pop.frame.size.width, pop.frame.size.height);
    [self.view addSubview:pop];
}
-(NSArray *)loadData{
    
    categoriesModel *model=[[categoriesModel alloc]init];
    NSArray *arr=[model loadPlistData];
    return arr;
    
}
-(NSInteger)numberOfRowsInLeftTable:(popV *)popView{
    return [self loadData].count;
}
-(NSString *)popView:(popV *)popView titleForRow:(NSInteger)row{

    
    return [[self loadData][row] name];
}
-(NSString *)popView:(popV *)popView imageForRow:(NSInteger)row{
    return [[self loadData][row] small_icon];
}
-(NSArray *)popView:(popV *)popView subArrayForRow:(NSInteger)row{
    return [[self loadData][row] subcategories];
}
-(void)popView:(popV *)popView didSelectedRowInLeftTable:(NSInteger)row{
    NSArray *arr=[self loadData];
    selectedModel=[arr objectAtIndex:row];
    if (!selectedModel.subcategories.count) {
         [[NSNotificationCenter defaultCenter]postNotificationName:@"categoryDidChanged" object:nil userInfo:@{@"categoryModel":selectedModel}];
    }
}
-(void)popView:(popV *)popView didSelectedRowInRightTable:(NSInteger)row{
    NSArray *arr=selectedModel.subcategories;
    [[NSNotificationCenter defaultCenter]postNotificationName:@"subCategoryDidChanged" object:nil userInfo:@{@"categoryModel":selectedModel,@"subCategoryName":arr[row]}];
}

@end
