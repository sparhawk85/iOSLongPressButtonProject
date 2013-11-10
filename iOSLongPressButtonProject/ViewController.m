//
//  ViewController.m
//  iOSLongPressButtonProject
//
//  Created by Kamil Maraś on 10.11.2013.
//  Copyright (c) 2013 Kamil Maras. All rights reserved.
//

#import "ViewController.h"

#define BUTTON_HEIGHT 200
@interface ViewController ()

@end

@implementation ViewController

@synthesize canBeAnimated, animationFinished;
@synthesize greenButtonImage, redButtonImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    canBeAnimated = YES;
    animationFinished = NO;
}

#pragma mark -
#pragma mark IBActions
- (IBAction)longPress:(UIButton *)sender
{
    if(!canBeAnimated) {
        return;
    }
    [UIView animateWithDuration:1.6
                          delay:0.0
                        options: UIViewAnimationOptionCurveLinear
                     animations:^{
                         greenButtonImage.frame = CGRectMake(
                                                             greenButtonImage.frame.origin.x,
                                                             greenButtonImage.frame.origin.y - BUTTON_HEIGHT * 0.8,
                                                             greenButtonImage.frame.size.width,
                                                             BUTTON_HEIGHT * 0.8);
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done animation");
                         if(finished) {
                             NSLog(@"Run rest of animation");
                             animationFinished = YES;
                             [UIView animateWithDuration:0.4
                                                   delay:0.0
                                                 options: UIViewAnimationOptionCurveLinear
                                              animations:^{
                                                  greenButtonImage.frame =
                                                  CGRectMake(
                                                             greenButtonImage.frame.origin.x,
                                                             greenButtonImage.frame.origin.y - BUTTON_HEIGHT * 0.2,
                                                             greenButtonImage.frame.size.width,
                                                             BUTTON_HEIGHT
                                                             );
                                              }
                                              completion:nil
                              ];
                             
                             UIAlertView *av =[[UIAlertView alloc] initWithTitle:@"Run"
                                                                         message:@"Succes!"
                                                                        delegate:nil
                                                               cancelButtonTitle:nil
                                                               otherButtonTitles:@"OK",nil];
                             [av show];
                         }
                         
                     }];
    canBeAnimated = NO;
}

- (IBAction)cancelLongPress:(UIButton *)sender
{
        if (animationFinished == NO) {
            NSLog(@"Cancel animation");
            [greenButtonImage.layer removeAllAnimations];
            greenButtonImage.frame = CGRectMake(
                                                redButtonImage.frame.origin.x,
                                                redButtonImage.frame.origin.y+BUTTON_HEIGHT,
                                                redButtonImage.frame.size.width,
                                                0.f
                                                );
            canBeAnimated = YES;
        }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
