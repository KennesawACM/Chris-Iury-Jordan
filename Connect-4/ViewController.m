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
@property (nonatomic) BOOL redPlayersTurn;
@property (strong,nonatomic) UIImageView *coin;
@property (strong, nonatomic) NSMutableArray *activeCoins;
@property (strong, nonatomic) UIImageView *winnerBanner;
@property (weak, nonatomic) IBOutlet UIButton *gameButton;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    connect4 = [Connect4Module new];
    self.activeCoins = [[NSMutableArray alloc] init];
    self.gameButton.alpha = 0;
    self.gameButton.enabled = false;
    

//    [connect4 dropCoin:1 inColumn:0];
//    NSLog(@"%d", [connect4 loc:0]);
//    [connect4 dropCoin:1 inColumn:1];
//    NSLog(@"%d", [connect4 loc:1]);
//    [connect4 dropCoin:2 inColumn:2];
//    NSLog(@"%d", [connect4 loc:2]);
//    [connect4 dropCoin:1 inColumn:3];
//    NSLog(@"%d", [connect4 loc:3]);
//    [connect4 dropCoin:1 inColumn:4];
//    NSLog(@"%d", [connect4 loc:4]);

//    [connect4 dropCoin:1 inColumn:0];[
//    NSLog(@"%d", [connect4 loc:0]);
//    [connect4 dropCoin:1 inColumn:0];
//    NSLog(@"%d", [connect4 loc:0]);
//    [connect4 dropCoin:1 inColumn:0];
//    NSLog(@"%d", [connect4 loc:0]);
//    [connect4 dropCoin:1 inColumn:0];
//    NSLog(@"%d", [connect4 loc:0]);
//    [connect4 dropCoin:1 inColumn:0];
//    NSLog(@"%d", [connect4 loc:0]);
    
//    NSLog(@"->%@", ([connect4 isWinner:4 coinType:1] == true)? @"TRUE":@"FALSE");
    
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
    
    self.coin = [[UIImageView alloc] initWithFrame:CGRectMake(buttonPosition.x, buttonPosition.y - 50, 45, 41.6f)];
    
    if (self.redPlayersTurn) {
        self.coin.image = [UIImage imageNamed:@"red_coin"];
    }
    else
    {
        self.coin.image = [UIImage imageNamed:@"blue_coin"];
    }
    
    self.coin.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.coin];
    [self.view sendSubviewToBack:self.coin];
}

- (IBAction)releaseCoin:(id)sender  {
    
    int currentCoin = 2;
    if (self.redPlayersTurn)
    {
        currentCoin = 1;
    }
    
    int columnIndex = [self.Columns indexOfObject:sender];
    
    if (![connect4 isColumnFull:columnIndex])
    {
        self.gameButton.alpha = 1;
        self.gameButton.enabled = true;
        [connect4 dropCoin:currentCoin inColumn:columnIndex];
        [UIView animateWithDuration:0.8f
                              delay:0
                            options: UIViewAnimationOptionCurveLinear
                         animations:^{
            int coinNum = [connect4 numCoins:columnIndex];
            int newYPos = self.view.bounds.size.height - (coinNum * (self.coin.bounds.size.height));
            [self.coin setFrame:CGRectMake(self.coin.frame.origin.x, newYPos, self.coin.frame.size.width, self.coin.frame.size.height)];
            [self.activeCoins addObject:self.coin];
        }
                         completion:nil];
        
        if ([connect4 isWinner:columnIndex coinType:currentCoin]) {
            for (UIButton *button in self.Columns) {
                button.enabled = false;
            }
            [self declareWinner];
        }
        [self changeTurns];
    }
    else
    {
        [self.coin removeFromSuperview];
    }
}

-(void)declareWinner{
    NSString *winner;
    if (self.redPlayersTurn) {
        winner = @"Red";
    }
    else
    {
        winner = @"Blue";
    }
    self.winnerBanner = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_Winner",winner]]];
    self.winnerBanner.frame = CGRectMake(self.view.bounds.size.width - 115, 0, 100, 0);
    [self.view addSubview:self.winnerBanner];
    
    [UIView animateWithDuration:0.8f
                     animations:^{
                         self.winnerBanner.frame = CGRectMake(self.winnerBanner.frame.origin.x, self.winnerBanner.frame.origin.y, 100, 275);
                     }];
    
}

- (IBAction)newGame:(id)sender {
    for (UIImageView *coin in self.activeCoins) {
        
        //Animation to drop coins and remove them from view
        [UIView animateWithDuration:0.2*((self.view.bounds.size.height - coin.frame.origin.y)/coin.frame.size.height)
                              delay:0
                            options: UIViewAnimationOptionCurveLinear
                         animations:^{
            float newYpos = self.view.bounds.size.height + coin.frame.size.height;
            [coin setFrame:CGRectMake(coin.frame.origin.x, newYpos, coin.frame.size.width, coin.frame.size.height)];
        }
                         completion:^(BOOL finished){
                             [coin removeFromSuperview];
                         }];
    }
    [self.activeCoins removeAllObjects];
    [UIView animateWithDuration:0.8f
                     animations:^{
                         self.winnerBanner.frame = CGRectMake(self.winnerBanner.frame.origin.x, self.winnerBanner.frame.origin.y, 100, 0);
                     }
                     completion:^(BOOL finished){
                         [self.winnerBanner removeFromSuperview];
                     }];
    self.gameButton.alpha = 0;
    self.gameButton.enabled = false;
    
    connect4 = [connect4 init];
    
    for (UIButton *button in self.Columns) {
        button.enabled = true;
    }
    
    if (self.redPlayersTurn == false) {
        [self.RedPlayerIndicator setImage:[UIImage imageNamed:@"red_coin"]];
        [self.BluePlayerIndicator setImage:[UIImage imageNamed:@"blue_transparent_coin"]];
        self.redPlayersTurn = true;
    }
    
}
- (IBAction)dragExit:(id)sender {
    [self.coin removeFromSuperview];
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
