//
//  Connect4Module.m
//  Connect-4
//
//  Created by Jordan Thomas on 4/18/14.
//  Copyright (c) 2014 iury bessa. All rights reserved.
//

#import "Connect4Module.h"
#define NONE 0

#define HORIZ_RIGHT 1
#define HORIZ_LEFT -1
#define HORIZ_NEITHER 0

#define VERT_NEITHER 0
#define VERT_UP -1
#define VERT_DOWN 1

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
        for (int i =0; i <NUM_COLUMNS; i++)
        {
            for (int j=0; j < NUM_ROWS; j++) {
                grid[i][j] =NONE;
            }
        }
    return self;
    
}

// it would be best to not have a *int[][] just saying.
-(bool) isColumnFull: (int) column{
    BOOL test = FALSE;
    if(grid[column][0] != NONE){
        test =  true;
    }
    return test;
}

//return the number of coins in a column
-(int)numCoins:(int) column{
    int num = 0;
    while ((grid[column][num] != BLUE && grid[column][num] != RED) && num <  NUM_ROWS) {
        num++;
    }
    return NUM_ROWS - num;
}

-(int) dropCoin:(int) coin inColumn:(int) column{
    int row = NUM_ROWS - [self numCoins:column] - 1;
    grid[column][row]= coin;
    return row;
}

-(int)loc:(int)column
{
    return NUM_ROWS - [self numCoins:column];
}

-(BOOL) isWinner:(int)column coinType:(int)coin{
    int *numberOfMatches = malloc(sizeof(int));
    *numberOfMatches = 1;
    
    // Needed to know how many coins are in each column
    int currentCoinPosition = NUM_ROWS - [self numCoins:column] ;
    
    
    if( [self checkMatch:VERT_UP
              horizontal:HORIZ_RIGHT
                   count:numberOfMatches
                  column:column
                     row:currentCoinPosition
                    coin:coin])
    {
        return true;
    }
    *numberOfMatches = 1;
    
    if( [self checkMatch:VERT_DOWN
              horizontal:HORIZ_RIGHT
                   count:numberOfMatches
                  column:column
                     row:currentCoinPosition
                    coin:coin])
    {
        return true;
    }
    *numberOfMatches = 1;
    
    if( [self checkMatch:VERT_NEITHER
              horizontal:HORIZ_RIGHT
                   count:numberOfMatches
                  column:column
                     row:currentCoinPosition
                    coin:coin])
    {
        return true;
    }
    *numberOfMatches = 1;
    
    if( [self checkMatch:VERT_UP
              horizontal:HORIZ_LEFT
                   count:numberOfMatches
                  column:column
                     row:currentCoinPosition
                    coin:coin])
    {
        return true;
    }
    *numberOfMatches = 1;
    
    if( [self checkMatch:VERT_DOWN
              horizontal:HORIZ_LEFT
                   count:numberOfMatches
                  column:column
                     row:currentCoinPosition
                    coin:coin])
    {
        return true;
    }
    *numberOfMatches = 1;
    
    if( [self checkMatch:VERT_NEITHER
              horizontal:HORIZ_LEFT
                   count:numberOfMatches
                  column:column
                     row:currentCoinPosition
                    coin:coin])
    {
        return true;
    }
    *numberOfMatches = 1;
    
    if( [self checkMatch:VERT_DOWN
              horizontal:HORIZ_NEITHER
                   count:numberOfMatches
                  column:column
                     row:currentCoinPosition
                    coin:coin])
    {
        return true;
    }
    *numberOfMatches = 1;
    
    return false;
}

-(BOOL)checkMatch:(int)VERT
       horizontal:(int)HORIZ
            count:(int*)matches
           column:(int)c
              row:(int)r
             coin:(int)coin
{
    @try{
        int directionOne = grid[c+HORIZ][r+VERT];
        int directionTwo = 0;
        if(*matches == 1)
        {
            directionTwo = grid[c+(HORIZ*-1)][r+(VERT*-1)];
            if(directionTwo == coin)
            {
                *matches += 1;
                if( [self checkMatch:VERT * -1
                          horizontal:HORIZ * -1
                               count:matches
                              column:c+(HORIZ*-1)
                                 row:r+(VERT*-1)
                                coin:coin])
                {
                    return TRUE;
                }
            }

        }
        if(*matches == CONNECT_TOTAL)
        {
            return true;
        }
        else if(*matches > CONNECT_TOTAL)
            return false;
        
        if(directionOne == coin)
        {
            *matches += 1;
           if( [self checkMatch:VERT
                       horizontal:HORIZ
                             count:matches
                            column:c+HORIZ
                               row:r+VERT
                              coin:coin])
           {
               return TRUE;
           }
        
        }
        
    }@catch(NSException *e)
    {
        return false;
    }
    return false;
}


@end
