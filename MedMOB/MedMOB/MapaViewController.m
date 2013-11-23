//
//  ViewController.m
//  MedMOB
//
//  Created by Marcelo Bruzetti on 20/11/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import "MapaViewController.h"
#import "SharedHospitais.h"
#import "Hospital.h"
@interface MapaViewController ()

@end

@implementation MapaViewController {
    CLLocationManager *locationManager;
    Hospital *hosp;
}

@synthesize mapa, routes;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil idHospital:(NSInteger *)idHosp
{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       hosp = [[[SharedHospitais sharedHospitais]searchItems]objectAtIndex:idHosp];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _lblNomeHospital.text = [hosp nome];
    _lblEndereco.text = [hosp endereco];
    _lblTelefone.text = [hosp telefone];
    
    // Do any additional setup after loading the view from its nib.
    locationManager = [[CLLocationManager alloc] init];
    
    mapa.showsUserLocation = YES;
    mapa.mapType = MKMapTypeHybrid;
    mapa.delegate = self;
    //[self.view addSubview:mapa];
    [self PegarPosicaoAtual];
}

-(NSMutableArray*)PegarPosicaoAtual
{
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    if ([locationManager locationServicesEnabled])
    {
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.distanceFilter = kCLDistanceFilterNone;
        [locationManager startUpdatingLocation];
        NSLog(@"HABILITADO");
    }
    
    CLLocation *location = [locationManager location];
    CLLocationCoordinate2D coordinate = [location coordinate];
    
    NSString *str=[[NSString alloc] initWithFormat:@" latitude:%f longitude:%f",coordinate.latitude,coordinate.longitude];
    NSLog(@"%@",str);
    
    NSMutableArray *coords = [[NSMutableArray alloc] initWithCapacity:0];
    [coords addObject:[NSNumber numberWithDouble:coordinate.latitude]];
    [coords addObject:[NSNumber numberWithDouble:coordinate.longitude]];
    
    return coords;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getCurrentLocation:(id)sender {
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);

}

- (double)CalcularDistancia:(double)latOrigem : (double)longOrigem : (double)latDestino : (double)longDestino
{
    return 6371 * acos(cos(M_PI * (90 - latOrigem )/180) * cos((90 - latDestino) * M_PI / 180) + sin((90- latOrigem) * M_PI / 180) * sin((90 - latDestino) * M_PI / 180) * cos((longDestino - longOrigem) * M_PI / 180)) * 1000;
}

@end
