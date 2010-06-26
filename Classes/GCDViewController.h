#import <UIKit/UIKit.h>

@interface GCDViewController : UIViewController {
    UIButton *giveMePrimesButton; 
    UILabel *primesLabel; 
}

@property (nonatomic, retain) IBOutlet UIButton *giveMePrimesButton;
@property (nonatomic, retain) IBOutlet UILabel *primesLabel;

- (IBAction)startCrunchingPrimes;

@end

