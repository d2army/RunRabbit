//
//  FirstViewController.m
//  RunRabbit
//
//  Created by Ian Yap on 8/28/15.
//  Copyright (c) 2015 Ian Yap. All rights reserved.
//

#import "SetupRunViewController.h"
#import "ActualRunViewController.h"

@interface SetupRunViewController ()

@end

@implementation SetupRunViewController
@synthesize distancePicker = _distancePicker;
@synthesize timePicker = _timePicker;


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


- (IBAction)startRunning:(id)sender {
    UIViewController *actualRunViewController =
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateInitialViewController];
    
    //[self presentViewController:actualRunViewController animated:NO completion:nil ];
    [self performSegueWithIdentifier:@"showActualRun" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showActualRun"]) {
        
        ActualRunViewController *vc = [segue destinationViewController];
        
        NSUInteger selectedRow = [self.distancePicker selectedRowInComponent:0];
        NSString *distanceValueAsString = [[self.distanceChoices objectAtIndex:selectedRow] componentsSeparatedByString:@" "][0];
        vc.distanceLeft = [distanceValueAsString doubleValue];
        
        selectedRow = [self.timePicker selectedRowInComponent:0];
        NSString *timeValueAsString = [[self.timeChoices objectAtIndex:selectedRow] componentsSeparatedByString:@" "][0];
        vc.timeLeft = [timeValueAsString doubleValue] * 60.0; //need to times 60 because timeValueAsString is in minutes
    }
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
    
    if (pickerView.tag == 1) {
        return [self.timeChoices objectAtIndex:row];
    } else if (pickerView.tag == 2) {
        return [self.distanceChoices objectAtIndex:row];
    }
    
    return NULL;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    
}


@end
