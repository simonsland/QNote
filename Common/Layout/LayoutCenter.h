//
//  LayoutCenter.h
//  QNote
//
//  Created by 游星辉 on 2019/11/26.
//  Copyright © 2019 starccode. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LayoutCenter : NSObject

/**
 * 返回ShareTableViewCell与ShareTableViewl两侧的margin
 */
+(NSInteger)leftMarginOfShareTableViewCell;
+(NSInteger)rightMarginOfShareTableViewCell;

@end

NS_ASSUME_NONNULL_END
