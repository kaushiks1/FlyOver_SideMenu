//
//  BTSimpleSideMenu.m
//  BTSimpleSideMenuDemo
//  Created by Balram on 29/05/14.
//  Copyright (c) 2014 Balram Tiwari. All rights reserved.
//

#import "FlyOverSideMenuView.h"

@implementation FlyOverSideMenuView

-(instancetype) initWithItem:(NSArray *)items addToViewController:(id)sender {
    if ((self = [super init])) {
        // perform the other initialization of items.
        [self commonInit:sender];
        itemsArray = items;
    }
    return self;
}

-(instancetype)initWithItemTitles:(NSArray *)itemsTitle addToViewController:(UIViewController *)sender {
    
    if ((self = [super init])) {
        // perform the other initialization of items.
        [self commonInit:sender];
        NSMutableArray *tempArray = [[NSMutableArray alloc]init];
        for(int i = 0;i<[itemsTitle count]; i++){
            FlyOverSideMenuItem *temp = [[FlyOverSideMenuItem alloc]initWithTitle:[itemsTitle objectAtIndex:i]
                                                                      image:nil onCompletion:nil];
            [tempArray addObject:temp];
        }
        itemsArray = tempArray;
    }
    return self;
}

-(instancetype)initWithItemTitles:(NSArray *)itemsTitle andItemImages:(NSArray *)itemsImage addToViewController:(UIViewController *)sender{
    if ((self = [super init])) {
        // perform the other initialization of items.
        [self commonInit:sender];
        NSMutableArray *tempArray = [[NSMutableArray alloc]init];
        for(int i = 0;i<[itemsTitle count]; i++){
            FlyOverSideMenuItem *temp = [[FlyOverSideMenuItem alloc]initWithTitle:[itemsTitle objectAtIndex:i]
                                                                      image:[itemsImage objectAtIndex:i]
                                                               onCompletion:nil];
            [tempArray addObject:temp];
        }
        itemsArray = tempArray;
    }
    return self;
}

-(void)commonInit:(UIViewController *)sender
{
    self.frame = CGRectMake(WD, 0, WD, HT);
    self.backgroundColor = [UIColor clearColor];
    if(!sender.navigationController.navigationBarHidden)
    {
        menuTable = [[UITableView alloc]initWithFrame:CGRectMake(WD/4.32, 15, WD/1.3, HT) style:UITableViewStyleGrouped];
    }
    else
    {
        menuTable = [[UITableView alloc]initWithFrame:CGRectMake(WD/4.32, -15, WD/1.3, HT) style:UITableViewStyleGrouped];
    }
    
    [menuTable setBackgroundColor:[UIColor clearColor]];
    [menuTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    menuTable.scrollEnabled = NO;
    menuTable.delegate = self;
    menuTable.dataSource = self;
    menuTable.alpha = 0;
    isOpen = NO;
    [self addSubview:menuTable];
    
    gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toggleMenu)];
    gesture.numberOfTapsRequired = 2;
    
    leftSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(show)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    rightSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(hide)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    [sender.view addSubview:self];
    [sender.view addGestureRecognizer:gesture];
    [sender.view addGestureRecognizer:rightSwipe];
    [sender.view addGestureRecognizer:leftSwipe];
}


-(void)toggleMenu{
    if(!isOpen){
        [self show];
    }else {
        [self hide];
    }
}

-(void)show{
    if(!isOpen){
        [UIView animateWithDuration:0.5 animations:^{
            self.frame = CGRectMake(0, 0, WD, HT);
            menuTable.frame = CGRectMake(menuTable.frame.origin.x, menuTable.frame.origin.y+15, WD/1.3, HT);
            menuTable.alpha = 1;
        } completion:^(BOOL finished) {
            
        }];
        isOpen = YES;
    }
}

-(void)hide {
    if(isOpen){
        [UIView animateWithDuration:0.5 animations:^{
            self.frame = CGRectMake(WD, 0, WD, HT);
            menuTable.frame = CGRectMake(menuTable.frame.origin.x, menuTable.frame.origin.y-15, WD/1.3, HT);
            menuTable.alpha = 0;
        }];
        isOpen = NO;
    }
}

#pragma -mark tableView Delegates
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [itemsArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UILabel *titleLabel;
    UIImageView *imageView;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    FlyOverSideMenuItem *item = [itemsArray objectAtIndex:indexPath.row];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.backgroundColor = [UIColor whiteColor];
        
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(WD/16, HT/56.8, WD/16, HT/28.4)];
        imageView.tag = IMAGE_VIEW_TAG;
        [cell.contentView addSubview:imageView];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(WD/4.5, HT/47.3, WD/1.70, HT/37.8)];
        titleLabel.tag = TITLE_LABLE_TAG;
        titleLabel.textColor = [UIColor colorWithWhite:0.2 alpha:1];
        titleLabel.minimumFontSize = 9;
        [cell.contentView addSubview:titleLabel];
    }
    else
    {
        
        titleLabel = (UILabel *)[cell.contentView viewWithTag:TITLE_LABLE_TAG];
        imageView = (UIImageView *)[cell.contentView viewWithTag:IMAGE_VIEW_TAG];
    }
    
    titleLabel.text = item.title;
    imageView.image = item.imageView.image;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HT/14.2;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(BTSimpleSideMenu:didSelectItemAtIndex:)])
    {
        [self.delegate BTSimpleSideMenu:self didSelectItemAtIndex:indexPath.row];
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(BTSimpleSideMenu:selectedItemTitle:)])
    {
        [self.delegate BTSimpleSideMenu:self selectedItemTitle:[[itemsArray objectAtIndex:indexPath.row] title]];
    }
    
    _selectedItem = [itemsArray objectAtIndex:indexPath.row];
    [self hide];
    if (_selectedItem.block) {
        BOOL success= YES;
        _selectedItem.block(success, _selectedItem);
    }
    [menuTable deselectRowAtIndexPath:indexPath animated:YES];
}



@end






