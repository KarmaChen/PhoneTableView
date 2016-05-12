//
//  ViewController.m
//  PhoneTablevVew
//
//  Created by Karma on 16/5/12.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

#import "ViewController.h"
#import "PhoneTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _tableView;
    NSMutableArray *_time;
    NSMutableArray *_name;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_tableView];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
}
-(NSMutableArray *)name{
    if (_name ==nil) {
        _name=[NSMutableArray array];
        for (int i =0; i<20; i++) {
            NSString *nameString =[NSString stringWithFormat:@"%d",arc4random_uniform(100000)];
            [_name addObject:nameString];
        }
    }
    return _name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.name.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID=@"cell";
    PhoneTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell =[[[NSBundle mainBundle]loadNibNamed:@"PhoneTableViewCell" owner:self options:nil]lastObject];
    }
   
    return cell;
    
}
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *action1=[UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self.name removeObjectAtIndex:indexPath.row];
        [_tableView reloadData];
    }];
    NSString *action=@[action1];
    return action;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%i",indexPath.row);
}


@end
