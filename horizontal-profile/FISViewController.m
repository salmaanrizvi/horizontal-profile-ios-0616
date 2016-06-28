//
//  FISViewController.m
//  horizontal-profile
//
//  Created by Salmaan Rizvi on 6/27/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *coverPhoto;
@property (strong, nonatomic) IBOutlet UIImageView *profilePhoto;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *classNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *interestingFactLabel;
@property (strong, nonatomic) IBOutlet UITextView *detailText;

@property (strong, nonatomic) NSLayoutConstraint *profilePhotoTopAnchor;
@property (strong, nonatomic) NSLayoutConstraint *profilePhotoLeftAnchor;
@property (strong, nonatomic) NSLayoutConstraint *detailTexRightAnchor;
@property (strong, nonatomic) NSLayoutConstraint *detailTextTopAnchor;
@property (strong, nonatomic) NSLayoutConstraint *detailTextLeftAnchor;

@property (strong, nonatomic) NSLayoutConstraint *coverPhotoTopAnchor;
@property (strong, nonatomic) NSLayoutConstraint *coverPhotoHeightAnchor;

@end

@implementation FISViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.coverPhoto.image = [UIImage imageNamed:@"roads.jpg"];
    self.profilePhoto.image = [UIImage imageNamed:@"IMG_4016.jpg"];
    [self constrainView];
    
}

-(void) constrainView {
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view removeConstraints:self.view.constraints];
    
    self.coverPhoto.translatesAutoresizingMaskIntoConstraints = NO;
    [self.coverPhoto removeConstraints:self.coverPhoto.constraints];
    [self.coverPhoto.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:0].active = YES;
    [self.coverPhoto.widthAnchor constraintEqualToAnchor:self.view.widthAnchor constant:0].active = YES;
    self.coverPhotoHeightAnchor = [self.coverPhoto.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:0.29];
    self.coverPhotoHeightAnchor.active = YES;
    self.coverPhotoTopAnchor = [self.coverPhoto.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20];
    self.coverPhotoTopAnchor.active = YES;
    
    self.profilePhoto.translatesAutoresizingMaskIntoConstraints = NO;
    [self.profilePhoto removeConstraints:self.profilePhoto.constraints];
    [self.profilePhoto.widthAnchor constraintEqualToConstant:125].active = YES;
    [self.profilePhoto.heightAnchor constraintEqualToConstant:125].active = YES;
    self.profilePhotoTopAnchor = [self.profilePhoto.topAnchor constraintEqualToAnchor:self.coverPhoto.bottomAnchor constant:35];
    self.profilePhotoTopAnchor.active = YES;
    self.profilePhotoLeftAnchor = [self.profilePhoto.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:35];
    self.profilePhotoLeftAnchor.active = YES;
    
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.nameLabel removeConstraints:self.nameLabel.constraints];
    [self.nameLabel.topAnchor constraintEqualToAnchor:self.profilePhoto.topAnchor constant:0].active = YES;
    [self.nameLabel.leftAnchor constraintEqualToAnchor:self.profilePhoto.rightAnchor constant:15].active = YES;
    [self.nameLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-20].active = YES;
    
    self.classNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.classNameLabel removeConstraints:self.classNameLabel.constraints];
    [self.classNameLabel.centerYAnchor constraintEqualToAnchor:self.profilePhoto.centerYAnchor constant:0].active = YES;
    [self.classNameLabel.leftAnchor constraintEqualToAnchor:self.nameLabel.leftAnchor constant:0].active = YES;
    
    self.interestingFactLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.interestingFactLabel removeConstraints:self.interestingFactLabel.constraints];
    [self.interestingFactLabel.bottomAnchor constraintEqualToAnchor:self.profilePhoto.bottomAnchor constant:0].active = YES;
    [self.interestingFactLabel.leftAnchor constraintEqualToAnchor:self.nameLabel.leftAnchor constant:0].active = YES;
    [self.interestingFactLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-20].active = YES;
    
    self.detailText.translatesAutoresizingMaskIntoConstraints = NO;
    [self.detailText removeConstraints:self.detailText.constraints];
    [self.detailText.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-20].active = YES;
    self.detailTexRightAnchor = [self.detailText.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-35];
    self.detailTexRightAnchor.active = YES;
    self.detailTextTopAnchor = [self.detailText.topAnchor constraintEqualToAnchor:self.profilePhoto.bottomAnchor constant:35];
    self.detailTextTopAnchor.active = YES;
    self.detailTextLeftAnchor = [self.detailText.leftAnchor constraintEqualToAnchor:self.profilePhoto.leftAnchor constant:0];
    self.detailTextLeftAnchor.active = YES;
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    
    //[self.profilePhoto removeConstraints:self.profilePhoto.constraints];
    //[self.interestingFactLabel removeConstraint:[self.interestingFactLabel.centerYAnchor]];
    
    if (self.traitCollection.verticalSizeClass == 1) {
        self.coverPhoto.hidden = YES;
        self.profilePhotoTopAnchor.constant = -75;
        [self.classNameLabel.centerYAnchor constraintEqualToAnchor:self.profilePhoto.centerYAnchor constant:0].active = YES;
    }
    else {
        self.coverPhoto.hidden = NO;
        self.profilePhotoTopAnchor.constant = 35;
        self.coverPhotoTopAnchor.constant = 20;
    }
    
    // Reguar vertical and compact horizontal sides is an iPhone 4, 5 or 6 in portrait
    if(self.traitCollection.verticalSizeClass == 2 && self.traitCollection.horizontalSizeClass == 1) {
        NSLog(@"Changing Photo Left Anchor Constant");
        NSLog(@"Changing Detail Text Right Anchor Constant");
        self.profilePhotoLeftAnchor.constant = 20;
        self.detailTexRightAnchor.constant = -20;
        self.detailTextTopAnchor.constant = 35;
        self.detailTextLeftAnchor.constant = 0;
    }
    //iphone 6+ in landscape mode
    else if(self.traitCollection.verticalSizeClass == 1 && self.traitCollection.horizontalSizeClass == 2) {
        NSLog(@"Changing Detail Text Top Anchor Constant");
        NSLog(@"Changing Detail Text Left Anchor Constant");
        
        self.detailTextTopAnchor.constant = -135;
        self.detailTextLeftAnchor.constant = self.nameLabel.bounds.size.width + 65;
        
        [self.coverPhoto removeConstraint:self.coverPhotoHeightAnchor];
        self.coverPhotoHeightAnchor = [self.coverPhoto.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:1];
        self.coverPhotoTopAnchor.constant = 0;
        self.coverPhoto.hidden = NO;
        
        self.profilePhotoTopAnchor.constant = 30;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
