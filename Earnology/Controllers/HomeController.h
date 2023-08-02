//
//  HomeController.h
//  Earnology
//
//  Created by Didami on 02/08/23.
//

#import <UIKit/UIKit.h>
#import "HomeCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeController : UIViewController<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionViewFlowLayout* layout;
@property (strong, nonatomic) UICollectionView * collectionView;

@end

NS_ASSUME_NONNULL_END
