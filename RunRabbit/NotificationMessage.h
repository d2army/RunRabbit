//
//  NotificationMessage.h
//  RunRabbit
//
//  Created by Ian Yap on 11/3/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataTargetDelegate.h"


@interface NotificationMessage : UIView <DataTargetDelegate>


@property (strong,nonatomic) IBOutlet UILabel *notification;


//Protocol methods to be implemented
- (void) updateValue:(id)countdownValue;

- (void) completedUpdate;

@end
