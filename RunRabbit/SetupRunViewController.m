//
//  FirstViewController.m
//  RunRabbit
//
//  Created by Ian Yap on 8/28/15.
//  Copyright (c) 2015 Ian Yap. All rights reserved.
//

#import "SetupRunViewController.h"

@interface SetupRunViewController ()

@end

@implementation SetupRunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //initialize picker values
    self.distanceChoices  = [[NSArray alloc]  initWithObjects:@"1/2 mile",@"1 mile",@"2 miles",@"3 miles",@"4 miles",@"5 miles" , nil];
    self.timeChoices  = [[NSArray alloc]  initWithObjects:@"5 mins",@"10 mins",@"15 mins",@"20 mins",@"25 mins",@"30 mins", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 * Picker stuff
 */

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component {
    return 6;
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component {
    
    return [self.timeChoices objectAtIndex:row];
    
}


@end
