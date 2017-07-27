//
//  SDGraffitiEditImageViewModel.m
//  SDEditPicture
//
//  Created by shansander on 2017/7/26.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "SDGraffitiEditImageViewModel.h"

#import "SDEditImageEnumModel.h"

#import "SDGraffitiFunctionViewController.h"

#import "SDGraffitiResetModel.h"

#import "SDGraffitiSelectedColorModel.h"

#import "SDGraffitiColorModel.h"

#import "SDGraffitiSizeModel.h"



@implementation SDGraffitiEditImageViewModel


- (instancetype)initWithViewController:(UIViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        [self sd_configViewModel];
        
    }
    return self;
}


- (SDGraffitiFunctionViewController *)targetViewController
{
    return (SDGraffitiFunctionViewController *)self.viewController;
}

- (void)sd_configViewModel
{
    self.graffitiResetModel = [[SDGraffitiResetModel alloc] init];
    
    self.graffitiSelectedColorModel = [[SDGraffitiSelectedColorModel alloc] init];
    @weakify_self;
    [self.graffitiSelectedColorModel.done_subject subscribeNext:^(id x) {
        @strongify_self;
        
        [[self targetViewController] showSelectedColorView];
        
    }];
    
    
    SDGraffitiSizeModel * sizemodel0 = [[SDGraffitiSizeModel alloc] initWithSize:MAXSize(20)];
    SDGraffitiSizeModel * sizemodel1 = [[SDGraffitiSizeModel alloc] initWithSize:MAXSize(30)];
    SDGraffitiSizeModel * sizemodel2 = [[SDGraffitiSizeModel alloc] initWithSize:MAXSize(40)];
    SDGraffitiSizeModel * sizemodel3 = [[SDGraffitiSizeModel alloc] initWithSize:MAXSize(50)];
    SDGraffitiSizeModel * sizemodel4 = [[SDGraffitiSizeModel alloc] initWithSize:MAXSize(60)];
    
    self.graffiti_size_list = @[sizemodel0,sizemodel1,sizemodel2,sizemodel3,sizemodel4];
    
    
    SDGraffitiColorModel * colorModel0 = [[SDGraffitiColorModel alloc] initWithColor:[UIColor colorWithHexRGB:0xff1744]];
    [colorModel0.done_subject subscribeNext:^(id x) {
        @strongify_self;
        self.graffitiSelectedColorModel.graffitiColor = colorModel0.graffitiColor;
    }];
    SDGraffitiColorModel * colorModel1 = [[SDGraffitiColorModel alloc] initWithColor:[UIColor colorWithHexRGB:0xff3d00]];
    [colorModel1.done_subject subscribeNext:^(id x) {
        @strongify_self;
        self.graffitiSelectedColorModel.graffitiColor = colorModel1.graffitiColor;
    }];
    SDGraffitiColorModel * colorModel2 = [[SDGraffitiColorModel alloc] initWithColor:[UIColor colorWithHexRGB:0xffc400]];
    [colorModel1.done_subject subscribeNext:^(id x) {
        @strongify_self;
        self.graffitiSelectedColorModel.graffitiColor = colorModel2.graffitiColor;

    }];
    SDGraffitiColorModel * colorModel3 = [[SDGraffitiColorModel alloc] initWithColor:[UIColor colorWithHexRGB:0x00e5ff]];
    [colorModel3.done_subject subscribeNext:^(id x) {
        @strongify_self;
        self.graffitiSelectedColorModel.graffitiColor = colorModel3.graffitiColor;

    }];
    SDGraffitiColorModel * colorModel4 = [[SDGraffitiColorModel alloc] initWithColor:[UIColor colorWithHexRGB:0x3d5afe]];
    [colorModel4.done_subject subscribeNext:^(id x) {
        @strongify_self;
        self.graffitiSelectedColorModel.graffitiColor = colorModel4.graffitiColor;

    }];
    SDGraffitiColorModel * colorModel5 = [[SDGraffitiColorModel alloc] initWithColor:[UIColor colorWithHexRGB:0xffffff]];
    [colorModel5.done_subject subscribeNext:^(id x) {
        @strongify_self;
        self.graffitiSelectedColorModel.graffitiColor = colorModel5.graffitiColor;

    }];
    self.graffiti_color_list = @[colorModel0,colorModel1,colorModel2,colorModel3,colorModel4,colorModel5];
    
    self.graffitiSelectedColorModel.graffitiColor = colorModel0.graffitiColor;
    
    
    
}



- (SDEditImageEnumModel *)cancelModel
{
    if (!_cancelModel) {
        _cancelModel = [[SDEditImageEnumModel alloc] initWithAction:SDEditPhotoCancel];
        @weakify_self;
        [_cancelModel.done_subject subscribeNext:^(id x) {
            @strongify_self;
            [[self targetViewController] onCancelAction];
        }];
    }
    return _cancelModel;
}

- (SDEditImageEnumModel *)sureModel
{
    if (!_sureModel) {
        _sureModel = [[SDEditImageEnumModel alloc] initWithAction:SDEditPhotoSure];
    }
    return _sureModel;
}

- (SDEditImageEnumModel *)brushModel
{
    if (!_brushModel) {
        _brushModel = [[SDEditImageEnumModel alloc] initWithAction:SDEditPhotoBrush];
    }
    return _brushModel;
}
- (SDEditImageEnumModel *)eraserModel
{
    if (!_eraserModel) {
        _eraserModel = [[SDEditImageEnumModel alloc] initWithAction:SDEditPhotoEraser];
    }
    return _eraserModel;
}

@end
