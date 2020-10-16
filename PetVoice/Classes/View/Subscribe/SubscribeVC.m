//
//  SubscribeVC.m
//  PetVoice
//
//  Created by cc on 2020/9/9.
//  Copyright © 2020 cc0717. All rights reserved.
//

#import "SubscribeVC.h"
#import "ClauseVC.h"

@interface SubscribeVC ()
@property (weak, nonatomic) IBOutlet UIImageView *petImage;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;

@end

@implementation SubscribeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_isCat) {
        _petImage.image = [UIImage imageNamed:@"vip_cat"];
        _label1.text = @"解锁所有猫语";
        _label2.text = @"让你更懂小猫";
        
    }
    // Do any additional setup after loading the view from its nib.
}

//立即订阅
- (IBAction)subscribe:(id)sender {
}

//恢复购买
- (IBAction)recover:(id)sender {
}

//关闭
- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

//条款
- (IBAction)bottomBtn1:(id)sender {
    ClauseVC *vc = [[ClauseVC alloc] init];
    [self presentViewController:vc animated:NO completion:^{
        
    }];
}

//隐私
- (IBAction)bottomBtn2:(id)sender {
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
