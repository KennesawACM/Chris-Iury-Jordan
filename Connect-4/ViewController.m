//
//  ViewController.m
//  Connect-4
//
//  Created by iury bessa on 4/18/14.
//  Copyright (c) 2014 iury bessa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *Columns;
@property (weak, nonatomic) IBOutlet UIImageView *RedPlayerIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *BluePlayerIndicator;
@property (weak, nonatomic) IBOutlet UIButton *ChangeTurnButton;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeTurns:(id)sender {
    if (self.RedPlayerIndicator.alpha < 1) {
        [self.RedPlayerIndicator setHighlighted:true];
        [self.BluePlayerIndicator setHighlighted:true];
    }
    else
    {
        [self.RedPlayerIndicator setHighlighted:false];
        [self.BluePlayerIndicator setHighlighted:false];
    }
}


@end
