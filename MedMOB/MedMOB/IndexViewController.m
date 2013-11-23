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
#import "Hospital.h"

@interface IndexViewController ()
@property NSArray *options;
@end

@implementation IndexViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setTitle: @"Busca"];
        self.options = @[@"Clínica Geral",
                         @"Dermatologia",
                         @"Emergencia",
                         @"Endocrinologia",
                         @"Oftalmologia",
                         @"Pediatria",
                         @"Cardiologia",
                         @"Geriatria",
                         @"Ginecologia",
                         @"Neurologia",
                         @"Oftalmologia",
                         @"Oncologia",
                         @"Ortopedia",
                         @"Otorrinolaringologia",
                         @"Pediatria",
                         @"Pneumonologia",
                         @"Reumatologia",
                         @"Saúde Mental",
                         @"Urologia"];


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
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF.especialidades contains[cd] %@",
                                    @"Emergencia"];
    [[SharedHospitais sharedHospitais]setSearchItems: [[[SharedHospitais sharedHospitais]allItems] filteredArrayUsingPredicate:resultPredicate]];
    [[SharedHospitais sharedHospitais]calculateAllDistancy];
    NSSortDescriptor *sd = [[NSSortDescriptor alloc] initWithKey:@"distancy" ascending:YES];
    [[SharedHospitais sharedHospitais]setSearchItems: [[[SharedHospitais sharedHospitais]searchItems] sortedArrayUsingDescriptors:@[sd]]];
    
    MapaViewController *mapaViewController = [[MapaViewController alloc] initWithNibName:@"MapaViewController" bundle:nil idHospital:0];
    [self.navigationController pushViewController:mapaViewController animated: YES];
    
}

- (IBAction)buscar:(id)sender {
    
    NSInteger row = [_opcao selectedRowInComponent:0];
    NSString *selectOption = [self.options objectAtIndex:row];
    
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF.especialidades contains[cd] %@",
                                    selectOption];
    [[SharedHospitais sharedHospitais]setSearchItems: [[[SharedHospitais sharedHospitais]allItems] filteredArrayUsingPredicate:resultPredicate]];
    [[SharedHospitais sharedHospitais]calculateAllDistancy];
    NSSortDescriptor *sd = [[NSSortDescriptor alloc] initWithKey:@"distancy" ascending:YES];
    [[SharedHospitais sharedHospitais]setSearchItems: [[[SharedHospitais sharedHospitais]searchItems] sortedArrayUsingDescriptors:@[sd]]];
    
    HospitaisViewController *hvc = [[HospitaisViewController alloc]initWithNibName:@"HospitaisViewController" bundle:nil];
    [self.navigationController pushViewController:hvc animated: YES];
    
}


@end
