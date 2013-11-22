//
//  ViewController.h
//  MedMOB
//
//  Created by Marcelo Bruzetti on 20/11/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapaViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (strong, nonatomic) IBOutlet MKMapView *mapa;
@property (weak, nonatomic) IBOutlet UILabel *lblNomeHospital;
@property (weak, nonatomic) IBOutlet UILabel *lblEndereco;
@property (weak, nonatomic) IBOutlet UILabel *lblTelefone;
@property (weak, nonatomic) IBOutlet UILabel *lblHorarioAtend;

@property NSArray* routes;

- (IBAction)getCurrentLocation:(id)sender;

- (double)CalcularDistancia:(double)latOrigem : (double)longOrigem : (double)latDestino : (double)longDestino;

@end
