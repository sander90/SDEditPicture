//
//  SDRevealView.m
//  SDEditPicture
//
//  Created by shansander on 2017/7/11.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "SDRevealView.h"

@interface SDRevealView ()

@property (nonatomic, weak) UIImageView * theRevealView;

@end

@implementation SDRevealView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self theRevealView];
        
    }
    return self;
}

- (void)setRevealImage:(UIImage *)revealImage
{
    _revealImage = revealImage;
    
    // 原始的图片大小
    CGFloat image_size_width = self.revealImage.size.width;
    CGFloat image_size_height = self.revealImage.size.height;
    // 用来展示的图片大小
    CGFloat revealImageSizeWidth = 0 ;
    CGFloat revealImageSizeHeight = 0;
    
    CGFloat revealscale = 1;
    
    if (image_size_width > image_size_height) {
        if (image_size_width > self.bounds.size.width) {
            revealscale = image_size_width / self.bounds.size.width;
            revealImageSizeWidth = self.bounds.size.width;
            revealImageSizeHeight  = image_size_height / revealscale;
        }else{
            revealscale = image_size_height / self.bounds.size.height;
            revealImageSizeHeight = self.bounds.size.height;
            revealImageSizeWidth = image_size_width / revealscale;
        }
    }else{
        revealImageSizeWidth = image_size_width;
        revealImageSizeHeight = image_size_height;
    }
    
    NSLog(@"scale = %f",revealscale);
    self.theRevealView.image = self.revealImage;
    
    self.theRevealView.frame = CGRectMake(0, 0, revealImageSizeWidth, revealImageSizeHeight);
    
    self.theRevealView.center = CGPointMake(self.bounds.size.width / 2.f, self.bounds.size.height / 2.f);
    
}

- (UIImageView *)theRevealView
{
    if (!_theRevealView) {
        UIImageView * theView = [[UIImageView alloc] init];
        [self addSubview:theView];
        _theRevealView = theView;
    }
    return _theRevealView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
