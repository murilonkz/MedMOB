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
@property (strong, nonatomic) IBOutlet MKMapView *mapa;
@property (weak, nonatomic) IBOutlet UILabel *lblNomeHospital;
@property (weak, nonatomic) IBOutlet UILabel *lblEndereco;
@property (weak, nonatomic) IBOutlet UILabel *lblTelefone;
@property NSArray* routes;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil idHospital:(NSInteger *)idHosp;
- (double)CalcularDistancia:(double)latOrigem : (double)longOrigem : (double)latDestino : (double)longDestino;
-(NSMutableArray*)PegarPosicaoAtual;

@end
