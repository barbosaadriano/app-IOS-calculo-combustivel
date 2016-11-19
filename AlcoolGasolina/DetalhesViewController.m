//
//  DetalhesViewController.m
//  AlcoolGasolina
//
//  Created by Faculdade Alfa on 19/11/16.
//  Copyright (c) 2016 Faculdade Alfa. All rights reserved.
//

#import "DetalhesViewController.h"

@interface DetalhesViewController ()

@end

@implementation DetalhesViewController
@synthesize item, lblAlcool, lbGasolina;
- (void)viewDidLoad {
    [super viewDidLoad];
    if (item) {
        lbGasolina.text = [item objectForKey:@"gasolina"];
        lblAlcool.text = [item objectForKey:@"alcool"];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)voltar:(id)sender{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

@end
