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
@property (nonatomic) BOOL redPlayersTurn;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.redPlayersTurn = true;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)releaseCoin:(id)sender  {
    
    
    
}



- (IBAction)changeTurns:(id)sender {
    
    if (self.redPlayersTurn == false) {
        [self.RedPlayerIndicator setImage:[UIImage imageNamed:@"red_coin"]];
        [self.BluePlayerIndicator setImage:[UIImage imageNamed:@"blue_transparent_coin"]];
        self.redPlayersTurn = true;
    }
    else
    {
        [self.RedPlayerIndicator setImage:[UIImage imageNamed:@"red_transparent_coin"]];
        [self.BluePlayerIndicator setImage:[UIImage imageNamed:@"blue_coin"]];
        self.redPlayersTurn = false;
    }
}


@end
