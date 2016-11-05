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
    filePath = [NSHomeDirectory() stringByAppendingString:@"/Documents/dados.plist"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        dados = [NSMutableArray arrayWithContentsOfFile:filePath];
    } else {
        dados = [[NSMutableArray alloc] init];
    }
    
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
    [alerta show];
    alerta = nil;
}

-(IBAction)compartilhar:(id)sender {
    UIActionSheet *popup = [[UIActionSheet alloc]initWithTitle:@"Compartilhar" delegate:self cancelButtonTitle:@"Voltar" destructiveButtonTitle:nil otherButtonTitles:@"Facebook", @"Twitter", @"E-mail", nil];
    [popup showInView:self.view];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return true;
}
-(void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0: {
            [self compartilharSocial:@"F"];
        }
            break;
        case 1:{
            [self compartilharSocial:@"T"];
        }
            break;
        case 2:{
            [self compartilharEmail];
        }
        default:
            break;
    }
}
-(void)compartilharSocial:(NSString *)tipo {
    if ([tipo isEqual:@"F"]){
        if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
            [self mostrarMensagem:@"Pós alfa" msg:@"Facebook não configurado ou indisponível"];
            return;
        }
        
    } else {
        if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
            [self mostrarMensagem:@"Pós alfa" msg:@"Twitter não configurado ou indisponível"];
            return;
        }
        
    }
    NSString    *texto = [self retornaMensagem];
    if ([tipo isEqual:@"T"])
        texto = [texto substringWithRange:NSMakeRange(0, 140)];
    SLComposeViewController *controlador;
    if ([tipo isEqual:@"F"]) {
        controlador = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    } else {
        controlador = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    }
    SLComposeViewControllerCompletionHandler controleFim = ^(SLComposeViewControllerResult result) {
        [controlador dismissViewControllerAnimated:true completion:nil];
    };
    controlador.completionHandler = controleFim;
    [controlador setInitialText:texto];
    [controlador addURL:[NSURL URLWithString:@"http://avantagem.com.br/"]];
//    [controlador addImage:[UIImage imageNamed:@"logo.png"]];
    [self presentViewController:controlador animated:YES completion:nil];
}
-(void)compartilharEmail {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *email =
        [[MFMailComposeViewController alloc] init];
        email.mailComposeDelegate = self;
        [email setSubject:@"Alcool ou Gasolina?"];
        [email setMessageBody:[self retornaMensagem] isHTML:YES];
        [email setToRecipients:[NSArray arrayWithObjects:@"contato@avantagem.com.br",@"contato@adrianob.com.br",@"b.adrianobarbosa@gmail.com", nil]];
//        NSData *anexo  = [UIImagePNGRepresentation([UIImage imageNamed:@"Logo.png"])];
//        [email addAttachmentData:anexo mimeType:@"image/png" fileName:@"Logo.png"];
        [self presentViewController:email animated:YES completion:nil];
        
    } else {
        [self mostrarMensagem:@"Pós alfa" msg:@"Não é possível enviar email"];
    }
}
-(void)mailComposeController : (MFMailComposeViewController *) controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(NSString *) retornaMensagem {
    float alcool = [valorAlcool.text floatValue];
    float gasolina = [valorGasolina.text floatValue];
    NSString *retorno = [NSString stringWithFormat:@"Valor do álcool: %f. Valor da gasolina: %f", alcool, gasolina];
    return retorno;
}

-(IBAction)gravar:(id)sender {
    NSDictionary * item = [NSDictionary dictionaryWithObjectsAndKeys:valorAlcool.text,@"alcool",valorGasolina.text,@"gasolina", nil];
    [dados addObject:item];
    [dados writeToFile:filePath atomically:YES];
    [self listarDados];
}
-(void)listarDados{
    for (NSDictionary *item in dados) {
        NSLog(@"Álcool: %@. Gasolina: %@.",[item objectForKey:@"alcool"],[item objectForKey:@"gasolina"]);
    }
    NSLog(@"-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-");
}
@end
