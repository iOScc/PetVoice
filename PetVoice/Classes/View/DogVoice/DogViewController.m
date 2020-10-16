//
//  DogViewController.m
//  PetVoice
//
//  Created by cc on 2020/9/9.
//  Copyright © 2020 cc0717. All rights reserved.
//

#import "DogViewController.h"
#import "PetVoiceCell.h"
#import "SubscribeVC.h"

@interface DogViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)NSMutableArray *dataArr;


@end

static const float margin = 10.0;

@implementation DogViewController

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, NavBarHeight + margin, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height - NavBarHeight - margin) collectionViewLayout:layout];
        [_collectionView registerClass:[PetVoiceCell class] forCellWithReuseIdentifier:@"myCell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithObjects:@"dog_paxia", @"dog_zuoxia", @"dog_tangxia", @"dog_guolai", @"dog_quchifan", @"dog_qushuijiao", @"dog_qulashi", @"dog_quweinai", nil];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置 ui
    [self setNavigationbar];
    [self setUI];
    // Do any additional setup after loading the view.
}

-(void)setUI {
    [self.view addSubview:self.collectionView];
}

- (void)setNavigationbar {

    //  左侧图片
    UIButton *moreBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [moreBtn setImage:[UIImage imageNamed:@"qiugouliang"] forState:UIControlStateNormal];
    UIBarButtonItem *moreItem  = [[UIBarButtonItem alloc] initWithCustomView:moreBtn];
    self.navigationItem.leftBarButtonItem = moreItem;
    
    UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"汪星语"] forState:UIControlStateNormal];
    button.frame=CGRectMake(0, 0, 100, 40);
    [button setTitle:@"点击播放" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize: 11.0];
    [button setTitleColor:[UIColor colorWithRed:190.0/255.0 green:105.0/255.0 blue:58.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    [button.superview layoutIfNeeded];
    //使图片和文字居左上角
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    CGFloat buttonHeight = CGRectGetHeight(button.frame);
    CGFloat buttonWidth = CGRectGetWidth(button.frame);
    
    CGFloat ivHeight = CGRectGetHeight(button.imageView.frame);
    CGFloat ivWidth = CGRectGetWidth(button.imageView.frame);
    
    CGFloat titleHeight = CGRectGetHeight(button.titleLabel.frame);
    CGFloat titleWidth = CGRectGetWidth(button.titleLabel.frame);
    //调整图片
    float iVOffsetY = buttonHeight / 2.0 - (ivHeight + titleHeight) / 2.0;
    float iVOffsetX = buttonWidth / 2.0 - ivWidth / 2.0;
    [button setImageEdgeInsets:UIEdgeInsetsMake(iVOffsetY, iVOffsetX, 0, 0)];
    
    //调整文字
    float titleOffsetY = iVOffsetY + CGRectGetHeight(button.imageView.frame) + 10;
    float titleOffsetX = 0;
    if (CGRectGetWidth(button.imageView.frame) >= (CGRectGetWidth(button.frame) / 2.0)) {
        //如果图片的宽度超过或等于button宽度的一半
        titleOffsetX = -(ivWidth + titleWidth - buttonWidth / 2.0 - titleWidth / 2.0);
    }else {
        titleOffsetX = buttonWidth / 2.0 - ivWidth - titleWidth / 2.0;
    }
    [button setTitleEdgeInsets:UIEdgeInsetsMake(titleOffsetY , titleOffsetX, 0, 0)];
    
    
    self.navigationItem.titleView =button;

    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];


}


#pragma mark UICollectionViewDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((SCREEN_WIDTH - 3 * margin) / 2, (SCREEN_WIDTH - 3 * margin) / 2 * 0.65);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PetVoiceCell *cell = (PetVoiceCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    cell.bigImageView.image = [UIImage imageNamed:self.dataArr[indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SubscribeVC *subscribe = [[SubscribeVC alloc] init];
    [self presentViewController:subscribe animated:YES completion:^{
        
    }];
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
