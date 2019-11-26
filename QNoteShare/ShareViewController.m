//
//  ShareViewController.m
//  QNoteShare
//
//  Created by 游星辉 on 2019/7/30.
//  Copyright © 2019 starccode. All rights reserved.
//

#import "ShareViewController.h"
#import "UIImageEffects.h"

@interface ShareViewController ()
@property (nonatomic, strong) NSString *note;
@property (nonatomic, strong) UITextView *noteScroll;
@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutViews];
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        //获取需要分享的笔记
//        for (NSExtensionItem *item in self.extensionContext.inputItems) {
//            //文字笔记
//            self.note = [item.attributedContentText string];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [self createScrollView];
//            });
//        }
//    });
}

-(void)layoutViews {
    //dimmingView毛玻璃效果
    UIImage *blurredBackgroundImage = [UIImage qmui_imageWithView:self.view];
    blurredBackgroundImage = [UIImageEffects imageByApplyingExtraLightEffectToImage:blurredBackgroundImage];
    UIImageView *blurredDimmingView = [[UIImageView alloc] initWithImage:blurredBackgroundImage];
    self.dimmingView = blurredDimmingView;
    //board
    UIView *board = [[UIView alloc] initWithFrame:CGRectMake(30, [UIScreen mainScreen].bounds.size.height/2-200, [UIScreen mainScreen].bounds.size.width-60, 400)];
    board.backgroundColor = [UIColor whiteColor];
    board.layer.cornerRadius = 6;
    board.layer.shadowColor = [UIColor blackColor].CGColor;
    board.layer.shadowOpacity = .08;
    board.layer.shadowRadius = 15;
    board.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:board.bounds cornerRadius:board.layer.cornerRadius].CGPath;
    //button bar
    UIView *bar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-60, 40)];
    bar.backgroundColor = [UIColor whiteColor];
    bar.layer.cornerRadius = 6;
    //cancel button
    QMUIButton *cancelButton = [[QMUIButton alloc] qmui_initWithSize:CGSizeMake(bar.frame.size.width/2, 40)];
    cancelButton.center = CGPointMake(cancelButton.frame.size.width / 2, bar.frame.size.height/2);
    cancelButton.adjustsButtonWhenHighlighted = YES;
    cancelButton.titleLabel.font = UIFontBoldMake(14);
    [cancelButton setTitleColor:UIColorWhite forState:UIControlStateNormal];
    cancelButton.backgroundColor = [UIColor qmui_randomColor];
    cancelButton.highlightedBackgroundColor = [[UIColor qmui_randomColor] qmui_transitionToColor:[UIColor blackColor] progress:0.5];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [bar addSubview:cancelButton];
    //post button
    QMUIButton *postButton = [[QMUIButton alloc] qmui_initWithSize:CGSizeMake(bar.frame.size.width/2, 40)];
    postButton.center = CGPointMake(bar.frame.size.width - postButton.frame.size.width / 2, bar.frame.size.height/2);
    postButton.adjustsButtonWhenHighlighted = YES;
    postButton.titleLabel.font = UIFontBoldMake(14);
    [postButton setTitleColor:UIColorWhite forState:UIControlStateNormal];
    postButton.backgroundColor = [UIColor qmui_randomColor];
    postButton.highlightedBackgroundColor = [[UIColor qmui_randomColor] qmui_transitionToColor:[UIColor blackColor] progress:0.5];
    [postButton setTitle:@"记录" forState:UIControlStateNormal];
    postButton.tintColor = [UIColor orangeColor];
    [postButton addTarget:self action:@selector(postButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [bar addSubview:postButton];
    [board addSubview:bar];
    self.contentView = board;
}

- (void)cancelButtonAction{
    [self.extensionContext cancelRequestWithError:[NSError errorWithDomain:@"CustomShareError" code:NSUserCancelledError userInfo:nil]];
}

- (void)postButtonAction{
    NSLog(@"postButtonAction");
//    NSString *customURL = @"QNote://";
//    UIResponder* responder = self;
//    while ((responder = [responder nextResponder]) != nil){
//        if([responder respondsToSelector:@selector(openURL:)] == YES){
//            [responder performSelector:@selector(openURL:) withObject:[NSURL URLWithString:customURL]];
//            [self.extensionContext completeRequestReturningItems:nil completionHandler:NULL];
//        }
//    }
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.quote.share"];
    [userDefaults setObject:self.note forKey:@"shareText"];
    //用于标记是新的分享
    [userDefaults setBool:YES forKey:@"newshare"];
}

//- (void)createScrollView{
//    self.noteScroll = [[UITextView alloc] initWithFrame:CGRectMake(0, 64, self.container.frame.size.width, 360)];
//    self.noteScroll.scrollEnabled = YES;
//    self.noteScroll.backgroundColor = [UIColor whiteColor];
//    self.noteScroll.editable = YES;
//    self.noteScroll.keyboardType = UIKeyboardTypeDefault;
//    self.noteScroll.returnKeyType = UIReturnKeyDefault;
//    [self.container addSubview:self.noteScroll];
//    self.noteScroll.text = self.note;
//}

@end
