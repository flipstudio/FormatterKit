//
//  TTTPeriodFormatter.h
//  Pods
//
//  Created by Felipe Lobo on 16/08/13.
//
//

#import <Foundation/Foundation.h>

@interface TTTPeriodFormatter : NSFormatter

@property (nonatomic, strong) NSLocale *locale;

- (NSString *)stringForPeriodFromDate:(NSDate *)start toDate:(NSDate *)end;

@end
