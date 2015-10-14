//
//  ActualRunViewController.h
//  RunRabbit
//
//  Created by Ian Yap on 8/28/15.
//  Copyright (c) 2015 Ian Yap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActualRunViewController : UIViewController

@property (strong,nonatomic) IBOutlet UILabel *timeLeftLabel;
@property (nonatomic,strong) IBOutlet UILabel *distanceLeftLabel;


@property (nonatomic) double distanceLeft;
@property (nonatomic) double timeLeft;

@end

