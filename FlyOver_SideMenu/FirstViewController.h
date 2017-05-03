//
//  FirstViewController.h
//  FlyOver_SideMenu
//
//  Created by SILICON on 15/09/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlyOverSideMenuView.h"
#import "ViewController.h"
#import "SecondViewController.h"

@interface FirstViewController : UIViewController<BTSimpleSideMenuDelegate>

@property(nonatomic)FlyOverSideMenuView *sideMenu;


- (IBAction)buttonActionShowSliderFirst:(id)sender;
- (IBAction)buttonActionBackFirst:(id)sender;

@end
