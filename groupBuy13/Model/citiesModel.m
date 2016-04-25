//
//  citiesModel.m
//  groupBuy13
//
//  Created by 耿米民管会 on 15/9/23.
//  Copyright (c) 2015年 gmh. All rights reserved.
//

#import "citiesModel.h"

@implementation citiesModel

-(NSArray *)getCitiesArray{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"cities" ofType:@"plist"];
    NSArray *plistArray=[NSArray arrayWithContentsOfFile:path];    
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    for (NSDictionary *dict in plistArray) {
        citiesModel *model=[[citiesModel alloc]init];
        model.name=[dict objectForKey:@"name"];
        model.pinYin=[dict objectForKey:@"pinYin"];
        model.pinYinHead=[dict objectForKey:@"pinYinHead"];
        model.regions=[dict objectForKey:@"regions"];
        [arr addObject:model];
    }
    return arr;
}



@end
