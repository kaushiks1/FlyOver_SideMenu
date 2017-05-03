//
//  ViewController.h
//  FlyOver_SideMenu
//
//  Created by SILICON on 15/09/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlyOverSideMenuView.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface ViewController : UIViewController<BTSimpleSideMenuDelegate>

@property(nonatomic)FlyOverSideMenuView *sideMenu;

- (IBAction)buttonActionShowSliderMain:(id)sender;
- (IBAction)buttonActionBackMain:(id)sender;

@end

