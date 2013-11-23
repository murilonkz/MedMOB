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
-(void) updateRouteView;
@end

@implementation MapaViewController {
    CLLocationManager *locationManager;
    Hospital *hosp;
}

@synthesize latitudeLabel, longitudeLabel, mapa, routes, lineColor;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil idHospital:(NSInteger *)idHosp
{
    hosp = [[[SharedHospitais sharedHospitais]searchItems]objectAtIndex:idHosp];
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [mapa setDelegate:self];
        routeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, mapa.frame.size.width, mapa.frame.size.height)];
		routeView.userInteractionEnabled = NO;
		[mapa addSubview:routeView];

        
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
    //mapa = [[MKMapView alloc]initWithFrame:self.view.bounds];
    mapa.showsUserLocation = YES;
    mapa.mapType = MKMapTypeHybrid;
    mapa.delegate = self;
    //[self.view addSubview:mapa];
    [self PegarPosicaoAtual];
    
    routes = [self CalcularRota];
    [self updateRouteView];
    [self centerMap];
}

-(void) updateRouteView {
	
	if (routes.count==0) {
		UIAlertView *av=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Path is not possible for these locations" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[av show];
		routeView.image=nil;
		return;
	}
	
    CGBitmapInfo bitmapInfo = (CGBitmapInfo) kCGImageAlphaPremultipliedLast;
	CGContextRef context = 	CGBitmapContextCreate(nil,
												  routeView.frame.size.width,
												  routeView.frame.size.height,
												  8,
												  4 * routeView.frame.size.width,
												  CGColorSpaceCreateDeviceRGB(),
												  bitmapInfo);
	
	CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
	CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
	CGContextSetLineWidth(context, 3.0);
	
	for(int i = 0; i < routes.count; i++) {
		CLLocation* location = [routes objectAtIndex:i];
		CGPoint point = [mapa convertCoordinate:location.coordinate toPointToView:routeView];
		
		if(i == 0) {
			CGContextMoveToPoint(context, point.x, routeView.frame.size.height - point.y);
		} else {
			CGContextAddLineToPoint(context, point.x, routeView.frame.size.height - point.y);
		}
	}
	
	CGContextStrokePath(context);
	
	CGImageRef image = CGBitmapContextCreateImage(context);
	UIImage* img = [UIImage imageWithCGImage:image];
	
	routeView.image = img;
	CGContextRelease(context);
    
}

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
	routeView.hidden = YES;
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
	[self updateRouteView];
	routeView.hidden = NO;
	[routeView setNeedsDisplay];
}


-(void) centerMap {
	if(routes.count==0) return;
	MKCoordinateRegion region;
    
	CLLocationDegrees maxLat = -90;
	CLLocationDegrees maxLon = -180;
	CLLocationDegrees minLat = 90;
	CLLocationDegrees minLon = 180;
	for(int idx = 0; idx < routes.count; idx++)
	{
		CLLocation* currentLocation = [routes objectAtIndex:idx];
		if(currentLocation.coordinate.latitude > maxLat)
			maxLat = currentLocation.coordinate.latitude;
		if(currentLocation.coordinate.latitude < minLat)
			minLat = currentLocation.coordinate.latitude;
		if(currentLocation.coordinate.longitude > maxLon)
			maxLon = currentLocation.coordinate.longitude;
		if(currentLocation.coordinate.longitude < minLon)
			minLon = currentLocation.coordinate.longitude;
	}
	region.center.latitude     = (maxLat + minLat) / 2;
	region.center.longitude    = (maxLon + minLon) / 2;
	region.span.latitudeDelta  = maxLat - minLat;
	region.span.longitudeDelta = maxLon - minLon;
	
	[mapa setRegion:region animated:YES];
}

-(NSMutableArray*)PegarPosicaoAtual
{
    //CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    //if ([locationManager locationServicesEnabled])
    //{
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.distanceFilter = kCLDistanceFilterNone;
        [locationManager startUpdatingLocation];
        NSLog(@"HABILITADO");
    //}
    
    CLLocation *location = [locationManager location];
    CLLocationCoordinate2D coordinate = [location coordinate];
    
    NSString *str=[[NSString alloc] initWithFormat:@" latitude:%f longitude:%f",coordinate.latitude,coordinate.longitude];
    NSLog(@"%@",str);
    
    NSMutableArray *coords = [[NSMutableArray alloc] initWithCapacity:0];
    [coords addObject:[NSNumber numberWithDouble:coordinate.latitude]];
    [coords addObject:[NSNumber numberWithDouble:coordinate.longitude]];
    
    return coords;
}

//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

//- (IBAction)getCurrentLocation:(id)sender {
//    locationManager.delegate = self;
//    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
//    
//    [locationManager startUpdatingLocation];
//}

#pragma mark - CLLocationManagerDelegate

//- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
//{
//    NSLog(@"didFailWithError: %@", error);
//    UIAlertView *errorAlert = [[UIAlertView alloc]
//                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    [errorAlert show];
//}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
//    if (currentLocation != nil)
//    {
//        longitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
//        latitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
//        
//        CLLocationCoordinate2D origem = CLLocationCoordinate2DMake(23.329404, 72.0039299);
//        CLLocationCoordinate2D destino = CLLocationCoordinate2DMake(23.329404, 72.0039299);
//    }
}

- (double)CalcularDistancia:(double)latOrigem : (double)longOrigem : (double)latDestino : (double)longDestino
{
    return 6371 * acos(cos(M_PI * (90 - latOrigem )/180) * cos((90 - latDestino) * M_PI / 180) + sin((90- latOrigem) * M_PI / 180) * sin((90 - latDestino) * M_PI / 180) * cos((longDestino - longOrigem) * M_PI / 180)) * 1000;
}

- (NSArray*) CalcularRota
{
    NSString* saddr = [NSString stringWithFormat:@"%f,%f", -25.428356300000000000, -49.273251500000015000];
	NSString* daddr = [NSString stringWithFormat:@"%f,%f", -3.718394300000000000, -38.543394799999990000];
	
	NSString* apiUrlStr = [NSString stringWithFormat:@"http://maps.google.com/maps?output=dragdir&saddr=%@&daddr=%@", saddr, daddr];
	NSURL* apiUrl = [NSURL URLWithString:apiUrlStr];
	//NSLog(@"api url: %@", apiUrl);
	NSString *apiResponse = [NSString stringWithContentsOfURL:apiUrl];
	//NSString* encodedPoints = [apiResponse stringByMatching:@"points:\\\"([^\\\"]*)\\\"" capture:1L];
    
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"points:\\\"([^\\\"]*)\\\"" options:0 error:NULL];
    NSTextCheckingResult *match = [regex firstMatchInString:apiResponse options:0 range:NSMakeRange(0, [apiResponse length])];
    NSString *encodedPoints = [apiResponse substringWithRange:[match rangeAtIndex:1]];
    
    
    return [self decodePolyLine:[encodedPoints mutableCopy]];
}

-(NSMutableArray *)decodePolyLine: (NSMutableString *)encoded {
	[encoded replaceOccurrencesOfString:@"\\\\" withString:@"\\"
								options:NSLiteralSearch
								  range:NSMakeRange(0, [encoded length])];
	NSInteger len = [encoded length];
	NSInteger index = 0;
	NSMutableArray *array = [[NSMutableArray alloc] init];// autorelease];
	NSInteger lat=0;
	NSInteger lng=0;
	while (index < len) {
		NSInteger b;
		NSInteger shift = 0;
		NSInteger result = 0;
		do {
			b = [encoded characterAtIndex:index++] - 63;
			result |= (b & 0x1f) << shift;
			shift += 5;
		} while (b >= 0x20);
		NSInteger dlat = ((result & 1) ? ~(result >> 1) : (result >> 1));
		lat += dlat;
		shift = 0;
		result = 0;
		do {
			b = [encoded characterAtIndex:index++] - 63;
			result |= (b & 0x1f) << shift;
			shift += 5;
		} while (b >= 0x20);
		NSInteger dlng = ((result & 1) ? ~(result >> 1) : (result >> 1));
		lng += dlng;
		NSNumber *latitude = [[NSNumber alloc] initWithFloat:lat * 1e-5];// autorelease];
		NSNumber *longitude = [[NSNumber alloc] initWithFloat:lng * 1e-5];// autorelease];
		//printf("[%f,", [latitude doubleValue]);
		//printf("%f]", [longitude doubleValue]);
		CLLocation *loc = [[CLLocation alloc] initWithLatitude:[latitude floatValue] longitude:[longitude floatValue]];// autorelease];
		[array addObject:loc];
	}
	
	return array;
}

@end
