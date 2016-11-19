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

@end
