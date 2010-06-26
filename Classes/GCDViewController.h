//
//  GCDViewController.h
//  GCD
//
//  Created by Ariel Rodriguez on 6/26/10.
//  Copyright Mobile Tonic 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCDViewController : UIViewController {
    UIButton *calculatePiButton; 
    UILabel *piLabel; 
}

@property (nonatomic, retain) IBOutlet UIButton *calculatePiButton;
@property (nonatomic, retain) IBOutlet UILabel *piLabel;

- (IBAction)calculatePiButtonTapped;

@end

