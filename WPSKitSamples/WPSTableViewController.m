//
//  RootViewController.m
//  WPSKitSamples
//
//  Created by Kirby Turner on 2/16/12.
//  Copyright (c) 2012 White Peak Software Inc. All rights reserved.
//

#import "WPSTableViewController.h"

@implementation WPSTableViewController

- (instancetype)init
{
   self = [super initWithStyle:UITableViewStyleGrouped];
   if (self)
   {
      [self setTitle:@"Samples"];
   }
   return self;
}

- (NSDictionary *)itemAtIndexPath:(NSIndexPath *)indexPath
{
   NSDictionary *dict = [[self data] objectAtIndex:[indexPath section]];
   NSArray *items = [dict objectForKey:WPSFeatureKeyItems];
   NSDictionary *item = [items objectAtIndex:[indexPath row]];
   return item;
}

#pragma mark - UITableViewDelegate and UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   NSInteger count = [[self data] count];
   return count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   NSDictionary *dict = [[self data] objectAtIndex:section];
   NSArray *items = [dict objectForKey:WPSFeatureKeyItems];
   NSInteger count = [items count];
   return count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
   NSDictionary *dict = [[self data] objectAtIndex:section];
   NSString *title = [dict objectForKey:WPSFeatureKeyTitle];
   return title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *cellID = @"cellID";
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
   if (!cell) {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
      [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
   }
   
   NSDictionary *item = [self itemAtIndexPath:indexPath];
   NSString *title = [item objectForKey:WPSFeatureKeyTitle];
   [[cell textLabel] setText:title];
   
   return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSDictionary *item = [self itemAtIndexPath:indexPath];
   NSString *title = [item objectForKey:WPSFeatureKeyTitle];
   NSArray *items = [item objectForKey:WPSFeatureKeyItems];
   NSString *viewControllerClassName = [item objectForKey:WPSFeatureKeyViewControllerClassName];
   
   id viewController = [[NSClassFromString(viewControllerClassName) alloc] init];
   [viewController setTitle:title];
   if ([viewController respondsToSelector:@selector(setData:)]) {
      [viewController setData:items];
   }
   
   [[self navigationController] pushViewController:viewController animated:YES];
   
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
