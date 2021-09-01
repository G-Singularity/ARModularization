//
//  ViewController.m
//  ARModularization
//
//  Created by myth on 2/9/21.
//

#import "ViewController.h"
#import <HandyFrame/UIView+LayoutMethods.h>
#import "AViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *pushAViewControllerButton;

@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    [self.view addSubview:self.pushAViewControllerButton];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];

    [self.pushAViewControllerButton sizeToFit];
    [self.pushAViewControllerButton centerEqualToView:self.view];
}

#pragma mark - event response
- (void)didTappedPushAViewControllerButton:(UIButton *)button
{
    AViewController *viewController = [[AViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - getters and setters
- (UIButton *)pushAViewControllerButton
{
    if (_pushAViewControllerButton == nil) {
        _pushAViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pushAViewControllerButton setTitle:@"push A view controller" forState:UIControlStateNormal];
        [_pushAViewControllerButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_pushAViewControllerButton addTarget:self action:@selector(didTappedPushAViewControllerButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushAViewControllerButton;
}
@end
