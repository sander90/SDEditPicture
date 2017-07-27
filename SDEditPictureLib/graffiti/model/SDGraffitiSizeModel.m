//
//  SDGraffitiSizeModel.m
//  SDEditPicture
//
//  Created by shansander on 2017/7/26.
//  Copyright © 2017年 shansander. All rights reserved.
//

#import "SDGraffitiSizeModel.h"

@implementation SDGraffitiSizeModel

- (instancetype)initWithSize:(CGFloat)graffitiSize
{
    self = [super init];
    if (self) {
        _graffitiSize = graffitiSize;
        _graffitiColor = [UIColor colorWithHexRGB:0x45454c];
    }
    return self;
}


@end
