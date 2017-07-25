//
//  SDCutEditImageViewModel.m
//  SDEditPicture
//
//  Created by shansander on 2017/7/25.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "SDCutEditImageViewModel.h"

#import "SDCutFunctionViewController.h"

#import "SDEditImageEnumModel.h"

@implementation SDCutEditImageViewModel

- (instancetype)initWithViewController:(UIViewController *)viewController
{
    self = [super initWithViewController:viewController];
    if (self) {
        [self sd_configViewModel];
    }
    return self;
}

- (SDCutFunctionViewController *)cutViewController
{
    return (SDCutFunctionViewController *)self.viewController;
}

- (void)sd_configViewModel
{
    
}


- (SDEditImageEnumModel *)cancelModel
{
    if (!_cancelModel) {
        _cancelModel = [[SDEditImageEnumModel alloc] initWithAction:SDEditPhotoCancel];
        @weakify_self;
        [_cancelModel.done_subject subscribeNext:^(id x) {
            @strongify_self;
            [[self cutViewController] onCancelAction];
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

- (SDEditImageEnumModel *)cutModel
{
    if (!_cutModel) {
        _cutModel = [[SDEditImageEnumModel alloc] initWithAction:SDEditPhotoFilter];
    }
    return _cutModel;
}

@end
