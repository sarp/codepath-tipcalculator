//
//  ViewController.m
//  tipcalculator
//
//  Created by Sarp Centel on 1/26/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

- (IBAction)defaultTipChanged:(id)sender;
@end

@implementation SettingsViewController

static NSString* defaultTipKey = @"default_tip_key";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.defaultTipControl setSelectedSegmentIndex:[self getStoredDefaultTipValue]];
}

- (IBAction)defaultTipChanged:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTipControl.selectedSegmentIndex forKey:defaultTipKey];
    [defaults synchronize];
    NSLog(@"Saved default index: %d", self.defaultTipControl.selectedSegmentIndex);
}

- (int) getStoredDefaultTipValue {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults integerForKey:defaultTipKey];
}

@end
