//
//  ViewController.m
//  QNote
//
//  Created by 游星辉 on 2019/7/29.
//  Copyright © 2019 starccode. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *notePage;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation ViewController

-(NSArray *) dataSource {
    if(!_dataSource) {
        _dataSource = [NSMutableArray arrayWithObjects:@"first",@"second",@"third", nil];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.notePage.delegate = self;
    self.notePage.dataSource = self;
    [self.notePage setEditing:YES animated:YES];
    for (NSString *familyName in UIFont.familyNames) {
        NSLog(@"FontFamily : %@", familyName);
        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
            NSLog(@"%@ : %@", familyName, fontName);
        }
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    NSLog(@"%@", cell.textLabel.text);
    //cell.backgroundColor = [UIColor blackColor];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleNone;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //修改数据源
    //[_dataSource exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    NSString *source = [_dataSource objectAtIndex:sourceIndexPath.row];
    NSString *destination = [_dataSource objectAtIndex:destinationIndexPath.row];
    [_dataSource replaceObjectAtIndex:sourceIndexPath.row withObject:source];
    [_dataSource replaceObjectAtIndex:destinationIndexPath.row withObject:destination];
    //让表视图对应的行进行移动
    [tableView exchangeSubviewAtIndex:sourceIndexPath.row withSubviewAtIndex:destinationIndexPath.row];
}

@end
