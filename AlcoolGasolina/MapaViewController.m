//
//  MapaViewController.m
//  AlcoolGasolina
//
//  Created by Faculdade Alfa on 19/11/16.
//  Copyright (c) 2016 Faculdade Alfa. All rights reserved.
//

#import "MapaViewController.h"

@interface MapaViewController ()

@end

@implementation MapaViewController
@synthesize mapa, locaManager;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)voltar:(id)sender{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}
-(void) limparPinos {
    [mapa removeAnnotations:mapa.annotations];
}
-(IBAction)av:(id)sender {
    [self limparPinos];
    MKPointAnnotation *pino = [[MKPointAnnotation alloc] init];
    pino.coordinate = CLLocationCoordinate2DMake(-24.164408, -54.096780);
    pino.title = @"AVANTAGEM - Adriano Barbosa";
    [mapa addAnnotation:pino];
    MKCoordinateSpan zoom = MKCoordinateSpanMake(0.01, 0.01);
    MKCoordinateRegion region = MKCoordinateRegionMake(pino.coordinate, zoom);
    [mapa setRegion:region animated:YES];
}
-(IBAction)mudarTipo:(id)sender
{
    switch (mapa.mapType) {
        case MKMapTypeStandard:
            [mapa setMapType:MKMapTypeSatellite];
            break;
        case MKMapTypeSatellite:
            [mapa setMapType:MKMapTypeHybrid];
            break;
        default:
            [mapa setMapType:MKMapTypeStandard];
            break;
    }
}
-(IBAction)ondeEstou:(id)sender {
    [self limparPinos];
    if ([CLLocationManager locationServicesEnabled]){
        if (!locaManager) {
            locaManager = [[CLLocationManager alloc] init];
            locaManager.delegate = self;
        }
        [locaManager startUpdatingLocation];
    }
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *myLocation = [locations lastObject];
    MKPointAnnotation *pino = [[MKPointAnnotation alloc] init];
    pino.coordinate = myLocation.coordinate;
    pino.title = @"Estou aqui!!";
    pino.subtitle = [NSString stringWithFormat:@"Lat: %f, Long: %f, Alt: %f", myLocation.coordinate.latitude,myLocation.coordinate.longitude,myLocation.altitude];
    [mapa addAnnotation:pino];
    MKCoordinateSpan zoom = MKCoordinateSpanMake(0.01, 0.01);
    MKCoordinateRegion region = MKCoordinateRegionMake(pino.coordinate, zoom);
    [mapa setRegion:region animated:YES];
    [locaManager stopUpdatingLocation];
}
@end
