//
//  HomeController.m
//  Earnology
//
//  Created by Didami on 02/08/23.
//

#import "HomeController.h"

@interface HomeController ()

@property (strong, nonatomic) NSArray<Category*>* categories;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self instantiateUI];
    [self setupViews];
    
    self.categories = @[
        [[Category alloc] initWithName:@"Savings" percentage:@20],
        [[Category alloc] initWithName:@"Wants" percentage:@30],
        [[Category alloc] initWithName:@"Needs" percentage:@50]
    ];
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
    return self.categories.count + 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    double height = 0;
    
    if (indexPath.item == 0) {
        height = collectionView.frame.size.height * 0.2;
    } else {
        height = collectionView.frame.size.height * 0.8 * (self.categories[indexPath.item - 1].percentage.doubleValue / 100);
    }
    
    return CGSizeMake(collectionView.frame.size.width, height);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:[HomeCell identifier] forIndexPath:indexPath];
    
    NSArray<UIColor*>* colors = @[
        UIColor.blackColor,
        [[UIColor alloc] initWithRed:160.0/255.0 green:156.0/255.0 blue:159.0/255.0 alpha:1],
        [[UIColor alloc] initWithRed:169.0/255.0 green:139.0/255.0 blue:51.0/255.0 alpha:1],
        [[UIColor alloc] initWithRed:28.0/255.0 green:28.0/255.0 blue:28.0/255.0 alpha:1],
    ];
    
    cell.backgroundColor = colors[indexPath.item];
    
    if (indexPath.item > 0) {
        [cell setupCellWithCategory:self.categories[indexPath.item - 1]];
    }
    
    return cell;
}

@end
