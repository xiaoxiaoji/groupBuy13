//
//  firstViewController.m
//  groupBuy13
//
//  Created by 耿米民管会 on 15/9/21.
//  Copyright (c) 2015年 gmh. All rights reserved.
//

#import "firstViewController.h"
#import "navItem.h"
#import "popViewController.h"
#import "secondPopViewController.h"
#import "categoriesModel.h"
#import "DPAPI.h"
#import "dealModel.h"
#import "MainCollectionViewCell.h"
@interface firstViewController ()<DPRequestDelegate>{
    UIBarButtonItem *firstItem;
    UIBarButtonItem *secondItem;
    NSString *selectedCategory;
    NSString *cityName;
    NSArray *Array;
}

@end

@implementation firstViewController
-(instancetype)init{
    
    UICollectionViewFlowLayout *layout  =[[UICollectionViewFlowLayout alloc]init];
    layout.itemSize                     =CGSizeMake(300, 300);
    return [self initWithCollectionViewLayout:layout];
}
static NSString * const reuseIdentifier = @"MainCell";
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor =[UIColor whiteColor];
    [self addNavItem];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(categoryChange:) name:@"categoryDidChanged" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(subCategoryChange:) name:@"subCategoryDidChanged" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cityChange:) name:@"cityDidChanged" object:nil];
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"MainCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    
    }

-(void)categoryChange:(NSNotification *)noti{
    categoriesModel *model              =noti.userInfo[@"categoryModel"];
    NSLog(@"----%@----",model.name);
    [self createRequest];
}
-(void)subCategoryChange:(NSNotification *)noti{
    categoriesModel *model              =noti.userInfo[@"categoryModel"];
    NSString *subCategory               =noti.userInfo[@"subCategoryName"];
    if ([subCategory isEqualToString:@"全部"]) {
        selectedCategory                =model.name;
    }else{
        selectedCategory                =subCategory;
    }
    NSLog(@"-----%@-------",selectedCategory);
    [self createRequest];
}
-(void)cityChange:(NSNotification *)noti{
    
    cityName=noti.userInfo[@"city"];
    NSLog(@"-----City is %@-----",cityName);
    [self createRequest];
    
}

-(void)addNavItem{
    UIBarButtonItem *titleItem          =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStyleDone target:nil action:nil];
    navItem *first=[navItem makeNavItem];
    [first addtarget:self action:@selector(firstClick)];
    navItem *second=[navItem makeNavItem];
    [second addtarget:self action:@selector(secondClick)];
    firstItem=[[UIBarButtonItem alloc]initWithCustomView:first];
    secondItem=[[UIBarButtonItem alloc]initWithCustomView:second];
    self.navigationItem.leftBarButtonItems=@[titleItem,firstItem,secondItem];
}
-(void)addPopverView{
    popViewController *pvc              =[[popViewController alloc]init];
    UIPopoverController *pop            =[[UIPopoverController alloc]initWithContentViewController:pvc];
    [pop presentPopoverFromBarButtonItem:firstItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}
-(void)addSecondPopView{
    secondPopViewController *pvc        =[[secondPopViewController alloc]initWithNibName:@"secondPopViewController" bundle:nil];
    UIPopoverController *pop            =[[UIPopoverController alloc]initWithContentViewController:pvc];
    [pop presentPopoverFromBarButtonItem:secondItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}
-(void)firstClick{
    [self addPopverView];
}
-(void)secondClick{
    [self addSecondPopView];
}


#pragma mark -网络请求
-(void)createRequest{
    DPAPI *api=[[DPAPI alloc]init];
    NSMutableDictionary *params         =[[NSMutableDictionary alloc]init];
    [params setValue:cityName forKey:@"city"];
    [params setValue:selectedCategory forKey:@"category"];
    [api requestWithURL:@"v1/deal/find_deals" params:params delegate:self];
}
-(void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result{
    NSDictionary *dict                  =result;
    dealModel *model                    =[[dealModel alloc]init];
    Array=[model assignModelWithDict:dict];
    [self.collectionView reloadData];
    NSLog(@"%@",result);
}
-(void)request:(DPRequest *)request didFailWithError:(NSError *)error{

    NSLog(@"%@",error);

}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete method implementation -- Return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete method implementation -- Return the number of items in the section
    return Array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    dealModel *model=Array[indexPath.item];
    [cell showUIWithModel:model];
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
