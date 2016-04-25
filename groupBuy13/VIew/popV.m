//
//  popV.m
//  groupBuy13
//
//  Created by 耿米民管会 on 15/9/21.
//  Copyright (c) 2015年 gmh. All rights reserved.
//

#import "popV.h"
@interface popV()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *leftTable;
@property (weak, nonatomic) IBOutlet UITableView *rightTalbe;
@property(nonatomic,assign) NSInteger selectedRow;
@end
@implementation popV

+(popV *)makePopView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"popV" owner:self options:nil]firstObject];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView==_leftTable) {
        return [self.dataSource numberOfRowsInLeftTable:self];
    }else{
        return [self.dataSource popView:self subArrayForRow:_selectedRow].count;
    }
    
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==_leftTable) {
        static NSString *str=@"reuse";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        cell.textLabel.text=[self.dataSource popView:self titleForRow:indexPath.row];
        cell.imageView.image=[UIImage imageNamed:[self.dataSource popView:self imageForRow:indexPath.row]];
        if ([self.dataSource popView:self subArrayForRow:indexPath.row].count) {
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }else{
            cell.accessoryType=UITableViewCellAccessoryNone;
        }
        return cell;
    }else{
        static NSString *str=@"reuse";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        cell.textLabel.text=[self.dataSource popView:self subArrayForRow:_selectedRow][indexPath.row];
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==_leftTable) {
        _selectedRow=indexPath.row;
        [_rightTalbe reloadData];
        if ([self.delegate respondsToSelector:@selector(popView:didSelectedRowInLeftTable:)]) {
            [self.delegate popView:self didSelectedRowInLeftTable:indexPath.row];
        }
    }else{
        if ([self.delegate respondsToSelector:@selector(popView:didSelectedRowInRightTable:)]) {
            [self.delegate popView:self didSelectedRowInRightTable:indexPath.row];
        }

    }
}

@end
