//
//  CalculatorViewController.m
//  CalculatorBrain
//
//  Created by Elia Schito on 2/10/12.
//  Copyright (c) 2012 Elia Schito. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL enteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

@synthesize brain           = _brain;
@synthesize display         = _display;
@synthesize enteringANumber = _enteringANumber;

- (CalculatorBrain *)brain {
  if (!_brain) _brain = [[CalculatorBrain alloc] init];
  return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
  NSString *digit = [sender currentTitle];

  if (self.enteringANumber) {
    if ([self.display.text isEqualToString:@"0"]) self.display.text = @"";
    digit = [self.display.text stringByAppendingString:digit];
  } else {
    if ([digit isEqualToString:@"."]) digit = @"0.";
    self.enteringANumber = YES;
  }

  self.display.text = digit;
}

- (void)performOperation {
  double result     = [self.brain performOperation];
  self.display.text = [NSString stringWithFormat:@"%g", result];
}

- (IBAction)enterPressed {
  self.enteringANumber = NO;
  [self.brain pushOperand: [self.display.text doubleValue]];
  if (self.brain.operation) [self performOperation];
}

- (IBAction)operationPressed:(UIButton *)sender {
  if (self.enteringANumber) [self enterPressed];
  self.brain.operation = [sender currentTitle];
}

@end
