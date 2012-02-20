//
//  CalcBrain.h
//  Calculator
//
//  Created by Zachary Easley on 2/4/12.
//  Copyright (c) 2012 OTC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalcBrain : NSObject

-(void)pushOperand:(double)operand;
-(double)performOperation:(NSString *)operation;

@property (readonly) id program;

+ (double)runProgram:(id)program;

+ (NSString *)discriptionOfProgram:(id)program;
@end
