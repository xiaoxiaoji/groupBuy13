//
//  changeCityViewController.m
//  groupBuy13
//
//  Created by 耿米民管会 on 15/9/22.
//  Copyright (c) 2015年 gmh. All rights reserved.
//

#import "changeCityViewController.h"
#import "cityGroupsModel.h"
#import "UIView+AutoLayout.h"
#import "searchResultTableViewController.h"
@interface changeCityViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIView *coverView;
@property (nonatomic,strong) NSArray *cityArray;
@property(nonatomic,strong) searchResultTableViewController *searchResultVC;
@end

@implementation changeCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"切换城市";
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_navigation_close_hl"] style:UIBarButtonItemStyleDone target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem=backItem;
    cityGroupsModel *cityModel=[[cityGroupsModel alloc]init];
    _cityArray=[cityModel getCityGroupsArray];
}




-(void)backClick{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _cityArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    cityGroupsModel *model=[_cityArray objectAtIndex:section];
    
    return model.cities.count;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *str=@"reuse";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cityGroupsModel *model=[_cityArray objectAtIndex:indexPath.section];
    cell.textLabel.text=model.cities[indexPath.row];
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return [[_cityArray objectAtIndex:section] title];
    
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.coverView.hidden=NO;
    
}
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.coverView.hidden=YES;
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchText.length) {
        self.searchResultVC.view.hidden = NO;
        self.searchResultVC.searchText = searchText;
    }
    else{
        self.searchResultVC.view.hidden = YES;
        
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cityGroupsModel *model=[_cityArray objectAtIndex:indexPath.section];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cityDidChanged" object:nil userInfo:@{@"city":model.cities[indexPath.row]}];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
#pragma mark - 创建搜索结果控制器
- (searchResultTableViewController *)searchResultVC{
   
    if (!_searchResultVC) {
        _searchResultVC.view.hidden=YES;
        _searchResultVC = [[searchResultTableViewController alloc]init];
        [self.view addSubview:_searchResultVC.view];
        [self.searchResultVC.view autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.searchResultVC.view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.searchBar];
    }
    return _searchResultVC;
}
@end