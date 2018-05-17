//
//  UIView+Layout.h
//  GCAPP
//
//  Created by Creater on 2018/5/10.
//  Copyright © 2018年 HustBroventure. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIViewVirtualLayout : NSObject
/// 横坐标
@property (nonatomic) CGFloat x;
/// 纵坐标
@property (nonatomic) CGFloat y;
/// 宽度
@property (nonatomic) CGFloat w;
/// 高度
@property (nonatomic) CGFloat h;
/// 右侧的横坐标
@property (nonatomic) CGFloat r;
/// 底边纵坐标
@property (nonatomic) CGFloat b;
/// 中心横坐标
@property (nonatomic) CGFloat xCenter;
/// 中心纵坐标
@property (nonatomic) CGFloat yCenter;
/// 原点坐标
@property (nonatomic) CGPoint origin;
/// 尺寸
@property (nonatomic) CGSize size;
@property (nonatomic) CGRect frame;

@end

typedef void(^VirtualLayoutBlock)(UIViewVirtualLayout *layout);

/// UIView布局类别（已经避开与Masony的布局冲突）
@interface UIView (Layout)
/// 横坐标
@property (nonatomic) CGFloat x;
/// 纵坐标
@property (nonatomic) CGFloat y;
/// 宽度
@property (nonatomic) CGFloat w;
/// 高度
@property (nonatomic) CGFloat h;
/// 右侧的横坐标
@property (nonatomic) CGFloat r;
/// 底边纵坐标
@property (nonatomic) CGFloat b;
/// 中心横坐标
@property (nonatomic) CGFloat xCenter;
/// 中心纵坐标
@property (nonatomic) CGFloat yCenter;
/// 原点坐标
@property (nonatomic) CGPoint origin;
/// 尺寸
@property (nonatomic) CGSize size;

/// 通过虚拟坐标Block实现设定Frame布局
- (void)setFrameFromLayout:(VirtualLayoutBlock)layoutBlock;

@end

