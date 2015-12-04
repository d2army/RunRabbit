//
//  StateDefinition.h
//  RunRabbit
//
//  Created by Ian Yap on 11/22/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StateTypeDefinition : NSObject

enum {
    NOT_STARTED_STATE = 1,
    RUNNING_STATE = 2,
    COMPLETED_STATE = 3
};
typedef NSInteger StateType;



@end
