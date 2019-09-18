//
//  ShareViewController.m
//  QNoteShare
//
//  Created by 游星辉 on 2019/7/30.
//  Copyright © 2019 starccode. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()
//@property (nonatomic, strong) NSMutableArray *imagesArr;
//@property (nonatomic, strong) NSAttributedString *note;
@property (nonatomic, strong) NSString *note;
@property (nonatomic, strong) UIView *container;
@property (nonatomic, strong) UIView *bar;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) UITextView *noteScroll;
//@property (nonatomic, strong) UIScrollView *bigImageScroll;
@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareUI];
    
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    self.cancelButton.tintColor = [UIColor orangeColor];
    self.cancelButton.frame = CGRectMake(10, 22, 50, 20);
    [self.bar addSubview:self.cancelButton];
    [self.cancelButton addTarget:self action:@selector(cancelButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.saveButton setTitle:@"记录" forState:UIControlStateNormal];
    self.saveButton.tintColor = [UIColor orangeColor];
    self.saveButton.frame = CGRectMake(self.container.frame.size.width-60, 22, 50, 20);
    [self.bar addSubview:self.saveButton];
    [self.saveButton addTarget:self action:@selector(postButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //获取需要分享的笔记
        for (NSExtensionItem *item in self.extensionContext.inputItems) {
            //文字笔记
            self.note = [item.attributedContentText string];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self createScrollView];
            });
        }
    });
}

-(void)prepareUI {
    self.view.backgroundColor = [UIColor colorWithRed:0.00 green:0.00 blue:0.00 alpha:0.5];

    self.container = [[UIView alloc] initWithFrame:CGRectMake(30, [UIScreen mainScreen].bounds.size.height/2-200, [UIScreen mainScreen].bounds.size.width-60, 400)];
    
    self.container.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.container];

    self.bar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-60, 40)];
    self.bar.backgroundColor = [UIColor lightGrayColor];
    [self.container addSubview:self.bar];

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

- (void)createScrollView{
    self.noteScroll = [[UITextView alloc] initWithFrame:CGRectMake(0, 64, self.container.frame.size.width, 360)];
    self.noteScroll.scrollEnabled = YES;
    self.noteScroll.backgroundColor = [UIColor whiteColor];
    self.noteScroll.editable = YES;
    self.noteScroll.keyboardType = UIKeyboardTypeDefault;
    self.noteScroll.returnKeyType = UIReturnKeyDefault;
    [self.container addSubview:self.noteScroll];
    self.noteScroll.text = self.note;
}

@end
