//
//  SecondViewController.h
//  FlyOver_SideMenu
//
//  Created by SILICON on 15/09/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlyOverSideMenuView.h"
#import "ViewController.h"
#import "FirstViewController.h"

@interface SecondViewController : UIViewController<BTSimpleSideMenuDelegate>

@property(nonatomic)FlyOverSideMenuView *sideMenu;

- (IBAction)buttonActionShowSliderSecond:(id)sender;
- (IBAction)buttonActionBackSecond:(id)sender;


@end
