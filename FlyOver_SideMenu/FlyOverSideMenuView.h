//
//  BTSimpleSideMenu.h
//  BTSimpleSideMenuDemo
//
//  Created by Balram on 29/05/14.
//  Copyright (c) 2014 Balram Tiwari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlyOverSideMenuItem.h"
#import "Constant.h"

#define MAIN_VIEW_TAG 1
#define TITLE_LABLE_TAG 2
#define IMAGE_VIEW_TAG 3

@class FlyOverSideMenuView;
@protocol BTSimpleSideMenuDelegate <NSObject>

-(void)BTSimpleSideMenu:(FlyOverSideMenuView *)menu didSelectItemAtIndex:(NSInteger)index;
-(void)BTSimpleSideMenu:(FlyOverSideMenuView *)menu selectedItemTitle:(NSString *)title;

@end

@interface FlyOverSideMenuView : UIView<UITableViewDelegate, UITableViewDataSource>
{
    @private
    UITableView *menuTable;
    NSArray *titleArray;
    NSArray *imageArray;
    NSArray *itemsArray;
    BOOL isOpen;
    UITapGestureRecognizer *gesture;
    UISwipeGestureRecognizer *leftSwipe, *rightSwipe;
    
}

@property (nonatomic, retain) FlyOverSideMenuItem *selectedItem;
@property(nonatomic, weak) id <BTSimpleSideMenuDelegate> delegate;

-(instancetype) initWithItem:(NSArray *)items addToViewController:(id)sender;
//-(instancetype) initWithItemTitles:(NSArray *)itemsTitle addToViewController:(id)sender;
//-(instancetype) initWithItemTitles:(NSArray *)itemsTitle andItemImages:(NSArray *)itemsImage addToViewController:(UIViewController *)sender;

-(void)show;
-(void)hide;
-(void)toggleMenu;

@end
