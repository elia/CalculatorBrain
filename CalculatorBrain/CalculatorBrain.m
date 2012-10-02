//
//  CalculatorBrain.m
//  CalculatorBrain
//
//  Created by Elia Schito on 2/10/12.
//  Copyright (c) 2012 Elia Schito. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

- (NSMutableArray *)operandStack {
  if(!_operandStack) _operandStack = [[NSMutableArray alloc] init];
  return _operandStack;
}

- (void)pushOperand:(double)operand {
  [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double)popOperand {
  NSNumber *operand = [self.operandStack lastObject];
  if (operand) [self.operandStack removeLastObject];
  NSLog(@"pop operand: %@", operand);
  return [operand doubleValue];
}

- (double)performOperation {
  double result = 0;
  if (!self.operation) return result;

  double lastValue = [self popOperand];
  double firstValue = [self popOperand];

  NSLog(@"%f %@ %f", firstValue, self.operation, lastValue);

  if      ([self.operation isEqualToString:@"+"]) result = firstValue + lastValue;
  else if ([self.operation isEqualToString:@"*"]) result = firstValue * lastValue;
  else if ([self.operation isEqualToString:@"-"]) result = firstValue - lastValue;
  else if ([self.operation isEqualToString:@"/"]) result = firstValue / lastValue;
  self.operation = nil;

  [self pushOperand:result];
  return result;
}

@end
