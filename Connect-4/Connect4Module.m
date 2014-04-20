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

// it would be best to not have a *int[][] just saying.
-(bool) isColumnFull: (int) row{
    BOOL test = FALSE;
    if(grid[row][5] != 0){
        test =  true;
    }
    return test;
}

-(int) dropCoin:(int) coin inColumn:(int) column{
    int row = checkColumn(column);
    grid[column][row]= &coin;
    return row;
}

-(BOOL) isWinner:(int)column coinType:(int)coin{
    int numberOfMatches = 1;
    
    // Needed to know how many coins are in each column
    int currentCoinPosition = 0;
    
    
    if( [self checkMatch:VERT_UP
              horizontal:HORIZ_RIGHT
                   count:numberOfMatches
                  column:column
                     row:currentCoinPosition
                    coin:coin])
    {
        return true;
    }

    if( [self checkMatch:VERT_DOWN
              horizontal:HORIZ_RIGHT
                   count:numberOfMatches
                  column:column
                     row:currentCoinPosition
                    coin:coin])
    {
        return true;
    }
    
    if( [self checkMatch:VERT_NEITHER
              horizontal:HORIZ_RIGHT
                   count:numberOfMatches
                  column:column
                     row:currentCoinPosition
                    coin:coin])
    {
        return true;
    }

    if( [self checkMatch:VERT_UP
              horizontal:HORIZ_LEFT
                   count:numberOfMatches
                  column:column
                     row:currentCoinPosition
                    coin:coin])
    {
        return true;
    }
    
    if( [self checkMatch:VERT_DOWN
              horizontal:HORIZ_LEFT
                   count:numberOfMatches
                  column:column
                     row:currentCoinPosition
                    coin:coin])
    {
        return true;
    }
    
    if( [self checkMatch:VERT_NEITHER
              horizontal:HORIZ_LEFT
                   count:numberOfMatches
                  column:column
                     row:currentCoinPosition
                    coin:coin])
    {
        return true;
    }
    
    if( [self checkMatch:VERT_DOWN
              horizontal:HORIZ_NEITHER
                   count:numberOfMatches
                  column:column
                     row:currentCoinPosition
                    coin:coin])
    {
        return true;
    }
    return false;
}

-(BOOL)checkMatch:(int)VERT
       horizontal:(int)HORIZ
            count:(int)matches
           column:(int)c
              row:(int)r
             coin:(int)coin
{
    @try{
        if(grid[c+HORIZ][r+VERT] == coin)
        {
            if(matches == CONNECT_TOTAL)
            {
                return true;
            }
            else if(matches > CONNECT_TOTAL)
                return false;
            
           return [self checkMatch:VERT
                       horizontal:HORIZ
                             count:matches + 1
                            column:c+HORIZ
                               row:r+VERT
                              coin:coin];
        
        }
    }@catch(NSException *e)
    {
        return false;
    }
    return false;
}

-(int)NumColumn:(int) row{
    int num=0;
    while (grid[row][num] != None && num<=5) {
        num++;
    }
    return num;
}
@end
