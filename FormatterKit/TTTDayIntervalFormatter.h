//
//  TTTDayIntervalFormatter.h
//
//  Created by Maurício Feijó on 10/28/13.
//
//

#import <Foundation/Foundation.h>

@interface TTTDayIntervalFormatter : NSFormatter

- (NSString *)stringForTimeIntervalFromDate:(NSDate *)startingDate toDate:(NSDate *)endingDate;
- (NSString *)stringForTimeInterval:(NSTimeInterval)seconds;

@end
