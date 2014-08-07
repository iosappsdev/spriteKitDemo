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
        modelObjectIndex = 0;
        NSLog(@"The Current Object Index: %i",modelObjectIndex);
        
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
        
        if (modelObjectIndex < _localModel.count) {
            NSLog(@"The Current Object Index: %i",modelObjectIndex);
            modelObjectIndex++;
            myLabel.text = [_localModel objectAtIndex:modelObjectIndex];
            
        } else if (modelObjectIndex >= _localModel.count) {
            myLabel.text = [_localModel objectAtIndex:modelObjectIndex];
            modelObjectIndex = 0;
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"SpriteKit Demo" message:@"You Finished The Word List" delegate:self cancelButtonTitle:@"Dissmiss" otherButtonTitles:nil];
            [alert show];
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

@end
