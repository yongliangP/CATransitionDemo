//
//  ViewController.m
//  CATransitionDemo
//
//  Created by yongliangP on 16/9/1.
//  Copyright © 2016年 yongliangP. All rights reserved.
//

#import "ViewController.h"
#import "YLCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) NSArray *titleArray;
@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataArray = @[@"fade",@"push",@"reveal",@"moveIn",@"cube",@"suckEffect",@"oglFlip",@"rippleEffect",@"pageCurl",@"pageUnCurl",@"cameraIrisHollowOpen",@"cameraIrisHollowClose"];

    self.titleArray = @[@"淡入淡出",@"推挤",@"揭开",@"覆盖",@"立方体",@"吮吸",@"翻转",@"波纹",@"翻页",@"反翻页",@"开镜头",@"关镜头"];
    
    // Do any additional setup after loading the view, typically from a nib.
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}


-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    YLCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];

    if (!cell)
    {
        cell = [[YLCollectionViewCell alloc] init];
    }

    
    cell.title = self.dataArray[indexPath.row];
    
    return cell;

}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    [self.imageView.layer removeAllAnimations];
    
    [self animationWithType:self.dataArray[indexPath.row]];

    self.titleLabel.text = [NSString stringWithFormat:@"%@(%@)",self.titleArray[indexPath.row],self.dataArray[indexPath.row]];
    
}


-(void)animationWithType:(NSString*)type
{

    //- 创建一个转场动画:
    CATransition *transition = [CATransition animation];
    //transition.autoreverses = YES;    //回退动画（动画可逆，即循环）
    //transition.duration = 10.0f;
    //transition.repeatCount = MAXFLOAT;
    transition.repeatCount = 5;
    //transition.removedOnCompletion = NO;
    //transition.fillMode = kCAFillModeForwards;//removedOnCompletion,fillMode配合使用保持动画完成效果
    //transition.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];

    //    - 确定动画类型:
    transition.type = type;
    
    //    - 确定子类型(方向等)
    transition.subtype = kCATransitionFromLeft;
    
    //    - 确定动画时间
    transition.duration = 1;
    
    //    - 添加动画
    [self.imageView.layer addAnimation:transition forKey:nil];
    
}



-(void)test
{

    /**
     
     
     - 常用动画类型:
     1    fade = 1,                   //淡入淡出
     2    push,                       //推挤
     3    reveal,                     //揭开
     4    moveIn,                     //覆盖
     5    cube,                       //立方体
     6    suckEffect,                 //吮吸
     7    oglFlip,                    //翻转
     8    rippleEffect,               //波纹
     9    pageCurl,                   //翻页
     10    pageUnCurl,                 //反翻页
     11    cameraIrisHollowOpen,       //开镜头
     12    cameraIrisHollowClose,      //关镜头
     
     - 常用方向参数(子类型):
     13    UIViewAnimationTransitionCurlDown, //下翻页
     14    UIViewAnimationTransitionCurlUp,  //上翻页
     15    UIViewAnimationTransitionFlipFromLeft,  //左翻转
     16    UIViewAnimationTransitionFlipFromRight, //右翻转
     
     
     */

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
