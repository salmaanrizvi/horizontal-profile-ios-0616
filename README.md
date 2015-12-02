
# Horizontal Profile
#### (Handling Rotation)

## Instructions

  1. When the phone is in portrait mode, make a new "profile page" that looks like this. Feel free to use your creative judgement on the actual proportions. Remember! Grid!

  ![](https://ironboard-curriculum-content.s3.amazonaws.com/iOS/horizontal-profile/portrait.png)

  2. When the phone goes horizontal, let's hide that cover image and just display everything else. Grid!

  ![](http://ironboard-curriculum-content.s3.amazonaws.com/iOS/horizontal-profile/landscape.png)

  3. If the phone is an iPhone 6 plus and goes horizontal, add that cover image back in and put the other information all below it with the Profile pic next to the name, interesting fact and class name and the textView with more details to the right of that. Something like this:

  ![](http://ironboard-curriculum-content.s3.amazonaws.com/iOS/horizontal-profile/landscape%20big.png)

## Hints

  * Check out [Joe's blog](http://joemburgess.com/2014/10/26/size-classes-in-ios-8/) for more on working with Size Classes in iOS
  * You may have to remove constraints to get everything to work on landscape
  * Listening to rotation events in iOS 8 is as easy as overriding the `-(void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator` method.

<a href='https://learn.co/lessons/horizontal-profile' data-visibility='hidden'>View this lesson on Learn.co</a>
