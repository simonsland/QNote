//
//  ShareViewController.m
//  QNoteShare
//
//  Created by 游星辉 on 2019/7/30.
//  Copyright © 2019 starccode. All rights reserved.
//

#import "ShareViewController.h"
#import "UIImageEffects.h"
#import "HeaderViewForShareTableView.h"
#import <Masonry.h>

@interface ShareViewController () <QMUITableViewDelegate, QMUITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *sectionTitle;
@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(70, 20, 0, 20));
    }];
}

- (NSArray *)sectionTitle {
    if(!_sectionTitle) {
        _sectionTitle = [NSArray arrayWithObjects:@"笔记",@"标签",@"心得",@"出处", nil];
    }
    return _sectionTitle;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sectionTitle count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath { 
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HeaderViewForShareTableView *header = [[HeaderViewForShareTableView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 30)];
    header.title = [_sectionTitle objectAtIndex:section];
    return header;
}

- (void)cancelButtonAction {
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
    //    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.quote.share"];
    //    [userDefaults setObject:self.note forKey:@"shareText"];
    //    //用于标记是新的分享
    //    [userDefaults setBool:YES forKey:@"newshare"];
}

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

@end
