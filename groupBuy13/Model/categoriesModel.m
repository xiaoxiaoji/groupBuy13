//
//  categoriesModel.m
//  groupBuy13
//
//  Created by 耿米民管会 on 15/9/21.
//  Copyright (c) 2015年 gmh. All rights reserved.
//

#import "categoriesModel.h"

@implementation categoriesModel


-(NSArray *)loadPlistData{
    NSString *path=[[NSBundle mainBundle]pathForResource:@"categories" ofType:@"plist"];
    NSArray *plistArray=[NSArray arrayWithContentsOfFile:path];
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    for (NSDictionary *dict in plistArray) {
        categoriesModel *model=[[categoriesModel alloc]init];
        model.highlighted_icon=[dict objectForKey:@"highlighted_icon"];
        model.icon=[dict objectForKey:@"icon"];
        model.small_highlighted_icon=[dict objectForKey:@"small_highlighted_icon"];
        model.small_icon=[dict objectForKey:@"small_icon"];
        model.name=[dict objectForKey:@"name"];
        model.map_icon=[dict objectForKey:@"map_icon"];
        model.subcategories=[dict objectForKey:@"subcategories"];
        [arr addObject:model];
    }
    
    return arr;

}

@end
