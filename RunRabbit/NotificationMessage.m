//
//  NotificationMessage.m
//  RunRabbit
//
//  Created by Ian Yap on 11/3/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import "NotificationMessage.h"
#import "LocationDataPacket.h"

@implementation NotificationMessage
@synthesize notification = _notification;

-(void) updateValue:(id)value {
    LocationDataPacket *packet = (LocationDataPacket *) value;
    double speed = packet.speed;
    
    //do something with the speed
    _notification.text = [NSString stringWithFormat:@"%.2g m/s", speed];
}

-(void) completedUpdate {
    
}
@end
