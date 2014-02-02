//
//  AMTestChallenge.m
//  AncientModes
//
//  Created by Vladimir Mollov on 1/26/14.
//  Copyright (c) 2014 Vladimir Mollov. All rights reserved.
//

#import "AMTestChallenge.h"
#import "AMSettingsAndUtilities.h"
#import "NSMutableArray+Shuffling.h"

@implementation AMTestChallenge

-(id)initWithRandModeRandNote{
    AMScale *challengeScale = [AMScale generateRandomScale];
    //get the variation mode so we can include it in the presented answers
    NSString *variationMode = [challengeScale.mode getVariationMode];
   
    //generate the presented answers
    int presentedAnswersCount = 4;
    int index = 0;
    NSMutableArray *randomAnswers = [[NSMutableArray alloc] initWithCapacity:presentedAnswersCount];
    
    //add the correct answer
    [randomAnswers addObject:challengeScale.mode.name];
    index++; //to account for adding the correct answer
    
    //add the variation mode
    if(variationMode != nil){
        [randomAnswers addObject:variationMode];
        index++; //to account for adding the variation mode
    }
    
    for(index = index; index<presentedAnswersCount; index++){
        NSString *randomModeAnswer = [AMMode generateRandomModeName];
        BOOL skip = false;
        //prevent the correct mode (or its alias) from being put in the pool of incorrect presented answer
        if([challengeScale.mode isAliasToMode:randomModeAnswer]) skip = true;
        
        //prevent a RandomModeAnswer to be put in the pool more than once
        for(int n=0; n<index; n++){
            if([randomModeAnswer compare:[randomAnswers objectAtIndex:n]] == NSOrderedSame){
                skip =true;
                break;
            }
        }
        
        //if this random answer has failed a requirement we will not use it
        if (skip){
            index--;
            continue;
        }
        [randomAnswers addObject:randomModeAnswer];
    }
    
    //randomize the order of the answers
    [randomAnswers shuffle];
    
    return [self initWithScale:challengeScale presentedAnsers:randomAnswers];
}
-(id)initWithScale:(AMScale *)scale presentedAnsers:(NSArray *)answers{
    if(self = [super init]){
        _scale = scale;
        _presentedAnswers = [[NSArray alloc]initWithArray:answers];
    }//if(self = [super init])

    return self;
}

@end

//implement logic for pentantonic and octatonic to always present counterparts in answers
//remmeber to adjust the piano aupreset to include the full piano range