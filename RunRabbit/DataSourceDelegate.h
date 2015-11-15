//
//  DataSourceDelegate.h
//  RunRabbit
//
//  Created by Ian Yap on 10/31/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataProcessorFactory.h"

@protocol DataSourceDelegate

@required

-(void) startUpdatingData;

-(void) stopUpdatingData;

/*
 * Set up initial data
 */
-(void) initializeData:(NSDictionary *)dataPacket;

/*
 * Adding an observing delegate and the data type
 */
-(void) addObserver:(id)delegate forDataType:(DataProcessorType)dataType;

-(double) getMax;

-(NSString *) getUnitOfMeasurement;

/* 
 * Show the type title
 */
-(NSString *) getTypeTitle;

-(NSString *) getFormatForDisplay;

@end
