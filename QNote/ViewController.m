//
//  ViewController.m
//  QNote
//
//  Created by 游星辉 on 2019/7/29.
//  Copyright © 2019 starccode. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *CalenderView;
@property(nonatomic, strong) NSMutableArray *notePage;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self prepareUI];
//    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.quote.share"];
//    NSString *note = [userDefaults objectForKey:@"shareText"];
//    NSLog(@"%@", note);
}

- (void)prepareUI {
    for(int i = 1; i <= 3; i++) {
        UITableView *page = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height)];
        [self.scrollView addSubview:page];
    }
    self.scrollView.contentSize = CGSizeMake(3 * self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
}


@end
