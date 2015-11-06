//
//  HBCollectionViewCell.m
//  HBCollectionBase
//
//  Created by wangfeng on 15/11/6.
//  Copyright (c) 2015年 HustBroventure. All rights reserved.
//

#import "HBCollectionViewCell.h"

@implementation HBCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.topImageView = [[UIImageView alloc]init];
        self.topImageView.frame = self.bounds;
            //[self addSubview:self.topImageView];
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
}
@end
