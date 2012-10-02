//
//  CalculatorViewController.m
//  CalculatorBrain
//
//  Created by Elia Schito on 2/10/12.
//  Copyright (c) 2012 Elia Schito. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL enteringANumber;
@end

@implementation CalculatorViewController

@synthesize display;
@synthesize enteringANumber;

- (IBAction)digitPressed:(UIButton *)sender {
  NSString *digit = [sender currentTitle];

  // if ([self.display.text isEqualToString:@"0"]) {
  if (self.enteringANumber) {
    self.display.text = [self.display.text stringByAppendingString:digit];
  } else {
    self.display.text = digit;
    self.enteringANumber = YES;
  }
}

- (IBAction)enterPressed {
}



- (IBAction)operationPressed:(UIButton *)sender {
  
}

@end
