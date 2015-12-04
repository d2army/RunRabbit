//
//  ObserverComponent.h
//  RunRabbit
//
//  Created by Ian Yap on 11/14/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventDataTypeDefinition.h"

@interface ObserverComponent : NSObject
@property (nonatomic,strong) id delegate;
@property (nonatomic) EventDataType dataType;
@end
