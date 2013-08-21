//
//  TTTPeriodFormatter.m
//  Pods
//
//  Created by Felipe Lobo on 16/08/13.
//
//

#import "TTTPeriodFormatter.h"

#define NSCalendarAllComponents		NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit

@implementation TTTPeriodFormatter

- (NSString *)stringForPeriodFromDate:(NSDate *)start toDate:(NSDate *)end
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	
	NSDateComponents *startComponents = [calendar components:NSCalendarAllComponents fromDate:start];
	NSDateComponents *endComponents = [calendar components:NSCalendarAllComponents fromDate:end];
	
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setLocale:_locale];
	
	if ([startComponents year] == [endComponents year])
	{
		if ([startComponents month] == [endComponents month])
		{
			if ([startComponents day] == [endComponents day])
			{
				[dateFormatter setDateFormat:@"dd MMMM yyyy"];
				
				return [dateFormatter stringFromDate:end];
			}
			
			[dateFormatter setDateFormat:@"MMMM"];
			
			return [NSString stringWithFormat:@"%d a %d de %@ de %d", [startComponents day], [endComponents day], [dateFormatter stringFromDate:end], [startComponents year]];
		}
		
		[dateFormatter setDateFormat:@"dd MMM"];
		
		return [NSString stringWithFormat:@"%@ a %@ de %d", [dateFormatter stringFromDate:start], [dateFormatter stringFromDate:end], [startComponents year]];
	}
	
	[dateFormatter setDateFormat:@"dd/MM/yyyy"];
	
	return [NSString stringWithFormat:@"%@ a %@", [dateFormatter stringFromDate:start], [dateFormatter stringFromDate:end]];
}

@end
