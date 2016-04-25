//
//  categoriesModel.h
//  groupBuy13
//
//  Created by 耿米民管会 on 15/9/21.
//  Copyright (c) 2015年 gmh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface categoriesModel : NSObject



@property (copy,nonatomic)NSString * highlighted_icon;
@property (copy,nonatomic)NSString * small_highlighted_icon;
@property (copy,nonatomic)NSString * icon;
@property (copy,nonatomic)NSString * small_icon;
//名称
@property (copy,nonatomic)NSString * name;
//子数据数组
@property (strong,nonatomic)NSArray * subcategories;
@property(nonatomic,strong) NSString *map_icon;
- (NSArray *)loadPlistData;




@end
