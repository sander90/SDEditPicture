//
//  SDGraffitiSelectedSizeView.h
//  SDEditPicture
//
//  Created by shansander on 2017/7/26.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SDGraffitiSizeModel;
@interface SDGraffitiSelectedSizeView : UIView

@property (nonatomic, weak) UIView * theSizeView;

@property (nonatomic, strong) SDGraffitiSizeModel * graffitiSizeModel;

@property (nonatomic, strong) UIColor * graffitiColor;

- (instancetype)initWithSizeModel:(SDGraffitiSizeModel *)sizeModel;

@end
