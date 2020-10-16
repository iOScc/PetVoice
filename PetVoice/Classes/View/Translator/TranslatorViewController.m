//
//  TranslatorViewController.m
//  PetVoice
//
//  Created by cc on 2020/9/9.
//  Copyright © 2020 cc0717. All rights reserved.
//

#import "TranslatorViewController.h"
#import "SubscribeVC.h"
#import "TranslatorCell.h"
#import "CatViewController.h"
#import "ClauseVC.h"


@interface TranslatorViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataArr;
@property (nonatomic, assign)BOOL isCat;


@end

static const float BtnH = 32;
static const float BtnViewW = 136;
static const float margin = 30;
@implementation TranslatorViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NavBarHeight + BtnH + margin, SCREEN_WIDTH, SCREEN_HEIGHT - BtnH - margin - margin) style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:@"TranslatorCell" bundle:nil] forCellReuseIdentifier:@"TRANSLATOR"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 150;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
        
    }
    
    return _tableView;
}

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithObjects:@"fanyiguan_goushengzhuanrenyu_beijing", @"fanyiguan_renshengzhuangouyu_beijing", nil];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self setNavigationbar];
    [self setBtn];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}


- (void)setNavigationbar {

    //  左侧图片
    UIButton *moreBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [moreBtn setImage:[UIImage imageNamed:@"qiugouliang"] forState:UIControlStateNormal];
    UIBarButtonItem *moreItem  = [[UIBarButtonItem alloc] initWithCustomView:moreBtn];
    self.navigationItem.leftBarButtonItem = moreItem;

    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    
    self.navigationItem.title = @"";


}

#pragma mark 顶部按钮
- (void)setBtn {
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, BtnViewW, BtnH)];
    backView.center = CGPointMake(self.view.bounds.size.width/2, 100);
    backView.layer.cornerRadius = BtnH / 2;
     backView.layer.masksToBounds = YES;
    backView.layer.borderWidth = 1;
    backView.layer.borderColor = [[UIColor colorWithRed:190.0/255.0 green:105.0/255.0 blue:58.0/255.0 alpha:1] CGColor];
    [self.view addSubview:backView];
    
    //狗狗语
    UIButton *dogBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    dogBtn.tag = 110;
    dogBtn.frame = CGRectMake(0 , 0, BtnViewW/2 , BtnH );
    [dogBtn setTitle:@"狗语" forState:UIControlStateNormal];
    [dogBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    dogBtn.backgroundColor = [UIColor colorWithRed:190.0/255.0 green:105.0/255.0 blue:58.0/255.0 alpha:1];
    dogBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [dogBtn addTarget:self action:@selector(godBtn) forControlEvents:UIControlEventTouchUpInside];
    
    dogBtn.layer.cornerRadius = BtnH / 2;
     dogBtn.layer.masksToBounds = YES;
    
    [backView addSubview:dogBtn];
    
    
    //猫语
    UIButton *catBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    catBtn.tag = 111;
    catBtn.frame = CGRectMake(dogBtn.frame.size.width , 0, BtnViewW/2, BtnH );
    [catBtn setTitle:@"猫语" forState:UIControlStateNormal];
    [catBtn setTitleColor:[UIColor colorWithRed:190.0/255.0 green:105.0/255.0 blue:58.0/255.0 alpha:1] forState:UIControlStateNormal];
    catBtn.backgroundColor = [UIColor whiteColor];
    catBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [catBtn addTarget:self action:@selector(catBtn) forControlEvents:UIControlEventTouchUpInside];

    
    catBtn.layer.cornerRadius = BtnH  / 2;
     catBtn.layer.masksToBounds = YES;
    
    [backView addSubview:catBtn];
}

- (void)godBtn {
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:110];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn1.backgroundColor =[UIColor colorWithRed:190.0/255.0 green:105.0/255.0 blue:58.0/255.0 alpha:1];
    
    UIButton *btn2 = (UIButton *)[self.view viewWithTag:111];
    [btn2 setTitleColor:[UIColor colorWithRed:190.0/255.0 green:105.0/255.0 blue:58.0/255.0 alpha:1] forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor whiteColor];
    
    [_dataArr removeAllObjects];
    [_dataArr addObject:@"fanyiguan_goushengzhuanrenyu_beijing"];
    [_dataArr addObject:@"fanyiguan_renshengzhuangouyu_beijing"];
    [_tableView reloadData];
    _isCat = NO;
}

- (void)catBtn {
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:110];
    [btn1 setTitleColor:[UIColor colorWithRed:190.0/255.0 green:105.0/255.0 blue:58.0/255.0 alpha:1] forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn2 = (UIButton *)[self.view viewWithTag:111];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor colorWithRed:190.0/255.0 green:105.0/255.0 blue:58.0/255.0 alpha:1];
    
    [_dataArr removeAllObjects];
    [_dataArr addObject:@"fanyiguan_maoshengzhuanrensheng_beijing"];
    [_dataArr addObject:@"fanyiguan_renshengzhuangouyu_beijing"];
    [_tableView reloadData];
    _isCat = YES;
    
}

#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TranslatorCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TRANSLATOR"];
    cell.leftImage.image = [UIImage imageNamed:self.dataArr[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    
    dispatch_async(dispatch_get_main_queue(), ^{

        SubscribeVC *subscribe = [[SubscribeVC alloc] init];
        subscribe.isCat = self->_isCat;
        [self presentViewController:subscribe animated:YES completion:nil];
        

    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
