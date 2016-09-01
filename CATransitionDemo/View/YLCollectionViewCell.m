//
//  YLCollectionViewCell.m
//  CATransitionDemo
//
//  Created by yongliangP on 16/9/1.
//  Copyright © 2016年 yongliangP. All rights reserved.
//

#import "YLCollectionViewCell.h"

@interface YLCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation YLCollectionViewCell


-(void)setTitle:(NSString *)title
{
    _title = title;
    
    self.titleLabel.text = title;

}


- (void)awakeFromNib
{
    // Initialization code
}

@end
