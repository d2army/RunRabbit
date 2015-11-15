//
//  NotificationMessage.h
//  RunRabbit
//
//  Created by Ian Yap on 11/3/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataTargetDelegate.h"


@interface NotificationMessageView : UIView <DataTargetDelegate>
@property (strong,nonatomic) IBOutlet UILabel *notification;


//Protocol methods to be implemented
- (void) updateValue:(id)value;

- (void) completedUpdate;

@end
