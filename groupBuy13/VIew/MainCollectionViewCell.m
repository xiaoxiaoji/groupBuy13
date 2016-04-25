//
//  MainCollectionViewCell.m
//  groupBuy13
//
//  Created by 耿米民管会 on 15/9/23.
//  Copyright (c) 2015年 gmh. All rights reserved.
//

#import "MainCollectionViewCell.h"
#import "dealModel.h"
#import "UIImageView+WebCache.h"
@interface MainCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *detailLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@property (weak, nonatomic) IBOutlet UILabel *oldPriceLable;
@property (weak, nonatomic) IBOutlet UILabel *salesNumLabel;

@end
@implementation MainCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)showUIWithModel:(dealModel *)model{
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.image_url]];
    self.titleLable.text=model.title;
    self.detailLable.text=model.Description;
    self.priceLable.text=model.current_price;
    self.oldPriceLable.text=model.list_price;
   // self.salesNumLabel.text=model.purchase_deadline;
}

@end
