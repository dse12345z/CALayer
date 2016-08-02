//
//  ViewController.m
//  CALayer
//
//  Created by daisuke on 2016/1/26.
//  Copyright © 2016年 dse12345z. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *demoView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.demoView.backgroundColor = [UIColor yellowColor];
    
    ///---------------------------------------------------------------------------------------
    /// @name 屬性
    ///---------------------------------------------------------------------------------------
    
    
    // 邊框寬度
    self.demoView.layer.borderWidth = 1;
    self.demoView.layer.borderColor = [UIColor redColor].CGColor;
    
    ///---------------------------------------------------------------------------------------
    /// 陰影
    
    // 陰影顏色
    self.demoView.layer.shadowColor = [UIColor redColor].CGColor;
    
    // [水平偏移, 垂直偏移]
    self.demoView.layer.shadowOffset = CGSizeMake(3.0f, 3.0f);
    
    // 陰影透明度,值範圍 0.0 ~ 1.0
    self.demoView.layer.shadowOpacity = 2.0f;
    
    // 陰影發散的程度
    self.demoView.layer.shadowRadius = 10.0f;
    
    // 圓角的弧度
    self.demoView.layer.cornerRadius = 5.5f;
    
    // 防止元素超出畫面,預設 NO 代表不限制 (可設定陰影), YES 代表限制 (不可設定陰影)
    self.demoView.layer.masksToBounds = NO;
    
    
    ///---------------------------------------------------------------------------------------
    /// @name CAGradientLayer (gradient over, 梯型填充)
    ///---------------------------------------------------------------------------------------
    
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.demoView.bounds;
    
    // 由上到下的漸層顏色
    gradient.colors = @[(id)[UIColor redColor].CGColor, (id)[UIColor clearColor].CGColor, (id)[UIColor clearColor].CGColor, (id)[UIColor grayColor].CGColor];
    
    // insertSublayer:(插入 Sublayer) atIndex:(插入 index 層)
    [self.demoView.layer insertSublayer:gradient atIndex:0];
    
    ///---------------------------------------------------------------------------------------
    /// @name CAEmitterLayer (粒子動畫)
    ///---------------------------------------------------------------------------------------
    
    CAEmitterLayer *sunshineEmitterLayer = [CAEmitterLayer layer];
    // 發射位置
    sunshineEmitterLayer.emitterPosition = CGPointMake(100, -30);
    // 發射範圍
    sunshineEmitterLayer.emitterSize = CGSizeMake(CGRectGetWidth(self.view.frame) * 2, 0);
    // 發射模式
    sunshineEmitterLayer.emitterMode = kCAEmitterLayerOutline;
    // 粒子模式
    sunshineEmitterLayer.emitterShape = kCAEmitterLayerLine;
    
    // 創建粒子
    CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
    // 粒子內容
    emitterCell.contents = (__bridge id)([UIImage imageNamed:@"snow"].CGImage);
    // 粒子縮放比例
    emitterCell.scale = 0.02;
    // 縮放範圍
    emitterCell.scaleRange = 0.5;
    // 每秒粒子產生數量
    emitterCell.birthRate = 200;
    // 粒子生命週期
    emitterCell.lifetime = 80;
    // 粒子透明度
    emitterCell.alphaSpeed = -0.01;
    // 粒子速度
    emitterCell.velocity = 50;
    emitterCell.velocityRange = 50;
    // 設定角度
    emitterCell.emissionRange = M_PI;
    // 設定粒子學轉角度
    emitterCell.spin = M_PI_4;
    // 設定 layer 陰影
    sunshineEmitterLayer.shadowOpacity = 1.0;
    // 設定圓角
    sunshineEmitterLayer.shadowRadius = 8;
    // 設定偏移
    sunshineEmitterLayer.shadowOffset = CGSizeMake(3, 3);
    // 設定顏色
    sunshineEmitterLayer.shadowColor = [UIColor whiteColor].CGColor;
    // 設定 layer 的例子
    sunshineEmitterLayer.emitterCells = @[emitterCell];
    [self.view.layer addSublayer:sunshineEmitterLayer];
}

@end
