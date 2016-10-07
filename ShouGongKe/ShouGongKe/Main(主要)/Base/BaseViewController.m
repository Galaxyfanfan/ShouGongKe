//
//  BaseViewController.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/9.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "BaseViewController.h"

// 自定义左右导航栏按钮大小
static CGFloat const sizeButton = 40.0;
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.hidesBottomBarWhenPushed = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
    
    self.hidesBottomBarWhenPushed = [self isNavRoot] ? NO : YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBar];
    [self hiddenNavBlackLine];
}

- (void)setNavBar{
    NSDictionary* attrs =  @{ NSForegroundColorAttributeName:[UIColor whiteColor],
                              NSFontAttributeName: [UIFont systemFontOfSize:18]
                              };
    
    self.navigationController.navigationBar.titleTextAttributes = attrs;
    [self.navigationController.navigationBar setBarTintColor:kBaseRedColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.hidesBackButton = YES;
}

//隐藏navigationBar底部黑线
- (void)hiddenNavBlackLine{
    //NavigationBar底部的黑线是一个UIImageView上的UIImageView。
    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
        NSArray *list=self.navigationController.navigationBar.subviews;
        for (id obj in list) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView=(UIImageView *)obj;
                NSArray *list2=imageView.subviews;
                for (id obj2 in list2) {
                    if ([obj2 isKindOfClass:[UIImageView class]]) {
                        UIImageView *imageView2=(UIImageView *)obj2;
                        imageView2.hidden=YES;
                    }
                }
            }
        }
    }
}

// 当前视图是否是根视图
- (BOOL)isNavRoot{
    return self.navigationController.viewControllers.firstObject == self;
}


#pragma mark - 设置NavBarItem
// 设置导航栏左按钮，是否高亮
+ (UIBarButtonItem *)leftBarButtonWithName:(NSString *)name
                                 imageName:(NSString *)imageName
                                    target:(id)target
                                    action:(SEL)action
{
    UIButton *button = [[self class] setleftButtonTitle:name image:imageName];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    return leftButton;
}

// 导航栏左按钮
+ (UIButton *)setleftButtonTitle:(NSString *)name image:(NSString *)imageName
{
    CGRect buttonFrame;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    button.accessibilityLabel = @"back";
    if (imageName && 0 != imageName.length)
    {
        UIImage *image = [UIImage imageNamed:imageName];
        buttonFrame = CGRectMake(0.0, 0.0, sizeButton * image.size.width / image.size.height, sizeButton);
        [button setImage:image forState:UIControlStateNormal];
        [button setImageEdgeInsets:UIEdgeInsetsMake(0, -25, 0, 0)];
    }
    else
    {
        buttonFrame = CGRectMake(0.0, 0.0, 40.0, sizeButton);
    }
    button.frame = buttonFrame;
    
    if (name && ![name isEqualToString:@""])
    {
        [button setTitle:name forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return button;
}

// 设置导航栏右按钮
+ (UIBarButtonItem *)rightBarButtonWithName:(NSString *)name
                                  imageName:(NSString *)imageName
                                     target:(id)target
                                     action:(SEL)action
{
    UIButton *btn = [[self class] setRightButton:name image:imageName];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

+ (UIButton *)setRightButton:(NSString *)name image:(NSString *)imageName
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (imageName && ![imageName isEqualToString:@""])
    {
        UIImage *image = [UIImage imageNamed:imageName]; // [UIImage imageWithName:imageName];
        [button setImage:image forState:UIControlStateNormal];
        
        NSString *images = [NSString stringWithFormat:@"%@_s", imageName];
        UIImage *imageSelected = [UIImage imageNamed:images]; // [UIImage imageWithName:[NSString stringWithFormat:@"%@_s",imageName]];
        if (imageSelected)
        {
            [button setImage:imageSelected forState:UIControlStateSelected];
        }
        
        button.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    }
    else
    {
        button.frame = CGRectMake(0, 0, 50, sizeButton);
    }
    
    if (name && ![name isEqualToString:@""])
    {
        [button setTitle:name forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 13, 0, 0);
    
    return button;
}



#pragma mark - 设置导航栏 添加 和 搜索 按钮
// 设置导航栏左按钮
- (UIBarButtonItem *)leftBarButtonWithAdd{
    UIButton *btn = [[self class] setleftButtonTitle:nil image:@"write"];
    [btn addTarget:self action:@selector(gotoAdd) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}
// 设置导航栏右按钮
- (UIBarButtonItem *)rightBarButtonWithSearch{
    UIButton *btn = [[self class] setRightButton:nil image:@"search"];
    [btn addTarget:self action:@selector(goToSearch) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}
- (void)gotoAdd{
    NSLog(@"添加");
}
- (void)goToSearch{
    NSLog(@"搜索");
}


@end
