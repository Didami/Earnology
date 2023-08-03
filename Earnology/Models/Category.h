//
//  Category.h
//  Earnology
//
//  Created by Didami on 02/08/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Category : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSNumber* percentage;

- (instancetype)initWithName: (NSString*)name percentage: (NSNumber*)percentage;

@end

NS_ASSUME_NONNULL_END
