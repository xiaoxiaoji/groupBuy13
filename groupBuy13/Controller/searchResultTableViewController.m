//
//  searchResultTableViewController.m
//  groupBuy13
//
//  Created by 耿米民管会 on 15/9/23.
//  Copyright (c) 2015年 gmh. All rights reserved.
//

#import "searchResultTableViewController.h"
#import "citiesModel.h"
@interface searchResultTableViewController (){
    NSMutableArray *array;
    
}
@property(nonatomic,strong)NSArray* cities;

@end

@implementation searchResultTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    citiesModel *model=[[citiesModel alloc]init];
   _cities=[model getCitiesArray];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)setSearchText:(NSString *)searchText{
    _searchText=[searchText lowercaseString];
    array=[[NSMutableArray alloc]init];
    for (citiesModel *model in _cities) {
        if ([model.pinYin containsString:_searchText]||[model.pinYinHead containsString:_searchText]) {
            [array addObject:model];
        }
    }
    [self.tableView reloadData];
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *str=@"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    // Configure the cell...
    citiesModel *model=[array objectAtIndex:indexPath.row];
    cell.textLabel.text=model.name;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    citiesModel *model=[array objectAtIndex:indexPath.row];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cityDidChanged" object:nil userInfo:@{@"city":model.name}];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
