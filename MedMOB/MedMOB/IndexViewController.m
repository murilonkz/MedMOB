//
//  IndexViewController.m
//  MedMOB
//
//  Created by Thiago Oliveira on 11/20/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import "IndexViewController.h"
#import "MapaViewController.h"
#import "HospitaisViewController.h"
#import "SharedHospitais.h"

@interface IndexViewController ()
@property NSArray *options;
@end

@implementation IndexViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setTitle:@"Busca"];
        self.options = @[@"Geral", @"Olhos", @"Emergencia"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1; // For one column
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [[self options] count]; // Numbers of rows
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[self options] objectAtIndex:row]; // If it's a string
}

- (IBAction)emergencia:(id)sender {
    MapaViewController *mapa = [[MapaViewController alloc]init];
    [mapa setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self.navigationController pushViewController:mapa animated: YES];
    
}

- (IBAction)buscar:(id)sender {
    
    NSInteger row = [_opcao selectedRowInComponent:0];
    NSString *selectOption = [self.options objectAtIndex:row];
    NSLog(@"%@", selectOption);
    
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF.especialidades contains[cd] %@",
                                    selectOption];
    [[SharedHospitais sharedHospitais]setSearchItems: [[[SharedHospitais sharedHospitais]allItems] filteredArrayUsingPredicate:resultPredicate]];
    
    
    HospitaisViewController *hvc = [[HospitaisViewController alloc]init];
    [self.navigationController pushViewController:hvc animated:YES];
    
    
}

@end
