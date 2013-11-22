//
//  HospitaisViewController.m
//  MedMOB
//
//  Created by Thiago Oliveira on 11/21/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import "HospitaisViewController.h"
#import "HospitalCell.h"
#import "MapaViewController.h"
#import "SharedHospitais.h"
#import "Hospital.h"

@interface HospitaisViewController ()

@end

@implementation HospitaisViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        [self setTitle:@"Resultados"];
        // Custom initialization
//        [self.tableView setTableHeaderView:[self headerView]];
//        UINib *nib = [UINib nibWithNibName:@"HospitalCell" bundle:nil];
//        [self.tableView registerNib:nib forCellReuseIdentifier:@"HospitalCell"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[SharedHospitais sharedHospitais] searchItems]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"HospitalCell";
    HospitalCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HospitalCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    // Configure the cell...
    Hospital *item = [[[SharedHospitais sharedHospitais]searchItems]objectAtIndex:[indexPath row]];
    [[cell lblNome]setText:[item nome]];
    [[cell lblDistancia]setText:@"100"];
    
    //[[cell imageView]setImage: [item img]];

    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MapaViewController *mapaViewController = [[MapaViewController alloc] initWithNibName:@"MapaViewController" bundle:nil];
    [self.navigationController pushViewController:mapaViewController animated:YES];
//    [self presentViewController:mapaViewController animated:YES completion:nil];
}


- (void)ExibirMapaController
{
    MapaViewController *mvc = [[MapaViewController alloc]initWithNibName:@"MapaViewController" bundle:nil];
    [self presentViewController:mvc animated:YES completion:nil];
    NSLog(@"lolzinho");
}
@end
