//
//  navItem.m
//  groupBuy13
//
//  Created by 耿米民管会 on 15/9/21.
//  Copyright (c) 2015年 gmh. All rights reserved.
//

#import "navItem.h"
@interface navItem()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end
@implementation navItem

+(instancetype)makeNavItem{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"navItem" owner:self options:nil]firstObject];
    
}
-(void)addtarget:(id)target action:(SEL)action{
    
    [self.button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
