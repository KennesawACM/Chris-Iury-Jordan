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
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;
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

- (IBAction)selectColumn:(id)sender {
    UIButton *columnButton = [self.Columns objectAtIndex:[self.Columns indexOfObject:sender]];
    
    CGPoint buttonPosition = columnButton.frame.origin;
    
    UIImageView *coin = [[UIImageView alloc] initWithFrame:CGRectMake(buttonPosition.x, buttonPosition.y - 50, 45, 40)];
    
    if (self.redPlayersTurn) {
        coin.image = [UIImage imageNamed:@"red_coin"];
    }
    else
    {
        coin.image = [UIImage imageNamed:@"blue_coin"];
    }
    
    coin.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:coin];
}

- (IBAction)releaseCoin:(id)sender  {
    int currentCoin = 2;
    if (self.redPlayersTurn)
    {
        currentCoin = 1;
    }
    
    //if (![self.game isColumnFull])
    {
        int columnIndex = [self.Columns indexOfObject:sender];
      //  [self.game dropCoin:currentCoin inColumn:columnIndex];
        //if (self.game isWinner:columnIndex coinType:currentCoin) {
            if (self.redPlayersTurn) {
                [self.winnerLabel setText:@"Red Wins"];
            }
            else
            {
                [self.winnerLabel setText:@"Blue Wins"];
            }
      //  }
        
        
        [self changeTurns];
    }
}



- (void)changeTurns{
    
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
