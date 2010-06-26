#import "GCDViewController.h"

#define MAX_I 1000

@implementation GCDViewController
#pragma mark -
#pragma mark Properties
@synthesize giveMePrimesButton;
@synthesize primesLabel;

- (void)viewDidUnload 
{
    [super viewDidUnload]; 
    
	self.giveMePrimesButton = nil;
    self.primesLabel = nil;
}


- (void)dealloc 
{
    self.giveMePrimesButton = nil;
    self.primesLabel = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark IBAction
- (IBAction)startCrunchingPrimes
{
    dispatch_queue_t queue_calculate_pi = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t main_queue = dispatch_get_main_queue();
    
    dispatch_async(queue_calculate_pi, ^{
        int i, j, sieve[MAX_I], primecount=0, prime[MAX_I];
        
        for(i=0; i<MAX_I; i++){
            sieve[i]=1;
        }
        sieve[0]=sieve[1]=0;
        for(i=2; i<MAX_I-1; i++){
            [NSThread sleepForTimeInterval:0.5];
            while(sieve[i]==0 && i<MAX_I) {
                i++;
            }
            
            prime[primecount] = i;
            
            dispatch_async(main_queue, ^{
                NSString *primeString = [[NSString alloc] initWithFormat:@"%d", i]; 
                self.primesLabel.text = primeString; 
                [primeString release]; 
                primeString = nil; 
            }); 
            
            for(j=i*i; j<MAX_I; j+=i){sieve[j]=0;}
            primecount++;
        }
    }); 
}
@end
