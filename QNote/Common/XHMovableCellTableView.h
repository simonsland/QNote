//
//  XHMovableCellTableView.h
//  QNote
//  Movable Cell Supported.
//  Created by 游星辉 on 2019/10/22.
//  Copyright © 2019 starccode. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XHMovableCellTableView : UITableView
@property(nonatomic, strong, readonly) UILongPressGestureRecognizer *longPressGesture;
@end

NS_ASSUME_NONNULL_END
