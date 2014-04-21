//
//  Connect4Module.h
//  Connect-4
//
//  Created by Jordan Thomas on 4/18/14.
//  Copyright (c) 2014 iury bessa. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RED 1
#define BLUE 2

#define NUM_COLUMNS 7
#define NUM_ROWS 6

@interface Connect4Module : NSObject
{
    int grid[NUM_COLUMNS][NUM_ROWS];
}
-(id)init;
-(bool) isColumnFull: (int) full;
-(int)numCoins:(int) column;
-(int) dropCoin:(int) coin inColumn:(int) column;
-(BOOL) isWinner:(int)column coinType:(int)coin;
-(int)loc:(int) column;

@end

