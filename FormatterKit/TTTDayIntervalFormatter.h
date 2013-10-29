//
//  TTTDayIntervalFormatter.h
//  Blooper
//
//  Created by Maurício Feijó on 10/28/13.
//
//

#import <Foundation/Foundation.h>

@interface TTTDayIntervalFormatter : NSFormatter

- (NSString *)intervalBetweenStartingDate:(NSDate *)startDate endDate:(NSDate *)endDate;
- (NSString *)intervalOfDates:(int)days endDate:(BOOL)endDate;

@end
