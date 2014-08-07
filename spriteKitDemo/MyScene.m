//
//  MyScene.m
//  spriteKitDemo
//
//  Created by Ricardo Ruiz on 8/5/14.
//  Copyright (c) 2014 iOS Apps Development. All rights reserved.
//

#import "MyScene.h"
#import "Data.h"

// Set LessonID
static const int currentLessonID = 1;

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        synthesizer = [[AVSpeechSynthesizer alloc]init];
        
        Data *localModel = [[Data alloc]init];
        _localModel = [localModel getDataWithLessonID:currentLessonID];
        
        self.backgroundColor = [SKColor grayColor];
        
        myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = [_localModel objectAtIndex:modelObjectIndex];
        myLabel.fontSize = 120;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        [self addChild:myLabel];
        
        SKLabelNode *next = [SKLabelNode labelNodeWithFontNamed:@"ChalkboardSE"];
        next.name = @"nextButton";
        next.text = @"Next";
        next.fontSize = 20;
        next.position = CGPointMake(600,300);
        [self addChild:next];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    // Button Action
    if ([node.name isEqualToString:@"nextButton"]) {
        
        // Working
        if (modelObjectIndex <= 8) {
            NSLog(@"The Current Object Index: %i",modelObjectIndex);
            myLabel.text = [_localModel objectAtIndex:modelObjectIndex];
            modelObjectIndex++;
        } else if (modelObjectIndex == 9) {
            myLabel.text = [_localModel objectAtIndex:modelObjectIndex];
            NSLog(@"The Current Object Index: %i",modelObjectIndex);
            modelObjectIndex = 0;
        
        // Testing w/Model
        }
    } else {
        speech = [AVSpeechUtterance speechUtteranceWithString:[_localModel objectAtIndex:modelObjectIndex]];
        [speech setRate:0.050f];
        [speech setVolume:0.8f];
        [synthesizer speakUtterance:speech];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex) {
        case 0: myLabel.text = [_localModel objectAtIndex:modelObjectIndex];
            break;
            
        default:
            break;
    }
}

@end
