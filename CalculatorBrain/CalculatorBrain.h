//
//  CalculatorBrain.h
//  CalculatorBrain
//
//  Created by Elia Schito on 2/10/12.
//  Copyright (c) 2012 Elia Schito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

@property (nonatomic, strong) NSString *operation;

- (void)pushOperand:(double)operand;
- (double)performOperation;

@end
