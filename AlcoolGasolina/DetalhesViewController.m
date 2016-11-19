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
        
        NSString *vlGas = [item objectForKey:@"gasolina"];
        NSString *vlAl = [item objectForKey:@"alcool"];
        
        NSString *pattern = @"([0-9]+)(\\.)([0-9]+)";
        NSError *error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
        NSString *replacedGas = [regex stringByReplacingMatchesInString:vlGas
                                                             options:0
                                                               range:NSMakeRange(0, [vlGas length])
                                                        withTemplate:[NSString stringWithFormat:@"R$ %@",  @"$1,$3"]];
        NSString *replacedAl = [regex stringByReplacingMatchesInString:vlAl
                                                                options:0
                                                                  range:NSMakeRange(0, [vlAl length])
                                                           withTemplate:[NSString stringWithFormat:@"R$ %@",  @"$1,$3"]];
        lblAlcool.text = replacedAl;
        lbGasolina.text = replacedGas;
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
