//
//  SDGraffitiSelectedMainControllerView.m
//  SDEditPicture
//
//  Created by shansander on 2017/7/26.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "SDGraffitiSelectedMainControllerView.h"

#import "SDGraffitiResetModel.h"

#import "SDGraffitiSelectedColorModel.h"

#import "SDGraffitiSizeModel.h"

#import "SDGraffitiColorModel.h"

#import "SDGraffitiResetButtonView.h"

#import "SDGraffitiToChooseColorView.h"

#import "SDGraffitiSelectedSizeView.h"

@interface SDGraffitiSelectedMainControllerView ()

@property (nonatomic, weak) SDGraffitiResetButtonView * graffitiResetView;

@property (nonatomic, weak) SDGraffitiToChooseColorView * graffitiSelectedColorView;
@end

@implementation SDGraffitiSelectedMainControllerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self sd_configView];
    }
    return self;
}


- (void)sd_configView
{
    [self graffitiResetView];
    
}

#pragma mark - setter

- (void)setGraffitiResetModel:(SDGraffitiResetModel *)graffitiResetModel
{
    _graffitiResetModel = graffitiResetModel;
    
    self.graffitiResetView.graffitiResetModel = self.graffitiResetModel;
}

- (void)setGraffitiSelectedColorModel:(SDGraffitiSelectedColorModel *)graffitiSelectedColorModel
{
    _graffitiSelectedColorModel = graffitiSelectedColorModel;
    
    self.graffitiSelectedColorView.graffitiSelectedColorModel = self.graffitiSelectedColorModel;
    
}

- (void)setGraffiti_size_list:(NSArray *)graffiti_size_list
{
    _graffiti_size_list = graffiti_size_list;
    
   __block CGFloat lastPointx = CGRectGetMaxX(self.graffitiSelectedColorView.frame);
    
    CGFloat unitWidth = (SCREEN_WIDTH - lastPointx) / self.graffiti_size_list.count;
    
    
    [self.graffiti_size_list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SDGraffitiSizeModel * sizemodel = obj;
        
        SDGraffitiSelectedSizeView * sizeView = [self createGraffSizeWithModel:sizemodel];
        
        sizeView.frame = (CGRect){{lastPointx,0},{unitWidth , sizeView.frame.size.height}};
        
        lastPointx += sizeView.frame.size.width;
    }];

}

- (SDGraffitiSelectedSizeView * )createGraffSizeWithModel:(SDGraffitiSizeModel *)graffitiSizeModel
{
    SDGraffitiSelectedSizeView * sizeview = [[SDGraffitiSelectedSizeView alloc] initWithSizeModel:graffitiSizeModel];
    
    [self addSubview:sizeview];
    
    return sizeview;
}




#pragma mark - getter
- (SDGraffitiResetButtonView *)graffitiResetView
{
    if (!_graffitiResetView) {
        SDGraffitiResetButtonView * theView = [[SDGraffitiResetButtonView alloc] init];
        
        theView.frame = (CGRect){CGPointZero,theView.frame.size};
        [self addSubview:theView];
        
        
        
        _graffitiResetView = theView;
    }
    return _graffitiResetView;
}

- (SDGraffitiToChooseColorView *)graffitiSelectedColorView
{
    if (!_graffitiSelectedColorView) {
        SDGraffitiToChooseColorView * theView = [[SDGraffitiToChooseColorView alloc] init];
        [self addSubview:theView];
        
        theView.frame = (CGRect){{CGRectGetMaxX(self.graffitiResetView.frame),0},theView.frame.size};
        
        _graffitiSelectedColorView = theView;
    }
    return _graffitiSelectedColorView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
