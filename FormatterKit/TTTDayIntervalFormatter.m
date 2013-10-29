//
//  TTTDayIntervalFormatter.m
//  Blooper
//
//  Created by Maurício Feijó on 10/28/13.
//
//

#import "TTTDayIntervalFormatter.h"
#import "TTTTimeIntervalFormatter.h"
#import "NSDate+FLP.h"

@implementation TTTDayIntervalFormatter

- (NSString *)intervalBetweenStartingDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
	NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *components = [gregorianCalendar components:NSDayCalendarUnit
														fromDate:startDate
														  toDate:endDate
														 options:0];
	return [self intervalOfDates:[components day] endDate:NO];
}

- (NSString *)intervalOfDates:(int)days endDate:(BOOL)endDate
{
	NSString *interval, *s;
	if (!days)
		return BLPLocalizedString(@"consult");
	else
	{
		if (days == 2)
			interval = [NSString stringWithFormat:@"1 %@", BLPLocalizedString(@"day")];
		else
			interval = [NSString stringWithFormat:@"%d %@", days, BLPLocalizedString(@"days")];
	}
	
	if (endDate)
	{
		NSDate *date = [NSDate dateWithTimeIntervalSinceNow:D_DAY*days];
		s = [NSString stringWithFormat:@" (%@)", [self formattedDate:(days != 0 ? date : [NSDate date])]];
	}
	else
		s = @"";
	
	return [interval stringByAppendingString: s];

}

- (NSString *)formattedDate:(NSDate *)myDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:[NSDateFormatter dateFormatFromTemplate:@"yyyyMMdd" options:0 locale:[NSLocale currentLocale]]];
    
    NSString *dateFormatted = [dateFormatter stringFromDate:myDate];
    
    return dateFormatted;
}

@end
