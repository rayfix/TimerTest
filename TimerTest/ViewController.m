//
//  ViewController.m
//  TimerTest
//
//  Created by Ray Fix on 6/18/12.
//  Copyright (c) 2012 Pelfunc Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSTimer* timer;
@end

@implementation ViewController
@synthesize timeLabel = _timeLabel;
@synthesize timer = _timer;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
  [self setTimeLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)viewWillAppear:(BOOL)animated
{
  self.timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(timerUpdate:) userInfo:nil repeats:YES];
  [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
  
}

-(void)viewWillDisappear:(BOOL)animated
{
  [self.timer invalidate];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return YES;
}

- (void)timerUpdate:(id)sender
{
  static int count;
  self.timeLabel.text = [NSString stringWithFormat:@"%d", count];
   ++count;
}

@end
