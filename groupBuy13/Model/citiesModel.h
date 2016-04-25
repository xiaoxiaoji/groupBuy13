//
//  citiesModel.h
//  groupBuy13
//
//  Created by 耿米民管会 on 15/9/23.
//  Copyright (c) 2015年 gmh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface citiesModel : NSObject

@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *pinYin;
@property(nonatomic,copy) NSString *pinYinHead;
@property(nonatomic,strong) NSArray *regions;

-(NSArray *)getCitiesArray;

@end
