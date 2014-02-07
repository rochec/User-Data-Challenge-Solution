//
//  CCViewController.m
//  User Data Challenge Solution
//
//  Created by Eliot Arntz on 10/19/13.
//  Copyright (c) 2013 Code Coalition. All rights reserved.
//

#import "CCViewController.h"
#import "CCUserData.h"

@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /* The class method users defined in the CCUserData class returns an NSArray. We set the property users equal to the return value. */
    self.users = [CCUserData users];
    /* Print out the users array to the console */
    NSLog(@"%@", self.users);
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Data Source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"userCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *user = self.users[indexPath.row];
    
    cell.textLabel.text = user[USER_NAME];
    cell.detailTextLabel.text = user[USER_EMAIL];
    cell.imageView.image = user[USER_PROFILE_PICTURE];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.users count];
}


#pragma mark - UITableView Delegate


@end
