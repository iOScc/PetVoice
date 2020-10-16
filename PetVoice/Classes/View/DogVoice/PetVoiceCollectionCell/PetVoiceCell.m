//
//  PetVoiceCell.m
//  PetVoice
//
//  Created by cc on 2020/9/9.
//  Copyright © 2020 cc0717. All rights reserved.
//

#import "PetVoiceCell.h"

@implementation PetVoiceCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //添加自己需要个子视图控件
        [self setUpAllChildView];
    }
    return self;
}

- (void)setUpAllChildView {
    _bigImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    _bigImageView.layer.masksToBounds = YES;
    _bigImageView.layer.cornerRadius = 10;
    [self.contentView addSubview:_bigImageView];
}

@end
