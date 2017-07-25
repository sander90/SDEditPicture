//
//  SDEditRichImageViewController.h
//  SDEditPicture
//
//  Created by shansander on 2017/7/11.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDEditRichImageViewController : UIViewController

@property (nonatomic, strong) UIImage * originImage;

- (void)pushFilterViewController;

- (void)pushCutViewController;

@end
