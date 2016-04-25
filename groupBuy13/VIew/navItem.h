//
//  navItem.h
//  groupBuy13
//
//  Created by 耿米民管会 on 15/9/21.
//  Copyright (c) 2015年 gmh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface navItem : UIView

+(instancetype)makeNavItem;

-(void)addtarget:(id)target action:(SEL)action;



@end
