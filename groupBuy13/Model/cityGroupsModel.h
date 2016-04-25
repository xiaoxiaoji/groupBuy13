//
//  cityGroupsModel.h
//  groupBuy13
//
//  Created by 耿米民管会 on 15/9/22.
//  Copyright (c) 2015年 gmh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface cityGroupsModel : NSObject


@property(nonatomic,strong) NSArray *cities;
@property(nonatomic,copy) NSString *title;


-(NSArray *)getCityGroupsArray;
@end
