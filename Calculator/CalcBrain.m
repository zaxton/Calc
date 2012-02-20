//
//  CalcBrain.m
//  Calculator
//
//  Created by Zachary Easley on 2/4/12.
//  Copyright (c) 2012 OTC. All rights reserved.
//

#import "CalcBrain.h"

@interface CalcBrain()
@property (nonatomic, strong) NSMutableArray * programStack;
@end

@implementation CalcBrain

@synthesize programStack = _programStack;

-(NSMutableArray *)programStack{
    
    if (_programStack == nil){
        _programStack = [[NSMutableArray alloc] init];
    }
    return _programStack;
}


-(void)pushOperand:(double)operand{
    [self.programStack addObject:[NSNumber numberWithDouble:operand]];
    
}
-(double)performOperation:(NSString *)operation{
    
    [self.programStack addObject:operation];
    return [CalcBrain runProgram:self.program];
}   
- (id)program
    {
        return [self.programStack copy];
    }
    
    
+ (NSString *)discriptionOfProgram:(id)program
    {
        return @"Discription. Part of Homework";
    }

+ (double)popOperandOffStack:(NSMutableArray *)stack{
    double result = 0;
    id topOfStack = [stack lastObject];
    if (topOfStack) [stack removeLastObject];
    
    if ([topOfStack isKindOfClass:[NSNumber class]]){
        result = [topOfStack doubleValue];
    }
    
    else if ([topOfStack isKindOfClass:[NSString class]]){
        
        NSString *operation = topOfStack;
        // calculate result
        
        if ([operation isEqualToString:@"+"]){
            result = [self popOperandOffStack:stack] + [self popOperandOffStack:stack];
        } else if  ([@"-" isEqualToString:operation]){
            result = - [self popOperandOffStack:stack] + [self popOperandOffStack:stack];  
        } else if ([@"/" isEqualToString:operation]){
            double divisor = [self popOperandOffStack:stack];
            if (divisor){
                result = [self popOperandOffStack:stack] / divisor;
            } else {
                result = 0;
            }
        } else if ([@"*" isEqualToString:operation]){
            result = [self popOperandOffStack:stack] * [self popOperandOffStack:stack];    
        } else if ([@"^" isEqualToString:operation]){
            double square = [self popOperandOffStack:stack];
            result = square * square;
        } 
        else if ([@"sin" isEqualToString:operation]){
            double sine = [self popOperandOffStack:stack];
            result = sin(sine);
        }
        else if ([@"cos" isEqualToString:operation]){
            double cosine = [self popOperandOffStack:stack];
            result = cos(cosine);        
        }
        else if ([@"tan" isEqualToString:operation]){
            double tangent = [self popOperandOffStack:stack];
            result = tan(tangent);       
        }   
        else if ([@"sqrt" isEqualToString:operation]){
            double sqared = [self popOperandOffStack:stack];
            result = sqrt(sqared);       
        } 
        else if ([@"pi" isEqualToString:operation]){
            result = M_PI;      
        }  
        else{
            result = 0;
        }   
        
        
    }
    
    return result;
    
}


+ (double)runProgram:(id)program{
    
    NSMutableArray *stack;
    if ([program isKindOfClass:[NSArray class]]){
        stack = [program mutableCopy];
    }
    return [self popOperandOffStack:stack];
}

@end
