//
//  HomeCell.h
//  Earnology
//
//  Created by Didami on 02/08/23.
//

#import <UIKit/UIKit.h>
#import "Extensions+Constants.h"
#import "Category.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeCell : UICollectionViewCell<UITextFieldDelegate>

+ (NSString*) identifier;

@property (strong, nonatomic) Category* category;

@property (strong, nonatomic) UILabel* titleLabel;
@property (strong, nonatomic) UILabel* subtitleLabel;
@property (strong, nonatomic) UITextField* textField;

- (void)setupCellWithCategory: (Category*)category;

@end

NS_ASSUME_NONNULL_END
