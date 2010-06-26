//
//  GCDViewController.m
//  GCD
//
//  Created by Ariel Rodriguez on 6/26/10.
//  Copyright Mobile Tonic 2010. All rights reserved.
//

#import "GCDViewController.h"

@implementation GCDViewController
#pragma mark -
#pragma mark Properties
@synthesize calculatePiButton;
@synthesize piLabel;

- (void)viewDidUnload 
{
    [super viewDidUnload]; 
    
	self.calculatePiButton = nil;
    self.piLabel = nil;
}


- (void)dealloc 
{
    self.calculatePiButton = nil;
    self.piLabel = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark IBAction
- (IBAction)calculatePiButtonTapped
{
    dispatch_queue_t queue_calculate_pi = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t main_queue = dispatch_get_main_queue();
    
    dispatch_async(queue_calculate_pi, ^{
        // Gauss–Legendre algorithm
        // http://en.wikipedia.org/wiki/Gauss–Legendre_algorithm
        
        double a = 1.0; 
        double b = 1.0 / sqrt(2); 
        double t = 1.0 / 4.0; 
        double p = 1.0; 
        
        while ( YES ) {
            // This message is just to slow the pace
            [NSThread sleepForTimeInterval:1.0];
            double nextA = (a + b) / 2.0; 
            double nextB = sqrt(a * b); 
            double nextT = t - (p * pow(a - nextA, 2.0));
            double nextP = 2.0 * p; 
            
            NSString *piApproximationString = [[NSString alloc] initWithFormat:@"%.25f", (pow(a + b, 2.0)) / (4.0 * t)]; 

            dispatch_async(main_queue, ^{
                self.piLabel.text = piApproximationString; 
            }); 
            
            [piApproximationString release]; 
            piApproximationString = nil;
            
            a = nextA; 
            b = nextB; 
            t = nextT; 
            p = nextP; 
        }
    }); 
}
@end
