//
//  SDEditRichImageViewController.m
//  SDEditPicture
//
//  Created by shansander on 2017/7/11.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "SDEditRichImageViewController.h"
#import "SDControllScrollView.h"

#import "SDRevealView.h"

#import "SDEditImageControllerItemsView.h"

#import "SDEditImageViewModel.h"

#import "SDFilterFunctionViewController.h"

@interface SDEditRichImageViewController ()

//@property (nonatomic, weak) SDControllScrollView * backControllerScrollView;
// 用来展示的Image
@property (nonatomic, weak) SDRevealView * theRevealView;

@property (nonatomic, weak) SDEditImageControllerItemsView * imageEditEnumView;

@property (nonatomic, strong) SDEditImageViewModel * editimageViewModel;

@property (nonatomic, copy) UIImage * showImage;


@end

@implementation SDEditRichImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self sd_configData];
    
    [self sd_configView];
    
}
#pragma mark - config_data
- (void)sd_configData
{
    self.editimageViewModel = (SDEditImageViewModel *)[SDEditImageViewModel modelViewController:self];
    
    self.showImage = self.originImage;
}

#pragma mark - config_view
- (void)sd_configView
{
    self.theRevealView.revealImage = self.showImage;

    [self imageEditEnumView];
    
    self.imageEditEnumView.editPtotoShowType = SDEditPhotoMain;
    
    self.imageEditEnumView.editList = [self.editimageViewModel getEditEnumListByModel:KEditPhotoMain];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)pushFilterViewController
{
    SDFilterFunctionViewController * filterController = [[SDFilterFunctionViewController alloc] initWithFinishBlock:^(UIImage *image) {
        self.showImage = image;
        
        self.theRevealView.revealImage = self.showImage;
    }];
    filterController.showImageView = self.showImage;
    [self presentViewController:filterController animated:NO completion:^{
        
    }];
}

#pragma mark - getter

- (SDRevealView *)theRevealView
{
    if (!_theRevealView) {
        SDRevealView * theView = [[SDRevealView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT - maineditfunctionphotoheight)];
        [self.view addSubview:theView];
        _theRevealView = theView;
    }
    return _theRevealView;
}

- (SDEditImageControllerItemsView *)imageEditEnumView
{
    if (!_imageEditEnumView) {
        SDEditImageControllerItemsView * theView = [[SDEditImageControllerItemsView alloc] init];
        [self.view addSubview:theView];
    
        _imageEditEnumView = theView;
    }
    return _imageEditEnumView;
}

@end
