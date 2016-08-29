//
//  ViewController.m
//  DynamicInfoView
//
//  Created by zjf on 16/8/29.
//  Copyright © 2016年 ctfo. All rights reserved.
//

#import "ViewController.h"
#import "TextVerticalFlowView.h"
#import "MLTableAlert.h"
#import "DyinfoModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 200, 30)];
    titleLabel.text = @"实时信息动态展示";
    [self.view addSubview:titleLabel];

    //创建动态信息view
    dynFlowView = [[TextVerticalFlowView alloc] initWithFrame:CGRectMake(10, 120, 390, 100) TextFont:[UIFont systemFontOfSize:18] TextColor:[UIColor blackColor] Text:@""];
    dynFlowView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:dynFlowView];
    //添加点击手势
    UITapGestureRecognizer * singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showOpDynaInfo:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    [dynFlowView addGestureRecognizer:singleTap];
}

- (void)showOpDynaInfo:(id)sender {
    NSMutableArray * opInfoArray = [NSMutableArray arrayWithObjects:@"111", @"222", @"333", @"444", @"555",@"666", @"777", @"888", @"999", @"101010", @"111111", nil];
    
    if (opInfoArray.count == 0) {
        return;
    }
    MLTableAlert * tbAlert = [[MLTableAlert alloc] initWithTitle:@"实时活动" cancelButtonTitle:@"取消" numberOfRows:^NSInteger(NSInteger section) {
        
        return opInfoArray.count;
        
    } andCells:^UITableViewCell *(MLTableAlert *alert, NSIndexPath *indexPath) {
        
        static NSString *CellIdentifier = @"CellIdentifier";
        UITableViewCell *cell = [alert.table dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            cell.textLabel.font = [UIFont systemFontOfSize:16];
            cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
            cell.textLabel.numberOfLines = 0;
            cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
        }
        //从model中获取message信息
        DyinfoModel *info = [opInfoArray objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@"dyninfo_nostop_station.png"];
        cell.textLabel.text = @"Information Title";
        cell.detailTextLabel.text = @"2016-08-29";
        cell.backgroundColor = [UIColor clearColor];
        return cell;
        
    } andCellHeight:^CGFloat(MLTableAlert *alert, NSIndexPath *indexPath) {
        //根据model获取的message信息，动态获取cell高度，此处固定使用40高度
        //DyinfoModel * info = [opInfoArray objectAtIndex:indexPath.row];
        //...
        return 50;
    }];
    tbAlert.height = 400;
    [tbAlert show];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //先查询一次
    [self timerFired];
    //然后每60s查询一次
    [self startTimer];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self stopTimer];
}

- (void)timerFired {
    //info信息可根据开发需求，从服务器请求获取
    NSString * info = @"• 家用电器大促销！\n\n• 家用电器大促销。\n\n• 家用电器大促销！\n\n• 生活用品大促销即将开始！\n\n• 生活用品大促销即将开始！\n\n• 生活用品大促销即将开始！\n\n• 电子产品预约活动-9月1日！\n\n• 电子产品预约活动-9月1日！\n\n• 电子产品预约活动-9月1日！\n\n• 电子产品预约活动-9月1日！\n\n";
    [dynFlowView setText:info];
}

- (void)startTimer {
    //开启定时器
    if (dynTimer == nil) {
        dynTimer = [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    }
}

- (void)stopTimer {
    if (dynTimer.isValid) {
        [dynTimer invalidate];
        dynTimer = nil;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
