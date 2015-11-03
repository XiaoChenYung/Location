//
//  ViewController.m
//  Location
//
//  Created by 杨晓晨 on 15/11/3.
//  Copyright © 2015年 杨晓晨. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *jingdu;
@property (weak, nonatomic) IBOutlet UITextField *weidu;
@property (nonatomic ,strong) CLLocationManager *manager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.manager requestAlwaysAuthorization];
    [self.manager startUpdatingLocation];
    self.manager.delegate = self;
    self.manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark delegate 

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = [locations firstObject];
    CLLocationCoordinate2D cor = location.coordinate;
    
    self.jingdu.text = [NSString stringWithFormat:@"%f",cor.longitude];
    self.weidu.text = [NSString stringWithFormat:@"%f",cor.latitude];
    
    [self.jingdu sizeToFit];
    [self.weidu sizeToFit];
    
}

#pragma mark --lazy

- (CLLocationManager *)manager {
    if (!_manager) {
        _manager = [[CLLocationManager alloc] init];
    }
    return _manager;
}

@end
