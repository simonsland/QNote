//
//  XHMovableCellTableView.m
//  QNote
//  Movable Cell Supported.
//  Created by 游星辉 on 2019/10/22.
//  Copyright © 2019 starccode. All rights reserved.
//

#import "XHMovableCellTableView.h"

@implementation XHMovableCellTableView
#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self addGesture];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self addGesture];
    }
    return self;
}

#pragma mark - 手势操作
- (void)addGesture {
    _longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(processGesture:)];
    [self addGestureRecognizer:_longPressGesture];
}

- (void)processGesture:(UILongPressGestureRecognizer *)gesture {
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            [self gestureBegan:gesture];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            [self gestureChanged:gesture];
        }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            [self gestureEndedOrCancelled:gesture];
        }
            break;
        default:
            break;
    }
}

- (void)gestureBegan:(UILongPressGestureRecognizer *)gesture {
    //从gesture的位置识别该位置处于UITableView哪一个cell中
    
}

- (void)gestureChanged:(UILongPressGestureRecognizer *)gesture {
    
}

- (void)gestureEndedOrCancelled:(UILongPressGestureRecognizer *)gesture {
    
}

@end
