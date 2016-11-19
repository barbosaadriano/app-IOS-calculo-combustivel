//
//  HistoricoViewController.m
//  AlcoolGasolina
//
//  Created by Faculdade Alfa on 05/11/16.
//  Copyright (c) 2016 Faculdade Alfa. All rights reserved.
//

#import "HistoricoViewController.h"

@interface HistoricoViewController ()

@end

@implementation HistoricoViewController
@synthesize dados,tabela;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *filePath = [NSHomeDirectory() stringByAppendingString:@"/Documents/dados.plist"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        dados = [NSMutableArray arrayWithContentsOfFile:filePath];
    }
    [tabela reloadData];
}

- (NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section {
    //número de linhas dentro da tabela
    return dados.count;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *celula = [tableView dequeueReusableCellWithIdentifier:@"Celula"];
    if (celula == nil) {
        celula = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Celula"];
    }
    @try {
        if ([dados  objectAtIndex:indexPath.row] != nil) {
            NSDictionary *item = [dados objectAtIndex:indexPath.row];
            celula.textLabel.text = [self resultado:item];
            celula.detailTextLabel.text = [NSString stringWithFormat:@"Gasolina: %@. Álcool: %@.",[item objectForKey:@"gasolina"], [item objectForKey:@"alcool"]];
            
        }
    }
    @catch (NSException *exception) {}
    @finally {}
    return celula;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)voltar:(id)sender{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSString *)resultado:(NSDictionary *)dados {
    float alcool =  [[dados objectForKey:@"alcool"] floatValue];
    float gasolina = [[dados objectForKey:@"gasolina"] floatValue];
    if (alcool<(gasolina * 0.7)) {
        return @"Álcool é melhor";
    } else if (alcool>(gasolina * 0.7)) {
        return @"Gasolina é melhor";
    } else {
        return @"Tanto faz";
    }
}
@end
