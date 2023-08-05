//
//  HomeController.m
//  Earnology
//
//  Created by Didami on 02/08/23.
//

#import "HomeController.h"

@interface HomeController ()

@property (strong, nonatomic) NSMutableArray<Category*>* categories;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self instantiateUI];
    [self setupViews];
    
    self.categories = [NSMutableArray arrayWithObjects:
                       [[Category alloc] initWithName:@"Savings" percentage:@20],
                       [[Category alloc] initWithName:@"Wants" percentage:@30],
                       [[Category alloc] initWithName:@"Needs" percentage:@50], nil];
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
    
    self.textField = [[UITextField alloc] init];
    self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.textField setKeyboardType:UIKeyboardTypeDecimalPad];
    self.textField.backgroundColor = [UIColor background];
    self.textField.placeholder = @"$$$";
    self.textField.layer.masksToBounds = YES;
    self.textField.layer.cornerRadius = 12;
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    
    UIView* leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 12, 0)];
    self.textField.leftView = leftView;
    self.textField.delegate = self;
}

- (void)setupViews {
    [self.navigationController.navigationBar setHidden:YES];
    self.view.backgroundColor = UIColor.systemBackgroundColor;
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewEndEditing)]];
    
    // add subviews
    [self.view addSubview:self.textField];
    [self.view addSubview:self.collectionView];
    
    // x, y, w, h
    [[self.textField.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[self.textField.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:12] setActive:YES];
    [[self.textField.widthAnchor constraintEqualToAnchor:self.view.widthAnchor constant:-24] setActive:YES];
    [[self.textField.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:1.0/10.0] setActive:YES];
    
    [[self.collectionView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[self.collectionView.topAnchor constraintEqualToAnchor:self.textField.bottomAnchor constant:24] setActive:YES];
    [[self.collectionView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor] setActive:YES];
    [[self.collectionView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor] setActive:YES];
}

// MARK: - Selectors
- (void)viewEndEditing {
    [self.view endEditing:YES];
}

// MARK: - Delegate methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.categories.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    double height = collectionView.frame.size.height * (self.categories[indexPath.item].percentage.doubleValue / 100);
    return CGSizeMake(collectionView.frame.size.width, height);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:[HomeCell identifier] forIndexPath:indexPath];
    
    NSArray<UIColor*>* colors = @[
        [UIColor blackColor],
        [UIColor shadyLady],
        [UIColor luxorGold],
        [UIColor codGray],
    ];
    
    cell.backgroundColor = colors[indexPath.item];
    [cell setupCellWithCategory:self.categories[indexPath.item]];
    return cell;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSString* text = textField.text;
    double total = [text doubleValue];
    
    for (NSUInteger i = 0; i < self.categories.count; i++) {
        Category *modified = self.categories[i];
        modified.value = [modified.percentage doubleValue] * total / 100.0;
        self.categories[i] = modified;
    }
    
    [self.collectionView reloadData];
}

@end
