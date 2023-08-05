//
//  HomeController.h
//  Earnology
//
//  Created by Didami on 02/08/23.
//

#import <UIKit/UIKit.h>
#import "Extensions+Constants.h"
#import "HomeCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeController : UIViewController<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UITextFieldDelegate>

@property (strong, nonatomic) UICollectionViewFlowLayout* layout;
@property (strong, nonatomic) UICollectionView* collectionView;
@property (strong, nonatomic) UITextField* textField;

@end

NS_ASSUME_NONNULL_END
