//
//  ViewController.m
//  AlcoolGasolina
//
//  Created by Faculdade Alfa on 05/11/16.
//  Copyright (c) 2016 Faculdade Alfa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize valorAlcool, valorGasolina;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)calcular:(id)sender {
    float alcool =  valorAlcool.text.floatValue;
    float gasolina = [valorGasolina.text floatValue];
    if (alcool<(gasolina * 0.7)) {
         [self mostrarMensagem:@"Pós Alfa" msg:@"Álcool é melhor"];
    } else if (alcool>(gasolina * 0.7)) {
        [self mostrarMensagem:@"Pós Alfa" msg:@"Gasolina é melhor"];
    } else {
        [self mostrarMensagem:@"Pós Alfa" msg:@"Tanto faz"];
    }
}
-(void)mostrarMensagem:(NSString *)titulo msg:(NSString *)mensagem {
    UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:titulo message:mensagem delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    
}
@end
