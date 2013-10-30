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
	NSString *interval;
	
	if (seconds > 86400 && seconds <= 172800)
		return [NSString stringWithFormat:@"1 %@", NSLocalizedStringFromTable(@"day", @"FormatterKit", @"Day Unit (Singular, Abbreviated)")];
	
	int days = seconds/86400;
	return [NSString stringWithFormat:@"%d %@", days - 1, NSLocalizedStringFromTable(@"days", @"FormatterKit", @"Day Unit (Plural, Abbreviated)")];
	
	return interval;

}

@end
