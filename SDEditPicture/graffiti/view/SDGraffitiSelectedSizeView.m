//
//  SDGraffitiSelectedSizeView.m
//  SDEditPicture
//
//  Created by shansander on 2017/7/26.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "SDGraffitiSelectedSizeView.h"

#import "SDGraffitiSizeModel.h"

@implementation SDGraffitiSelectedSizeView

- (instancetype)initWithSizeModel:(SDGraffitiSizeModel *)sizeModel
{
    self = [super init];
    if (self) {
        
        self.frame = CGRectMake(0, 0, MAXSize(140), MAXSize(160));
        
        _graffitiSizeModel = sizeModel;
        
        [self sd_configView];
        
    }
    return self;
}

- (void)sd_configView
{
    CGFloat size = self.graffitiSizeModel.graffitiSize;
    
    [self.theSizeView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(size, size));
    }];
    
    self.theSizeView.layer.masksToBounds = true;
    
    self.theSizeView.layer.cornerRadius = size / 2.f;
    
    RAC(self,graffitiColor) = RACObserve(self.graffitiSizeModel, graffitiColor);
    
}

- (void)setGraffitiColor:(UIColor *)graffitiColor
{
    _graffitiColor = graffitiColor;
    
    self.theSizeView.backgroundColor = self.graffitiColor;
    
    
}


- (UIView *)theSizeView
{
    if (!_theSizeView) {
        UIView * theView = [[UIView alloc] init];
        [self addSubview:theView];
        
        [theView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.size.mas_equalTo(CGSizeZero);
        }];
        _theSizeView = theView;
    }
    return _theSizeView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
