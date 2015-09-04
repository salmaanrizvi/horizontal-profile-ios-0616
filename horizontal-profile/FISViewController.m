//
//  FISViewController.m
//  horizontal-profile
//
//  Created by Tom OMalley on 3/2/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *coverImage;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *classNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *interestingFactLabel;
@property (weak, nonatomic) IBOutlet UITextView *myTextView;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *myImageViews;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *myLabels;

@property (strong, nonatomic) NSLayoutConstraint *coverImageHeightPortrait;
@property (strong, nonatomic) NSLayoutConstraint *coverImageHeightLandscape;

@property (strong, nonatomic) NSArray *textView6PlusLandscape;
@property (strong, nonatomic) NSArray *textView6PlusPortrait;

@end

NSInteger const APPLE_STANDARD_PADDING = 8;
NSInteger const MORE_PADDING = 20;

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // remove constraints
    [self removeAllConstraints];
    
    // setup images
    [self.coverImage setImage: [UIImage imageNamed:@"stuffmomnevertoldyou.jpg"]];
    [self.profileImage setImage: [UIImage imageNamed:@"Blake_Farenthold.jpg"]];
    
    // set constraints
    [self setPortraitConstraints];
}

#pragma mark - Constraint Helpers

-(void) removeAllConstraints
{
    [self.view removeConstraints: self.view.constraints];
    
    for (UILabel *label in self.myLabels)
    {
        [label removeConstraints: label.constraints];
        label.translatesAutoresizingMaskIntoConstraints = NO;
    };
    
    for (UIImageView *imageView in self.myImageViews)
    {
        [imageView removeConstraints: imageView.constraints];
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    [self.myTextView removeConstraints: self.myTextView.constraints];
    self.myTextView.translatesAutoresizingMaskIntoConstraints = NO;
}

-(void) setPortraitConstraints
{
    [self setCoverImageConstraints];
    [self setProfileImageConstraints];
    [self setTextLabelConstraints];
    [self setTextViewConstraints];
}

#pragma mark - Constraints

-(void) setCoverImageConstraints
{
  NSLayoutConstraint *pinToTop =
      [NSLayoutConstraint constraintWithItem:self.coverImage
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.view
                                   attribute:NSLayoutAttributeTop
                                  multiplier:1.0
                                    constant:0];

  NSLayoutConstraint *setWidth =
      [NSLayoutConstraint constraintWithItem:self.coverImage
                                   attribute:NSLayoutAttributeWidth
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.view
                                   attribute:NSLayoutAttributeWidth
                                  multiplier:1.0
                                    constant:0];

  NSLayoutConstraint *setHeight =
      [NSLayoutConstraint constraintWithItem:self.coverImage
                                   attribute:NSLayoutAttributeHeight
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.view
                                   attribute:NSLayoutAttributeHeight
                                  multiplier:.25
                                    constant:0];

  NSLayoutConstraint *setCenter =
      [NSLayoutConstraint constraintWithItem:self.coverImage
                                   attribute:NSLayoutAttributeCenterX
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.view
                                   attribute:NSLayoutAttributeCenterX
                                  multiplier:1
                                    constant:0];

    // save these guys for later
  NSLayoutConstraint *setCoverImageHeightLandscape =
      [NSLayoutConstraint constraintWithItem:self.coverImage
                                   attribute:NSLayoutAttributeHeight
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.view
                                   attribute:NSLayoutAttributeHeight
                                  multiplier:0
                                    constant:0];
    
    self.coverImageHeightLandscape = setCoverImageHeightLandscape;
    self.coverImageHeightPortrait = setHeight;
    
    [self.view addConstraints:@[pinToTop, setWidth, setHeight, setCenter]];
}

-(void) setProfileImageConstraints
{
  NSLayoutConstraint *fromCoverImage =
      [NSLayoutConstraint constraintWithItem:self.profileImage
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.coverImage
                                   attribute:NSLayoutAttributeBottom
                                  multiplier:1.0
                                    constant:MORE_PADDING];

  NSLayoutConstraint *fromLeftOfView =
      [NSLayoutConstraint constraintWithItem:self.profileImage
                                   attribute:NSLayoutAttributeLeft
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.coverImage
                                   attribute:NSLayoutAttributeLeft
                                  multiplier:1.0
                                    constant:MORE_PADDING];

  NSLayoutConstraint *setWidth =
      [NSLayoutConstraint constraintWithItem:self.profileImage
                                   attribute:NSLayoutAttributeWidth
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.coverImage
                                   attribute:NSLayoutAttributeWidth
                                  multiplier:.25
                                    constant:0];

  NSLayoutConstraint *setHeight =
      [NSLayoutConstraint constraintWithItem:self.profileImage
                                   attribute:NSLayoutAttributeHeight
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.profileImage
                                   attribute:NSLayoutAttributeWidth
                                  multiplier:1
                                    constant:0];

    [self.view addConstraints:@[fromCoverImage, fromLeftOfView, setWidth, setHeight]];
}

-(void) setTextLabelConstraints
{
  NSLayoutConstraint *nameFromRightOfProfilePic =
      [NSLayoutConstraint constraintWithItem:self.nameLabel
                                   attribute:NSLayoutAttributeLeft
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.profileImage
                                   attribute:NSLayoutAttributeRight
                                  multiplier:1.0
                                    constant:MORE_PADDING];

  NSLayoutConstraint *classFromRightOfProfilePic =
      [NSLayoutConstraint constraintWithItem:self.classNameLabel
                                   attribute:NSLayoutAttributeLeft
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.profileImage
                                   attribute:NSLayoutAttributeRight
                                  multiplier:1.0
                                    constant:MORE_PADDING];

  NSLayoutConstraint *factFromRightOfProfilePic =
      [NSLayoutConstraint constraintWithItem:self.interestingFactLabel
                                   attribute:NSLayoutAttributeLeft
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.profileImage
                                   attribute:NSLayoutAttributeRight
                                  multiplier:1.0
                                    constant:MORE_PADDING];

  NSLayoutConstraint *fromTopOfPic =
      [NSLayoutConstraint constraintWithItem:self.nameLabel
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.profileImage
                                   attribute:NSLayoutAttributeTop
                                  multiplier:1.0
                                    constant:0];

  NSLayoutConstraint *fromTopLabel =
      [NSLayoutConstraint constraintWithItem:self.classNameLabel
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.nameLabel
                                   attribute:NSLayoutAttributeBottom
                                  multiplier:1.0
                                    constant:APPLE_STANDARD_PADDING];

    NSLayoutConstraint *fromMidLabel =
        [NSLayoutConstraint constraintWithItem:self.interestingFactLabel
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.classNameLabel
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1.0
                                      constant:APPLE_STANDARD_PADDING];

    [self.view addConstraints:@[nameFromRightOfProfilePic, classFromRightOfProfilePic, factFromRightOfProfilePic, fromTopOfPic, fromTopLabel, fromMidLabel]];
}

-(void) setTextViewConstraints
{
  NSLayoutConstraint *fromProfilePic =
      [NSLayoutConstraint constraintWithItem:self.myTextView
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.profileImage
                                   attribute:NSLayoutAttributeBottom
                                  multiplier:1.0
                                    constant:MORE_PADDING];

    NSLayoutConstraint *leftOfProfilePic =
        [NSLayoutConstraint constraintWithItem:self.myTextView
                                     attribute:NSLayoutAttributeLeft
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.profileImage
                                     attribute:NSLayoutAttributeLeft
                                    multiplier:1
                                      constant:0];

    NSLayoutConstraint *pinBottom =
        [NSLayoutConstraint constraintWithItem:self.myTextView
                                     attribute:NSLayoutAttributeBottom
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1
                                      constant:(-(MORE_PADDING))];

    NSLayoutConstraint *rightFromLeft =
        [NSLayoutConstraint constraintWithItem:self.myTextView
                                     attribute:NSLayoutAttributeRight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeRight
                                    multiplier:1
                                      constant:(-(MORE_PADDING))];

    [self.view addConstraints:@[fromProfilePic, leftOfProfilePic, pinBottom, rightFromLeft]];
    
    // save these guys for later
    NSLayoutConstraint *setTextViewTop =
        [NSLayoutConstraint constraintWithItem:self.myTextView
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.profileImage
                                     attribute:NSLayoutAttributeTop
                                    multiplier:1
                                      constant:0];

    NSLayoutConstraint *setTextViewLeft =
        [NSLayoutConstraint constraintWithItem:self.myTextView
                                     attribute:NSLayoutAttributeLeft
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.interestingFactLabel
                                     attribute:NSLayoutAttributeRight
                                    multiplier:1
                                      constant:APPLE_STANDARD_PADDING];

    self.textView6PlusPortrait = @[fromProfilePic, leftOfProfilePic];
    self.textView6PlusLandscape =@[setTextViewTop, setTextViewLeft];
}


#pragma markr - Orientation Changes

-(void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    //         if UITraitNameVerticalSizeClass = Compact >>> LANDSCAPE
    //                          "              = Regular >>>
    // nab 6+:   if newCollection.displayScale = 3.000
    
    
    if(newCollection.displayScale == 3.0) // IPHONE 6 PLUS
    {
        if (newCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular) // PORTRAIT
        {
            [self.view removeConstraints: self.textView6PlusLandscape];
            [self.view addConstraints: self.textView6PlusPortrait];
        }
        else if (newCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) // LANDSCAPE
        {
            [self.view removeConstraints: self.textView6PlusPortrait];
            [self.view addConstraints: self.textView6PlusLandscape];
        }
    }
    else
    {
        if (newCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular) // PORTRAIT
        {
            [self.view removeConstraint: self.coverImageHeightLandscape];
            [self.view addConstraint: self.coverImageHeightPortrait];
        }
        else if (newCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) // LANDSCAPE
        {
            [self.view removeConstraint: self.coverImageHeightPortrait];
            [self.view addConstraint: self.coverImageHeightLandscape];
        }
    }
    NSLog(@"transitioning to: %@", newCollection);
    
    [self.view layoutSubviews];
}

@end
