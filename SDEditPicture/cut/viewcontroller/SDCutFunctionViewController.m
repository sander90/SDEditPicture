//
//  SDCutFunctionViewController.m
//  SDEditPicture
//
//  Created by shansander on 2017/7/24.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "SDCutFunctionViewController.h"
#import "SDRevealView.h"
#import "SDCutEditPhotoControllerItemsView.h"

#import "SDCutEditImageViewModel.h"

@interface SDCutFunctionViewController ()

@property (nonatomic, weak) SDCutEditPhotoControllerItemsView * cutFunctionView;

@property (nonatomic, strong) SDCutEditImageViewModel * cutViewModel;


@end

@implementation SDCutFunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self sd_configView];
    
    [self sd_configData];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)sd_configView
{
    [self cutFunctionView];
}

- (void)sd_configData
{
    self.cutViewModel = (SDCutEditImageViewModel *)[SDCutEditImageViewModel modelViewController:self];
    
    self.cutFunctionView.cancelModel = self.cutViewModel.cancelModel;
    self.cutFunctionView.sureModel = self.cutViewModel.sureModel;
    self.cutFunctionView.cutModel = self.cutViewModel.cutModel;
}



- (SDCutEditPhotoControllerItemsView *)cutFunctionView
{
    if (!_cutFunctionView) {
        SDCutEditPhotoControllerItemsView * theView = [[SDCutEditPhotoControllerItemsView alloc] init];
        
        theView.frame = (CGRect){{0,SCREENH_HEIGHT - theView.frame.size.height},theView.frame.size};
        
        [self.view addSubview:theView];
        _cutFunctionView = theView;
    }
    return _cutFunctionView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
