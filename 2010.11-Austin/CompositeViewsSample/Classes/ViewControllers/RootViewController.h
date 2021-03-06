//
//  AppLayoutViewController.h
//  CompositeViewsSample
//
//  Created by Kirby Turner on 10/25/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

enum Schedule {
   kScheduleHandsOn = 1,
   kScheduleBusiness,
   kScheduleSightsAndSounds,
   kScheduleDevTips,
};

@interface RootViewController : UIViewController 
{
   UIView *_placeholderContent;
   UIView *_placeholderAppNavigation;
   UIView *_placeholderSpeaker;
   
   UIViewController *_contentViewController;
   UIViewController *_appNavigationViewController;
   UIViewController *_speakerViewController;
   
   NSMutableDictionary *_viewControllerCache;
   UIViewController *_currentContentViewController;
}

@property (nonatomic, retain) IBOutlet UIView *placeholderContent;
@property (nonatomic, retain) IBOutlet UIView *placeholderAppNavigation;
@property (nonatomic, retain) IBOutlet UIView *placeholderSpeaker;
@property (nonatomic, retain) IBOutlet UIViewController *appNavigationViewController;
@property (nonatomic, retain) IBOutlet UIViewController *speakerViewController;

- (void)showScheduleForTrack:(NSInteger)track;
- (void)showFullSchedule;
- (void)showTwitterFeed;

@end
