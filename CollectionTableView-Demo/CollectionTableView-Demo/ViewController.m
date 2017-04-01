//
//  ViewController.m
//  CollectionTableView-Demo
//
//  Created by 李杰 on 2017/4/1.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import "ViewController.h"
#import "CollectionInTableProtocol.h"
#import "CollectionTableViewCell.h"
#import "UITableView+JLeeCollectionTable.h"
#import "CollectionTableView.h"
#import "CollectionItem.h"

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width


@interface ViewController () <CollectionTableViewDelegate, UITableViewDataSource>

/** tableView */
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupTableView];
}


//创建tableView
- (void)setupTableView
{
    /**
     创建列表，设置大小，并设置样式
     */
    self.tableView = [[CollectionTableView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth, kScreenHeight ) style:UITableViewStylePlain];
    
    //代理和数据源
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
//    //取消自带分割线
//    _tableView.separatorStyle = NO;
    
    //隐藏滚动条
    _tableView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:_tableView];
}

#pragma mark - tableView delegate
//setion个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

//row个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

//section头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}


//section尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
    
        static NSString *cellIdentify =  @"cellIdentify";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
        if (!cell)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
        }
        
        //取消点击cell的效果
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.backgroundColor = [UIColor yellowColor];
        
        return cell;
        
    }
    else{
        
        static NSString *cellIdentify =  @"CollectionTableViewCell";
        
        CollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
        if (!cell)
        {
            cell =  [[CollectionTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
        }
        CollectionItem *item = [[CollectionItem alloc]init];
        [cell confirmItem:item] ;
        
        [item loadData:nil];
        
        
        cell.backgroundColor = [UIColor redColor];
        
        return cell;
    }
}


- (NSUInteger)numberOfCollectionViewCellInTableViewCell
{
    return 3;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
