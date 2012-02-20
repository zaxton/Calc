//
//  CalcViewController.m
//  Calculator
//
//  Created by Zachary Easley on 2/4/12.
//  Copyright (c) 2012 OTC. All rights reserved.
//

#import "CalcViewController.h"
#import "CalcBrain.h"

@interface CalcViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfANumber;
@property (nonatomic, strong) CalcBrain *brain; 
@end

@implementation CalcViewController


@synthesize showCurrent = _showCurrent;
@synthesize Display = _Display;

@synthesize userIsInTheMiddleOfANumber = _userIsInTheMiddleOfANumber;

@synthesize brain = _brain;

-(CalcBrain *)brain{
    if (!_brain) _brain = [[CalcBrain alloc] init];
    return _brain;
}

- (IBAction)buttonPress:(UIButton *)sender {
    NSString *digit = sender.currentTitle;
 
    if (self.userIsInTheMiddleOfANumber){
        self.Display.text = [ self.Display.text stringByAppendingString:digit]; // My Display's text = my display's text appened to digit
        self.showCurrent.text = [ self.showCurrent.text stringByAppendingString:digit];    
    } 
    else {
        self.showCurrent.text = digit;
        self.Display.text = digit;
        self.userIsInTheMiddleOfANumber = YES;
    }
    
    
}
- (IBAction)enterPress {
    
    [self.brain pushOperand:[self.Display.text doubleValue]];
    
    self.userIsInTheMiddleOfANumber = NO;

}
- (IBAction)opperationPress:(UIButton *)sender {
    
    if (self.userIsInTheMiddleOfANumber) [self enterPress];
        
    double result = [self.brain performOperation:sender.currentTitle];
    
    NSString *resultsString = [NSString stringWithFormat:@"%g", result];
    
    self.Display.text = resultsString; 
        
}


- (IBAction)enterClear:(id)sender {
    
}



- (void)viewDidUnload {
    [self setShowCurrent:nil];
    [self setShowCurrent:nil];
    [super viewDidUnload];
}
@end
