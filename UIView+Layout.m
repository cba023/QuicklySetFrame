//
//  UIView+Layout.m
//  GCAPP
//
//  Created by Creater on 2018/5/10.
//  Copyright © 2018年 HustBroventure. All rights reserved.
//

#import "UIView+Layout.h"

@implementation UIViewVirtualLayout

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    self.frame = CGRectMake(x, self.y, self.w, self.h);
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    self.frame = CGRectMake(self.x, y, self.w, self.h);
}

- (CGFloat)w {
    return self.frame.size.width;
}

- (void)setW:(CGFloat)w {
    self.frame = CGRectMake(self.x, self.y, w, self.h);
}

- (CGFloat)h {
    return self.frame.size.height;
}

- (void)setH:(CGFloat)h {
    self.frame = CGRectMake(self.x, self.y, self.w, h);
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)b {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setB:(CGFloat)b {
    CGRect frame = self.frame;
    frame.origin.y = b - frame.size.height;
    self.frame = frame;
}

- (CGFloat)xCenter {
    return (self.x + self.right) / 2.0;
}

- (void)setXCenter:(CGFloat)xCenter {
    self.x = xCenter - self.w / 2.0;
}

- (CGFloat)yCenter {
    return (self.y + self.b) / 2.0;
}

- (void)setYCenter:(CGFloat)yCenter {
    self.y = yCenter - self.h / 2.0;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setFrame:(CGRect)frame {
    _frame = frame;
}

@end

@implementation UIView (Layout)

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    self.frame = CGRectMake(x, self.y, self.w, self.h);
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    self.frame = CGRectMake(self.x, y, self.w, self.h);
}

- (CGFloat)w {
    return self.frame.size.width;
}

- (void)setW:(CGFloat)w {
    self.frame = CGRectMake(self.x, self.y, w, self.h);
}

- (CGFloat)h {
    return self.frame.size.height;
}

- (void)setH:(CGFloat)h {
    self.frame = CGRectMake(self.x, self.y, self.w, h);
}

- (CGFloat)r {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setR:(CGFloat)r {
    CGRect frame = self.frame;
    frame.origin.x = r - frame.size.width;
    self.frame = frame;
}

- (CGFloat)b {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setB:(CGFloat)b {
    CGRect frame = self.frame;
    frame.origin.y = b - frame.size.height;
    self.frame = frame;
}

- (CGFloat)xCenter {
    return self.center.x;
}

- (void)setXCenter:(CGFloat)xCenter {
    self.center = CGPointMake(xCenter, self.center.y);
}

- (CGFloat)yCenter {
    return self.center.y;
}

- (void)setYCenter:(CGFloat)yCenter {
    self.center = CGPointMake(self.center.x, yCenter);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setFrameFromLayout:(VirtualLayoutBlock)layoutBlock {
    UIViewVirtualLayout * layout = [[UIViewVirtualLayout alloc] init];
    layout.frame = self.frame;
    layoutBlock(layout);
    [self setFrame:layout.frame];
}

@end
