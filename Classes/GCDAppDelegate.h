//
//  GCDAppDelegate.h
//  GCD
//
//  Created by Ariel Rodriguez on 6/26/10.
//  Copyright Mobile Tonic 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GCDViewController;

@interface GCDAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GCDViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GCDViewController *viewController;

@end

