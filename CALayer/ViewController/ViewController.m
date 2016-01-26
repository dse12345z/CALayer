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
    gradient.colors = @[(id)[UIColor redColor].CGColor, (id)[UIColor grayColor].CGColor];
    
    // insertSublayer:(插入 Sublayer) atIndex:(插入 index 層)
    [self.demoView.layer insertSublayer:gradient atIndex:0];
}

@end
