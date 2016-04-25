//
//  dealModel.m
//  groupBuy13
//
//  Created by 耿米民管会 on 15/9/23.
//  Copyright (c) 2015年 gmh. All rights reserved.
//

#import "dealModel.h"

@implementation dealModel


-(NSArray *)assignModelWithDict:(NSDictionary *)dict{
    
    
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    NSArray *dictArray=[dict objectForKey:@"deals"];
    for (NSDictionary *dict in dictArray) {
        dealModel *model=[[dealModel alloc]init];
        model.categories        = dict[@"categories"];
        model.city              = dict[@"city"];
        model.current_price     = [dict[@"current_price"]stringValue];
        model.deal_url          = dict[@"deal_url"];
        model.Description       = dict[@"description"];
        model.image_url         = dict[@"image_url"];
        model.s_image_url       = dict[@"s_image_url"];
        model.list_price        = [dict[@"list_price"]stringValue];
        model.purchase_deadline = dict[@"purchase_deadline"];
        model.title             = dict[@"title"];
        [arr addObject:model];
    }
    return arr;
}
@end