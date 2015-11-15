//
//  ObserverComponent.h
//  RunRabbit
//
//  Created by Ian Yap on 11/14/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataProcessorFactory.h"

@interface ObserverComponent : NSObject
@property (nonatomic,strong) id delegate;
@property (nonatomic) DataProcessorType dataType;
@end
