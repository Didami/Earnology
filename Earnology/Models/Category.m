//
//  Category.m
//  Earnology
//
//  Created by Didami on 02/08/23.
//

#import "Category.h"

@implementation Category

- (instancetype)initWithName:(NSString *)name percentage:(NSNumber *)percentage {
    self = [super init];
    
    if (self) {
        _name = name;
        _percentage = percentage;
    }
    
    return self;
}

@end
