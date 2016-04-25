//
//  cityGroupsModel.m
//  groupBuy13
//
//  Created by 耿米民管会 on 15/9/22.
//  Copyright (c) 2015年 gmh. All rights reserved.
//

#import "cityGroupsModel.h"

@implementation cityGroupsModel
-(NSArray *)getCityGroupsArray{
    NSString *path=[[NSBundle mainBundle]pathForResource:@"cityGroups" ofType:@"plist"];
    NSArray *plistArray=[NSArray arrayWithContentsOfFile:path];
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    for (NSDictionary *dict in plistArray) {
        cityGroupsModel *model=[[cityGroupsModel alloc]init];
        model.title=[dict objectForKey:@"title"];
        model.cities=[dict objectForKey:@"cities"];
        [arr addObject:model];
    }
    return  arr;
}
@end
