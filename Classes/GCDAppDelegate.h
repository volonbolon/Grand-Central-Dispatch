#import <UIKit/UIKit.h>

@class GCDViewController;

@interface GCDAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GCDViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GCDViewController *viewController;

@end

