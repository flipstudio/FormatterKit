//
//  TTTDayIntervalFormatter.m
//
//  Created by Maurício Feijó on 10/28/13.
//
//

#import "TTTDayIntervalFormatter.h"

@implementation TTTDayIntervalFormatter

- (NSString *)stringForTimeIntervalFromDate:(NSDate *)startingDate toDate:(NSDate *)endingDate
{
	NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *components = [gregorianCalendar components:NSDayCalendarUnit
														fromDate:startingDate
														  toDate:endingDate
														 options:0];
	return [self stringForTimeInterval:[components day]*86400];
}

- (NSString *)stringForTimeInterval:(NSTimeInterval)seconds;
{
	int days = seconds/86400;
	
	return [NSString stringWithFormat:@"%d %@", days, NSLocalizedStringFromTable((days == 1? @"day" : @"days"), @"FormatterKit", nil)];
}

@end
