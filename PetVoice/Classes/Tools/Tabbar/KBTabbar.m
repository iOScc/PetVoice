

#import "KBTabbar.h"

@implementation KBTabbar


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tab_fanyiguan"] forState:UIControlStateNormal];

        [btn setImage:[UIImage imageNamed:@"tab_xuanzhongfanyiguan"] forState:UIControlStateSelected];

        btn.bounds = CGRectMake(0, 0, 47, 47);
        self.centerBtn = btn;
        [self addSubview:btn];
   
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 60, 30)];
        label.text = @"翻译官";
        label.font = [UIFont systemFontOfSize:11];
        label.textColor = [UIColor colorWithRed:190.0/255.0 green:105.0/255.0 blue:58.0/255.0 alpha:1];
        label.textAlignment = NSTextAlignmentCenter;
        self.centerLabel = label;
        [self addSubview:label];
 
        
    }
    return self;
}

- (void)layoutSubviews
{
    
    [super layoutSubviews];
    
    float scale1 = 0;
    float scale2 = 0;
    
    if (IS_iPhoneX) {
        scale1 = 0.4;
        scale2 = 0.9;
    } else {
        scale1 = 0.2;
        scale2 = 0.8;
    }
    
    self.centerBtn.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * scale1);
    self.centerLabel.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * scale2);
    
    int index = 0;
    CGFloat wigth = self.bounds.size.width / 3;
    
    for (UIView* sub in self.subviews) {
        
        if ([sub isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            sub.frame = CGRectMake(index * wigth, self.bounds.origin.y, wigth, self.bounds.size.height - 2);
            
            index++;
            
            if (index == 1) {
                index++;
            }
        }
    }
}



- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {

    if (self.isHidden == NO) {

        CGPoint newPoint = [self convertPoint:point toView:self.centerBtn];

        if ( [self.centerBtn pointInside:newPoint withEvent:event]) {
            return self.centerBtn;
        }else{

            return [super hitTest:point withEvent:event];
        }
    }

    else {
        return [super hitTest:point withEvent:event];
    }
}



@end
