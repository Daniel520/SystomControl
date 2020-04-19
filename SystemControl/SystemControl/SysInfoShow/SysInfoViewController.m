//
//  ViewController.m
//  SystemControl
//
//  Created by Daniel on 2020/4/19.
//  Copyright © 2020 Daniel. All rights reserved.
//


#import "SysInfoViewController.h"
#include <sys/types.h>
#include <sys/sysctl.h>

#define CELL_ID @"SysInfoID"

typedef enum{
    TYPE_INT32,
    TYPE_UINT32,
    TYPE_INT64,
    TYPE_UINT64,
    TYPE_String
}SysInfoType;

//extern int freqTest(int cycles);
//
//static double GetCPUFrequency(void)
//{
//    volatile NSTimeInterval times[500];
//
//    int sum = 0;
//
//    for(int i = 0; i < 500; i++)
//    {
//        times[i] = [[NSProcessInfo processInfo] systemUptime];
//        sum += freqTest(10000);
//        times[i] = [[NSProcessInfo processInfo] systemUptime] - times[i];
//    }
//
//    NSTimeInterval time = times[0];
//    for(int i = 1; i < 500; i++)
//    {
//        if(time > times[i])
//            time = times[i];
//    }
//
//    double freq = 1300000.0 / time;
//    return freq;
//}

static double GetCPUFrequency(void)
{
    volatile NSTimeInterval times[500] = {0.0};
    
//    int sum = 0;
    
    for(int i = 0; i < 500; i++)
    {
        times[i] = [[NSProcessInfo processInfo] systemUptime];
//#if 0
//        sum += freqTest(10000);
//#else
        int count = 10000;
        __asm volatile(
                 "0:"
                     //loop 1
                     "add     x2,  x2,  x1  \n"
                     "add     x3,  x3,  x2  \n"
                     "add     x4,  x4,  x3  \n"
                     "add     x5,  x5,  x4  \n"
                     "add     x6,  x6,  x5  \n"
                     "add     x7,  x7,  x6  \n"
                     "add     x8,  x8,  x7  \n"
                     "add     x9,  x9,  x8  \n"
                     "add     x10, x10, x9  \n"
                     "add     x11, x11, x10 \n"
                     "add     x12, x12, x11 \n"
                     "add     x14, x14, x12 \n"
                     "add     x1,  x1,  x14 \n"
                     
                     //loop 2
                     "add     x2,  x2,  x1  \n"
                     "add     x3,  x3,  x2  \n"
                     "add     x4,  x4,  x3  \n"
                     "add     x5,  x5,  x4  \n"
                     "add     x6,  x6,  x5  \n"
                     "add     x7,  x7,  x6  \n"
                     "add     x8,  x8,  x7  \n"
                     "add     x9,  x9,  x8  \n"
                     "add     x10, x10, x9  \n"
                     "add     x11, x11, x10 \n"
                     "add     x12, x12, x11 \n"
                     "add     x14, x14, x12 \n"
                     "add     x1,  x1,  x14 \n"
                     
                     //loop 3
                     "add     x2,  x2,  x1  \n"
                     "add     x3,  x3,  x2  \n"
                     "add     x4,  x4,  x3  \n"
                     "add     x5,  x5,  x4  \n"
                     "add     x6,  x6,  x5  \n"
                     "add     x7,  x7,  x6  \n"
                     "add     x8,  x8,  x7  \n"
                     "add     x9,  x9,  x8  \n"
                     "add     x10, x10, x9  \n"
                     "add     x11, x11, x10 \n"
                     "add     x12, x12, x11 \n"
                     "add     x14, x14, x12 \n"
                     "add     x1,  x1,  x14 \n"
                     
                     //loop 4
                     "add     x2,  x2,  x1  \n"
                     "add     x3,  x3,  x2  \n"
                     "add     x4,  x4,  x3  \n"
                     "add     x5,  x5,  x4  \n"
                     "add     x6,  x6,  x5  \n"
                     "add     x7,  x7,  x6  \n"
                     "add     x8,  x8,  x7  \n"
                     "add     x9,  x9,  x8  \n"
                     "add     x10, x10, x9  \n"
                     "add     x11, x11, x10 \n"
                     "add     x12, x12, x11 \n"
                     "add     x14, x14, x12 \n"
                     "add     x1,  x1,  x14 \n"
                     
                     //loop 5
                     "add     x2,  x2,  x1  \n"
                     "add     x3,  x3,  x2  \n"
                     "add     x4,  x4,  x3  \n"
                     "add     x5,  x5,  x4  \n"
                     "add     x6,  x6,  x5  \n"
                     "add     x7,  x7,  x6  \n"
                     "add     x8,  x8,  x7  \n"
                     "add     x9,  x9,  x8  \n"
                     "add     x10, x10, x9  \n"
                     "add     x11, x11, x10 \n"
                     "add     x12, x12, x11 \n"
                     "add     x14, x14, x12 \n"
                     "add     x1,  x1,  x14 \n"
                     
                     //loop 6
                     "add     x2,  x2,  x1  \n"
                     "add     x3,  x3,  x2  \n"
                     "add     x4,  x4,  x3  \n"
                     "add     x5,  x5,  x4  \n"
                     "add     x6,  x6,  x5  \n"
                     "add     x7,  x7,  x6  \n"
                     "add     x8,  x8,  x7  \n"
                     "add     x9,  x9,  x8  \n"
                     "add     x10, x10, x9  \n"
                     "add     x11, x11, x10 \n"
                     "add     x12, x12, x11 \n"
                     "add     x14, x14, x12 \n"
                     "add     x1,  x1,  x14 \n"
                     
                     //loop 7
                     "add     x2,  x2,  x1  \n"
                     "add     x3,  x3,  x2  \n"
                     "add     x4,  x4,  x3  \n"
                     "add     x5,  x5,  x4  \n"
                     "add     x6,  x6,  x5  \n"
                     "add     x7,  x7,  x6  \n"
                     "add     x8,  x8,  x7  \n"
                     "add     x9,  x9,  x8  \n"
                     "add     x10, x10, x9  \n"
                     "add     x11, x11, x10 \n"
                     "add     x12, x12, x11 \n"
                     "add     x14, x14, x12 \n"
                     "add     x1,  x1,  x14 \n"
                     
                     //loop 8
                     "add     x2,  x2,  x1  \n"
                     "add     x3,  x3,  x2  \n"
                     "add     x4,  x4,  x3  \n"
                     "add     x5,  x5,  x4  \n"
                     "add     x6,  x6,  x5  \n"
                     "add     x7,  x7,  x6  \n"
                     "add     x8,  x8,  x7  \n"
                     "add     x9,  x9,  x8  \n"
                     "add     x10, x10, x9  \n"
                     "add     x11, x11, x10 \n"
                     "add     x12, x12, x11 \n"
                     "add     x14, x14, x12 \n"
                     "add     x1,  x1,  x14 \n"
                     
                     //loop 9
                     "add     x2,  x2,  x1  \n"
                     "add     x3,  x3,  x2  \n"
                     "add     x4,  x4,  x3  \n"
                     "add     x5,  x5,  x4  \n"
                     "add     x6,  x6,  x5  \n"
                     "add     x7,  x7,  x6  \n"
                     "add     x8,  x8,  x7  \n"
                     "add     x9,  x9,  x8  \n"
                     "add     x10, x10, x9  \n"
                     "add     x11, x11, x10 \n"
                     "add     x12, x12, x11 \n"
                     "add     x14, x14, x12 \n"
                     "add     x1,  x1,  x14 \n"
                     
                     //loop q10
                     "add     x2,  x2,  x1  \n"
                     "add     x3,  x3,  x2  \n"
                     "add     x4,  x4,  x3  \n"
                     "add     x5,  x5,  x4  \n"
                     "add     x6,  x6,  x5  \n"
                     "add     x7,  x7,  x6  \n"
                     "add     x8,  x8,  x7  \n"
                     "add     x9,  x9,  x8  \n"
                     "add     x10, x10, x9  \n"
                     "add     x11, x11, x10 \n"
                     "add     x12, x12, x11 \n"
                     "add     x14, x14, x12 \n"
                     "add     x1,  x1,  x14 \n"
                     
                     "subs    %x0, %x0, #1  \n"
                     "bne     0b            \n"
                     
                     :
                     "=r"(count)
                     :
                     "0"(count)
                     : "cc", "memory", "x1", "x2", "x3","x4", "x5",  "x6", "x7", "x8","x9", "x10",  "x11", "x12", "x13","x14"
                     );
//#endif
//        times[i] = 1000.0*([[NSProcessInfo processInfo] systemUptime] - times[i]);//for ms
        times[i] = [[NSProcessInfo processInfo] systemUptime] - times[i];
    }
    
    NSTimeInterval time = times[0];
    for(int i = 1; i < 500; i++)
    {
        if(time > times[i])
            time = times[i];
    }
    
    double freq = 1300000.0 / time;
    return freq;
}

@interface SysInfoViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, strong) NSDictionary *sysctl_hw;

@property (nonatomic, strong) NSArray *typeArr;

@end

@implementation SysInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *sysctl_hw = @{
        @"hw.activecpu": @"int32",
        @"hw.byteorder": @"int32",
        @"hw.cacheconfig": @"uint64",
        @"hw.cpu64bit_capabile": @"int32",
        @"hw.cpufamily": @"uint32",
        @"hw.cpufrequency": @"int64",
        @"hw.cpufrequency_max": @"int64",
        @"hw.cpufrequency_min":  @"int64",
        @"hw.cpusubtype": @"int32",
        @"hw.cputhreadtype": @"int32",
        @"hw.cputype": @"int32x",
        @"hw.l1dcachesize": @"int64",
        @"hw.l1icachesize": @"int64",
        @"hw.l2cachesize": @"int64",
        @"hw.l3cachesize": @"int64",
        @"hw.logiccpu": @"int32",
        @"hw.logiccpu_max": @"int32",
        @"hw.machine": @"string",
        @"hw.memsize": @"int64",
        @"hw.model": @"string",
        @"hw.ncpu": @"int32",
        @"hw.packages": @"int32",
        @"hw.pagesize": @"int32",
        @"hw.physicalcpu": @"int32",
        @"hw.physicalcpu_max": @"int32",
        @"hw.tbfrequency": @"int64"
    };
    
    NSArray *typeArr = @[@"int32",@"uint32",@"int64",@"uint64",@"string"];
    
    self.sysctl_hw = sysctl_hw;
    self.typeArr = typeArr;
    
    self.mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    
    [self.view addSubview:self.mainTableView];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sysctl_hw.allKeys.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID];
    }
    
    NSString *key = [[self.sysctl_hw.allKeys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        return [obj1 compare:obj2];
    }] objectAtIndex:indexPath.row];
    
//    NSString *key = [self.sysctl_hw.allKeys objectAtIndex:indexPath.row];
    
    NSString *content = [self getSysContentDesWithKey:key Type:[self.sysctl_hw objectForKey:key]];
    
    cell.textLabel.text = content;
    
    return cell;
}

- (NSString*)getSysContentDesWithKey:(NSString*)key Type:(NSString*)type
{
    NSString *content = nil;
    size_t size;
    //Get the size first
    sysctlbyname([key cStringUsingEncoding:NSUTF8StringEncoding], nil , &size, nil, 0);
//    if (ret < 0) {
//         return [NSString stringWithFormat:@"%@:%@",key,@"No Type Value"];
//    }
    
    switch ([self.typeArr indexOfObject:type]) {
        case TYPE_INT32:
        {
            int32_t value;
            sysctlbyname([key cStringUsingEncoding:NSUTF8StringEncoding], &value, &size, nil, 0);
            content = [NSString stringWithFormat:@"%@:%d",key,value];
        }
            break;
        case TYPE_UINT32:
        {
            uint32_t value;
            sysctlbyname([key cStringUsingEncoding:NSUTF8StringEncoding], &value, &size, nil, 0);
            content = [NSString stringWithFormat:@"%@:%ud",key,value];
        }
            break;
        case TYPE_INT64:
        {
            if ([key isEqualToString:@"hw.cpufrequency"]) {
                double value = GetCPUFrequency();
                //1GHZ = 1000MHZ,1MHZ = 1000KHZ,1KHZ = 1000HZ
                value = value / 1000 / 1000 / 1000;
                content = [NSString stringWithFormat:@"%@:%.4fGHZ",key,value];
            }else{
                int64_t value;
                sysctlbyname([key cStringUsingEncoding:NSUTF8StringEncoding], &value, &size, nil, 0);
                content = [NSString stringWithFormat:@"%@:%lld",key,value];
            }
            
        }
            break;
        case TYPE_UINT64:
        {
            uint64_t value;
            sysctlbyname([key cStringUsingEncoding:NSUTF8StringEncoding], &value, &size, nil, 0);
            content = [NSString stringWithFormat:@"%@:%llu",key,value];
        }
            break;
        case TYPE_String:
        {
            char *value = malloc(size);
            sysctlbyname([key cStringUsingEncoding:NSUTF8StringEncoding], value, &size, nil, 0);
            
            
            content = [NSString stringWithFormat:@"%@:%s",key,value];
        }
            break;
            
        default:
            content = [NSString stringWithFormat:@"%@:%@",key,@"No Type Value"];
            break;
    }
    
    return content;
}


@end
