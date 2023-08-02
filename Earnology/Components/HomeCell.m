//
//  HomeCell.m
//  Earnology
//
//  Created by Didami on 02/08/23.
//

#import "HomeCell.h"

@implementation HomeCell

+ (NSString*)identifier {
    static NSString *const identifier = @"HomeCellId";
    return identifier;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self instantiateUI];
        [self setupViews];
    }
    
    return self;
}

- (void)instantiateUI {
    
}

-(void)setupViews {
    self.backgroundColor = UIColor.blueColor;
}

@end
