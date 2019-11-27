//
//  HeaderViewForShareTableView.m
//  QNoteShare
//
//  Created by 游星辉 on 2019/11/26.
//  Copyright © 2019 starccode. All rights reserved.
//

#import "HeaderViewForShareTableView.h"
#import <Masonry.h>

@interface HeaderViewForShareTableView ()
@property(nonatomic, strong)UILabel *titleLabel;
@end

@implementation HeaderViewForShareTableView

@synthesize title = _title;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self layoutSubviews];
    }
    return self;
}

- (NSString *)title {
    return _title;
}

- (void)setTitle:(NSString *)title {
    if(_title != title) {
        _title = title;
        [self setNeedsLayout];
    }
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(20);
            make.centerY.equalTo(self);
            make.left.equalTo(self);
        }];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont fontWithName:@"STSongti-SC-Black" size:20.0];
    }
    return _titleLabel;
}

- (void)layoutSubviews {
    //Title Label
    if(self.title) {
        self.titleLabel.text = self.title;
    }
}

@end
