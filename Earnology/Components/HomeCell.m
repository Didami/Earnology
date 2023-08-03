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

// MARK: - Front-End
- (void)instantiateUI {
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = UIColor.whiteColor;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:32];
    
    self.subtitleLabel = [[UILabel alloc] init];
    self.subtitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.subtitleLabel.textAlignment = NSTextAlignmentLeft;
    self.subtitleLabel.textColor = UIColor.whiteColor;
    self.subtitleLabel.font = [UIFont boldSystemFontOfSize:12];
}

- (void)setupViews {
    // add subviews
    [self addSubview:self.titleLabel];
    [self addSubview:self.subtitleLabel];
    
    // x, y, w, h
    [[self.titleLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor] setActive:YES];
    [[self.titleLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor] setActive:YES];
    [[self.titleLabel.heightAnchor constraintEqualToAnchor:self.heightAnchor constant:-24] setActive:YES];
    [[self.titleLabel.widthAnchor constraintEqualToAnchor:self.titleLabel.heightAnchor] setActive:YES];
    
    [[self.subtitleLabel.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:12] setActive:YES];
    [[self.subtitleLabel.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-12] setActive:YES];
    [[self.subtitleLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:6] setActive:YES];
    [[self.subtitleLabel.heightAnchor constraintEqualToConstant:60] setActive:YES];
}

- (void)setupCellWithCategory: (Category*)category {
    // TODO: - Get from UserDefaults
    double totalEarnings = 0.0;
    
    self.subtitleLabel.text = [NSString stringWithFormat:@"%@ - %@%@", category.name, category.percentage, @"%"];
    self.titleLabel.text = [NSString stringWithFormat:@"%@%.2f", @"$", category.percentage.doubleValue * totalEarnings];
}

@end
