//
//  SDFilterFunctionViewController.h
//  SDEditPicture
//
//  Created by shansander on 2017/7/18.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IFImageFilter;
@interface SDFilterFunctionViewController : UIViewController

@property (nonatomic, strong) UIImage * originImage;

@property (nonatomic, strong) UIImage * showImageView;

@property (nonatomic, copy)SDDiyImageFinishBlock diyFinishBlock;


/**
 选择了一个渲染，通知viewController来改变显示的图片

 @param imageFilter 渲染模块
 */
- (void)changeImageFilter:(IFImageFilter * )imageFilter;


/**
 显示原始图片
 */
- (void)showOriginImageFilter;


/**
 点击取消按钮，通知viewController dismissViewController
 */
- (void)onCancelAction;
/**
 点击确定按钮，通知viewController sure
 */
- (void)onSureAction;


/**
 init

 @param finishBlock 确定 渲染的block
 @return self
 */
- (instancetype)initWithFinishBlock:(SDDiyImageFinishBlock)finishBlock;

@end
