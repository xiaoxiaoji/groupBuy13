//
//  popV.h
//  groupBuy13
//
//  Created by 耿米民管会 on 15/9/21.
//  Copyright (c) 2015年 gmh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class popV;
@class popViewController;
@protocol myPopViewDataSource <NSObject>

-(NSInteger)numberOfRowsInLeftTable:(popV*)popView;

-(NSString*)popView:(popV*)popView titleForRow:(NSInteger)row;

-(NSString*)popView:(popV *)popView imageForRow:(NSInteger)row;

-(NSArray *)popView:(popV *)popView subArrayForRow:(NSInteger)row;

@end

@protocol myPopViewDelegate <NSObject>

-(void)popView:(popV*)popView didSelectedRowInLeftTable:(NSInteger)row;

-(void)popView:(popV *)popView didSelectedRowInRightTable:(NSInteger)row;

@end

@interface popV : UIView

+(popV*)makePopView;
@property(nonatomic,assign)id <myPopViewDataSource> dataSource;

@property(nonatomic,assign)id <myPopViewDelegate> delegate;
@end