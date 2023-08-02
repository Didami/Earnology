//
//  HomeController.m
//  Earnology
//
//  Created by Didami on 02/08/23.
//

#import "HomeController.h"

@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self instantiateUI];
    [self setupViews];
}

// MARK: - Front-End
- (void)instantiateUI {
    // collection view
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    self.layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.layout.minimumLineSpacing = 0;
    self.layout.minimumInteritemSpacing = 0;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    self.collectionView.backgroundColor = UIColor.redColor;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[HomeCell class] forCellWithReuseIdentifier:[HomeCell identifier]];
}

- (void)setupViews {
    [self.navigationController.navigationBar setHidden:YES];
    self.view.backgroundColor = UIColor.systemBackgroundColor;
    
    // add subviews
    [self.view addSubview:self.collectionView];
    
    // x, y, w, h
    [[self.collectionView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[self.collectionView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] setActive:YES];
    [[self.collectionView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor] setActive:YES];
    [[self.collectionView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor] setActive:YES];
}

// MARK: - Delegate methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.frame.size.width, collectionView.frame.size.height / 4);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:[HomeCell identifier] forIndexPath:indexPath];
    cell.backgroundColor = (indexPath.item % 2 == 0) ? (UIColor.greenColor) : (UIColor.blueColor);
    return cell;
}

@end
