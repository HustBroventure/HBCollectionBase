//
//  ViewController.m
//  HBCollectionBase
//
//  Created by wangfeng on 15/11/6.
//  Copyright (c) 2015年 HustBroventure. All rights reserved.
//

#import "ViewController.h"
#import "HBCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView* collectionView;
@end

@implementation ViewController

#pragma mark - vc-life-circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
#pragma mark - public methords

#pragma mark - private-tools methords
- (void)initData
{
    
}
#pragma mark - property-setter-getter


#pragma mark - event methords
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(80, 300);
        flowLayout.minimumLineSpacing = 20;
            //flowLayout.minimumInteritemSpacing= 10;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[HBCollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
        _collectionView.backgroundColor = [UIColor orangeColor];
        _collectionView.pagingEnabled = YES;
        
        
    }
    return _collectionView;
}

#pragma mark - delegate methords
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 15;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HBCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    cell.topImageView.backgroundColor = [UIColor greenColor];

    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
     NSLog(@"%s",__func__);
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f   %f",scrollView.contentOffset.x,scrollView.contentSize.width - self.collectionView.frame.size.width);
    if(scrollView.contentOffset.x > scrollView.contentSize.width- self.collectionView.frame.size.width){
        [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    }
    if (scrollView.contentOffset.x < 0) {
            //[scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    }
}

@end
