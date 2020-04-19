//
//  ViewController.m
//  SystemControl
//
//  Created by Daniel on 2020/4/19.
//  Copyright © 2020 Daniel. All rights reserved.
//

#import "ViewController.h"
#import "SysInfoViewController.h"
#include <sys/types.h>
#include <sys/sysctl.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *sysInfoGoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sysInfoGoBtn.frame = CGRectMake(20, 100, 100, 50);
    [sysInfoGoBtn setTitle:@"SysInfo" forState:UIControlStateNormal];
    [sysInfoGoBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [sysInfoGoBtn addTarget:self action:@selector(goSysInfo:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sysInfoGoBtn];
    
//    
//    UILabel *cpuFreqLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, 100, 50)];
//    NSUInteger cpuFreq = [[self class] getCpuFrequency];
//    cpuFreqLabel.text = [NSString stringWithFormat:@"%@:%lud",@"CPU频率", (unsigned long)cpuFreq];
//    
//    [self.view addSubview:cpuFreqLabel];
    
    
}

- (IBAction)goSysInfo:(id)sender{
    SysInfoViewController *sysInfoVC = [[SysInfoViewController alloc] init];
    [self.navigationController pushViewController:sysInfoVC animated:YES];
}
//
//+ (NSUInteger)getSysInfo:(uint)typeSpecifier {
//    size_t size = sizeof(int);
//    int results;
//    int mib[2] = {CTL_HW, typeSpecifier};
//    sysctl(mib, 2, &results, &size, NULL, 0);
//    return (NSUInteger)results;
//}
//
//+ (NSUInteger)getCpuFrequency {
//    return [self getSysInfo:HW_CPU_FREQ];
//}


@end
