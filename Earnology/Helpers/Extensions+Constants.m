//
//  Extensions+Constants.m
//  Earnology
//
//  Created by Didami on 04/08/23.
//

#import <UIKit/UIKit.h>

@implementation UIColor (CustomColors)

+ (UIColor*)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [[UIColor alloc] initWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}

+ (UIColor*)codGray {
    return [UIColor initWithRed:28.0 green:28.0 blue:28.0];
}

+ (UIColor*)luxorGold {
    return [UIColor initWithRed:169.0 green:139.0 blue:51.0];
}

+ (UIColor*)shadyLady {
    return [UIColor initWithRed:160.0 green:156.0 blue:159.0];
}

+ (UIColor*)background {
    return [UIColor initWithRed:20.0 green:20.0 blue:20.0];
}

@end
