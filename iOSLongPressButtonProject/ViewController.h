//
//  ViewController.h
//  iOSLongPressButtonProject
//
//  Created by Kamil Maraś on 10.11.2013.
//  Copyright (c) 2013 Kamil Maras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    BOOL canBeAnimated, animationFinished;
    IBOutlet UIImageView *greenButtonImage, *redButtonImage;
}

@property (nonatomic, retain) UIImageView *greenButtonImage, *redButtonImage;
@property (nonatomic) BOOL canBeAnimated, animationFinished;

- (IBAction)longPress:(UIButton *)sender;
- (IBAction)cancelLongPress:(UIButton *)sender;

@end
