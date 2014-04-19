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
#define None 0

#define DIRECTION_RIGHT 1
#define DIRECTION_LEFT -1

#define DIRECTION_NEITHER 0
#define DIAGONAL_UP -1
#define DIAGONAL_DOWN 1

#define HORIZONTAL 0
#define VERTICAL_DOWN 1

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

// it would be best to not have a *int[][] just saying.

-(bool) isColumnFull: (int) row{
    BOOL test = FALSE;
    if(grid[row][5] != 0){
        test =  true;
    }
    return test;
}

-(int) dropCoin:(int) column:(int) coin{
    return 0;
}

-(BOOL) isWinner:(int)column coinType:(int)coin{
    int numberOfMatches = 0;
    
    // Needed to know how many coins are in each column
    int currentCoinPosition = 0;
    
    // only run these if statements when column is 0.
    // no need to check elements to the left that do not exist.
    if(column == 0)
    {
        if(currentCoinPosition > 3)
        {
            
            if( [self checkMatch:DIRECTION_RIGHT
                                   orientation:DIAGONAL_UP
                                         count:numberOfMatches
                                        column:column
                                           row:currentCoinPosition
                               coin:coin])
            {
                return true;
            }
        }
        
        if(currentCoinPosition < 4)
        {
            if( [self checkMatch:DIRECTION_RIGHT
                    orientation:DIAGONAL_DOWN
                          count:numberOfMatches
                         column:column
                            row:currentCoinPosition
                                coin:coin])
            {
                return true;
            }
            else if( [self checkMatch:DIRECTION_NEITHER
                            orientation:VERTICAL_DOWN
                                  count:numberOfMatches
                                 column:column
                                    row:currentCoinPosition
                                   coin:coin])
            {
                return true;
            }
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
        
    }
    else if(column == 6)
    {
        
    }
    else
    {
        // check diagonal
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
    
    if(grid[c+direction][r+VERT_DIAGONAL] == coin)
    {
        if(matches == 3)
        {
            return true;
        }
       return [self checkMatch:direction
                   orientation:VERT_DIAGONAL
                         count:matches + 1
                        column:c+direction
                           row:r+VERT_DIAGONAL
                          coin:coin];
    
    }
    return false;
}

-(int)checkColumn:(int) row{
    int num;
    for (int i = 0; i < 7; i++)
    {
        if(grid[row][i] == None)
        {
            
        }
    }
    return 0;
}
@end
