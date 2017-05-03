//
//  ViewController.m
//  FlyOver_SideMenu
//
//  Created by SILICON on 15/09/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    sideMenu = [[BTSimpleSideMenu alloc]initWithItemTitles:@[@"One", @"Two", @"Three", @"Four",@"Five", @"Six", @"Seven"]
    //                                             andItemImages:@[
    //                                                             [UIImage imageNamed:@"icon1.jpeg"],
    //                                                             [UIImage imageNamed:@"icon2.jpeg"],
    //                                                             [UIImage imageNamed:@"icon3.jpeg"],
    //                                                             [UIImage imageNamed:@"icon4.jpeg"],
    //                                                             [UIImage imageNamed:@"icon5.jpeg"]
    //                                                             ]
    //                                       addToViewController:self];
    
    
    FlyOverSideMenuItem *item1 = [[FlyOverSideMenuItem alloc]initWithTitle:@"One"
                                                               image:[UIImage imageNamed:@"icon1.png"]
                                                        onCompletion:^(BOOL success, FlyOverSideMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 1");
                                                        }];
    
    FlyOverSideMenuItem *item2 = [[FlyOverSideMenuItem alloc]initWithTitle:@"Two"
                                                               image:[UIImage imageNamed:@"icon2.png"]
                                                        onCompletion:^(BOOL success, FlyOverSideMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 2");
                                                        }];
    
    FlyOverSideMenuItem *item3 = [[FlyOverSideMenuItem alloc]initWithTitle:@"Three"
                                                               image:[UIImage imageNamed:@"icon3.png"]
                                                        onCompletion:^(BOOL success, FlyOverSideMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 3");
                                                        }];
    
    FlyOverSideMenuItem *item4 = [[FlyOverSideMenuItem alloc]initWithTitle:@"Four"
                                                               image:[UIImage imageNamed:@"icon4.png"]
                                                        onCompletion:^(BOOL success, FlyOverSideMenuItem *item) {
                                                            NSLog(@"I am Item 4");
                                                        }];
    
    FlyOverSideMenuItem *item5 = [[FlyOverSideMenuItem alloc]initWithTitle:@"Five"
                                                               image:[UIImage imageNamed:@"icon5.png"]
                                                        onCompletion:^(BOOL success, FlyOverSideMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 5");
                                                        }];

    
    _sideMenu = [[FlyOverSideMenuView alloc]initWithItem:@[item1, item2, item3, item4, item5] addToViewController:self];
    _sideMenu.delegate = self;

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonActionShowSliderMain:(id)sender
{
    [_sideMenu toggleMenu];
}

- (IBAction)buttonActionBackMain:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma -mark BTSimpleSideMenuDelegate
-(void)BTSimpleSideMenu:(FlyOverSideMenuView *)menu didSelectItemAtIndex:(NSInteger)index
{
     NSLog(@"Item Cliecked : %ld", (long)index);
    
    if (index == 0)
    {
//        ViewController *viewControllerObject = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
//        [self.navigationController pushViewController:viewControllerObject animated:YES];
        
    }
    else if (index == 1)
    {
        FirstViewController *viewControllerObject = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"FirstViewController"];
        [self.navigationController pushViewController:viewControllerObject animated:YES];
        
    }
    else if (index == 2)
    {
        SecondViewController *viewControllerObject = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SecondViewController"];
        [self.navigationController pushViewController:viewControllerObject animated:YES];
    }
   
}

-(void)BTSimpleSideMenu:(FlyOverSideMenuView *)menu selectedItemTitle:(NSString *)title
{
    NSLog(@"Item Cliecked : %@", title);
}

@end
