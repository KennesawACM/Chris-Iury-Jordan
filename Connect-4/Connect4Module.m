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

-(bool) isColumnFull: (int) row{
    BOOL test = FALSE;
    if(grid[row][5] != 0){
        test =  true;
    }
    return test;
}

-(int) dropCoin:(int) row:(int) coin{
    int column = checkColumn(row);
    grid[row][column]= &coin;
    return column;
}

-(BOOL) isWinner:(int) column{
    return true;
}

-(int)checkColumn:(int) row{
    int num=0;
    for (int i = 0; i <= 5; i++)
    {
        if(grid[row][i] != None)
        {
            num += 1;
        }
    }
    return num;
}
@end
