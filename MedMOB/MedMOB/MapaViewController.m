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

@synthesize mapa;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil idHospital:(NSInteger *)idHosp
{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       hosp = [[[SharedHospitais sharedHospitais]searchItems]objectAtIndex:idHosp];
        // Custom initialization
        [mapa setDelegate:self];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _lblNomeHospital.text = [hosp nome];
    _lblEndereco.text = [hosp endereco];
    _lblTelefone.text = [hosp telefone];
    
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = hosp.latitude;
    zoomLocation.longitude= hosp.longitude;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*1000, 0.5*1000);
    MKPointAnnotation *annotationPoint2 = [[MKPointAnnotation alloc] init];
    annotationPoint2.coordinate = zoomLocation;
    annotationPoint2.title = [hosp nome];
    annotationPoint2.subtitle = [hosp endereco];
    [mapa addAnnotation:annotationPoint2];
    [mapa setRegion:viewRegion animated:YES];
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

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
}

- (double)CalcularDistancia:(double)latOrigem : (double)longOrigem : (double)latDestino : (double)longDestino
{
    return 6371 * acos(cos(M_PI * (90 - latOrigem )/180) * cos((90 - latDestino) * M_PI / 180) + sin((90- latOrigem) * M_PI / 180) * sin((90 - latDestino) * M_PI / 180) * cos((longDestino - longOrigem) * M_PI / 180)) * 1000;
}

@end
