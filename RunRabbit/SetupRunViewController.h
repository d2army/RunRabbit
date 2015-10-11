//
//  SetupRunViewController.h
//  RunRabbit
//
//  Created by Ian Yap on 8/28/15.
//  Copyright (c) 2015 Ian Yap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetupRunViewController : UIViewController   <UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *distancePicker;

@property (strong, nonatomic) IBOutlet UIPickerView *timePicker;

@property (strong, nonatomic) NSArray *distanceChoices;

@property (strong, nonatomic) NSArray *timeChoices;

@end

