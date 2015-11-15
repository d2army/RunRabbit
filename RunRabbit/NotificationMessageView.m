//
//  NotificationMessage.m
//  RunRabbit
//
//  Created by Ian Yap on 11/3/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import "NotificationMessageView.h"

@implementation NotificationMessageView
@synthesize notification = _notification;

-(void) updateValue:(id)value {
    double speed = [value doubleValue];
    
    //do something with the speed
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setPositiveFormat:@"0.##"];
    
    NSString *speedText = [NSString stringWithFormat:@"%@ m/s", [fmt stringFromNumber:[NSNumber numberWithDouble:speed]]];
    _notification.text = speedText;
}

-(void) completedUpdate {
    _notification.text = @"Completed!";
}
@end
