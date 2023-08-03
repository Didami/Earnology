//
//  HomeCell.h
//  Earnology
//
//  Created by Didami on 02/08/23.
//

#import <UIKit/UIKit.h>
#import "Category.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeCell : UICollectionViewCell

+ (NSString*) identifier;

@property (strong, nonatomic) Category* category;

@property (strong, nonatomic) UILabel* titleLabel;
@property (strong, nonatomic) UILabel* subtitleLabel;

- (void)setupCellWithCategory: (Category*)category;

@end

NS_ASSUME_NONNULL_END
