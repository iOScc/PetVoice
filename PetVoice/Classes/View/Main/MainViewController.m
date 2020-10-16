//
//  MainViewController.m
//  PetVoice
//
//  Created by cc on 2020/9/9.
//  Copyright © 2020 cc0717. All rights reserved.
//

#import "MainViewController.h"
#import "KBTabbar.h"
#import "CatViewController.h"
#import "DogViewController.h"
#import "TranslatorViewController.h"
#import "SubscribeVC.h"

@interface MainViewController ()<UITabBarControllerDelegate>

@property (nonatomic, strong)KBTabbar *kbTabbar;


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    
    [self setSelectedIndex:2];
    NSLog(@"2020年10月16日");
    // Do any additional setup after loading the view.
}

- (void)cctest {
    NSLog(@"2020年10月16日10:31:45");
}

- (void)setUI {
    
        DogViewController *dog = [[DogViewController alloc] init];  //蓝色
        [self addChildController:dog title:@"汪星语" imageName:@"tab_wangxingyu" selectedImageName:@"tab_xuanzhongwangxingyu" navVc:[UINavigationController class]];
    
        CatViewController *cat = [[CatViewController alloc] init];   //绿色
        [self addChildController:cat title:@"喵星语" imageName:@"tab_miaoxingyu" selectedImageName:@"tab_xuanzhong_miaoxingyu" navVc:[UINavigationController class]];
    

        TranslatorViewController *translator = [[TranslatorViewController alloc] init];   //红色
        [self addChildController:translator title:@"翻译官" imageName:@"tab4-more" selectedImageName:@"tab4-moreshow" navVc:[UINavigationController class]];

        
        
        [[UITabBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor]]];
        //  设置tabbar
        [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];

        // 设置自定义的tabbar
        [self setCustomtabbar];
}


- (void)setCustomtabbar{

    KBTabbar *tabbar = [[KBTabbar alloc]init];
    
    [self setValue:tabbar forKeyPath:@"tabBar"];
    
    tabbar.centerBtn.selected = YES;
    
    self.kbTabbar = tabbar;
    
    self.delegate = self;

    [tabbar.centerBtn addTarget:self action:@selector(centerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    

}

- (void)centerBtnClick:(UIButton *)btn{

    
//    NSLog(@"点击了中间");
//
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"点击了中间按钮" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//
//    [alert show];
    self.kbTabbar.centerBtn.selected = YES;
    self.kbTabbar.centerLabel.textColor = [UIColor colorWithRed:190.0/255.0 green:105.0/255.0 blue:58.0/255.0 alpha:1];
    [self setSelectedIndex:2];
    

}

- (void)addChildController:(UIViewController*)childController title:(NSString*)title imageName:(NSString*)imageName selectedImageName:(NSString*)selectedImageName navVc:(Class)navVc
{
    
    childController.title = title;
    childController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置一下选中tabbar文字颜色
    
    [childController.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:190.0/255.0 green:105.0/255.0 blue:58.0/255.0 alpha:1] }forState:UIControlStateSelected];
    
    UINavigationController* nav = [[navVc alloc] initWithRootViewController:childController];
    
    [self addChildViewController:nav];
}

- (UIImage *)imageWithColor:(UIColor *)color{
    // 一个像素
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - UITabBarControllerDelegate 代理
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    self.kbTabbar.centerBtn.selected = (tabBarController.selectedIndex == 2);
    self.kbTabbar.centerLabel.textColor = [UIColor grayColor];
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
