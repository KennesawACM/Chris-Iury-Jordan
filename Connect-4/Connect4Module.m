//
//  Connect4Module.m
//  Connect-4
//
//  Created by Jordan Thomas on 4/18/14.
//  Copyright (c) 2014 iury bessa. All rights reserved.
//

#import "Connect4Module.h"
#define Red 1
#define Blue 2
#define NONE 0

#define COLUMN_LENGTH 6
#define ROW_LENGTH 7

#define DIRECTION_RIGHT 1
#define DIRECTION_LEFT -1

#define DIRECTION_NEITHER 0
#define DIAGONAL_UP -1
#define DIAGONAL_DOWN 1

#define HORIZONTAL 0
#define VERTICAL_DOWN 1

#define MIN_LENGTH 0
#define MIN_HEIGHT 0
#define MAX_LENGTH 6
#define MAX_HEIGHT 5


#define CONNECT_TOTAL 4

@implementation Connect4Module



-(void) setRow: (int *) row{
    
}

-(void) setColumn: (int *) row{
    
}

-(int *) getRow{
    return 0;
}

-(int *) getColumn{
    return 0;
}

-(id) init
{
    if( self = [super init] )
        for (int i =0; i <ROW_LENGTH; i++)
        {
            for (int j=0; j < COLUMN_LENGTH; j++) {
                grid[i][j] =NONE;
            }
        }
    return self;
    
}

// it would be best to not have a *int[][] just saying.

-(bool) isColumnFull: (int) row{
    BOOL test = FALSE;
    if(grid[row][5] != 0){
        test =  true;
    }
    return test;
}

//return the number
-(int)numCoins:(int) column{
    int num=0;
    while (grid[column][num] != NONE && num<=5) {
        num++;
    }
    return num;
}

-(int) dropCoin:(int) coin inColumn:(int) column{
    int row = [self numCoins:column];
    grid[column][row]= coin;
    return row;
}



-(BOOL) isWinner:(int)column coinType:(int)coin{
    int numberOfMatches = 1;
    
    // Needed to know how many coins are in each column
    int currentCoinPosition = 0;
    
    // only run these if statements when column is 0.
    // no need to check elements to the left that do not exist.
    if( [self checkMatch:DIRECTION_RIGHT
             orientation:DIAGONAL_UP
                   count:numberOfMatches
                  column:column
                     row:currentCoinPosition
                    coin:coin])
    {
        return true;
    }

    if( [self checkMatch:DIRECTION_RIGHT
             orientation:DIAGONAL_DOWN
                   count:numberOfMatches
                  column:column
                     row:currentCoinPosition
                    coin:coin])
    {
        return true;
    }
    
    if( [self checkMatch:DIRECTION_NEITHER
                  orientation:VERTICAL_DOWN
                        count:numberOfMatches
                       column:column
                          row:currentCoinPosition
                         coin:coin])
    {
        return true;
    }

    if( [self checkMatch:DIRECTION_RIGHT
         orientation:HORIZONTAL
               count:numberOfMatches
              column:column
                 row:currentCoinPosition
                coin:coin])
    {
        return true;
    }
    
    if( [self checkMatch:DIRECTION_LEFT
             orientation:HORIZONTAL
                   count:numberOfMatches
                  column:column
                     row:currentCoinPosition
                    coin:coin])
    {
        return true;
    }
    
    if( [self checkMatch:DIRECTION_LEFT
             orientation:DIAGONAL_UP
                   count:numberOfMatches
                  column:column
                     row:currentCoinPosition
                    coin:coin])
    {
        return true;
    }
    
    if( [self checkMatch:DIRECTION_LEFT
             orientation:DIAGONAL_DOWN
                   count:numberOfMatches
                  column:column
                     row:currentCoinPosition
                    coin:coin])
    {
        return true;
    }
    
    


    return false;
}

-(BOOL)checkMatch:(int)direction
      orientation:(int)VERT_DIAGONAL
            count:(int)matches
           column:(int)c
              row:(int)r
             coin:(int)coin
{
    @try{
        if(grid[c+direction][r+VERT_DIAGONAL] == coin)
        {
            if(matches == CONNECT_TOTAL)
            {
                return true;
            }
            else if(matches > CONNECT_TOTAL)
                return false;
            
           return [self checkMatch:direction
                       orientation:VERT_DIAGONAL
                             count:matches + 1
                            column:c+direction
                               row:r+VERT_DIAGONAL
                              coin:coin];
        
        }
    }@catch(NSException *e)
    {
        return false;
    }
    return false;
    
}


@end
