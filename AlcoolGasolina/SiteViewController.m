//
//  SiteViewController.m
//  AlcoolGasolina
//
//  Created by Faculdade Alfa on 19/11/16.
//  Copyright (c) 2016 Faculdade Alfa. All rights reserved.
//

#import "SiteViewController.h"

@interface SiteViewController ()

@end

@implementation SiteViewController
@synthesize site;
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *urlString = @"http://avantagem.com.br/";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    site.scalesPageToFit = YES;
    [site loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)voltar:(id)sender{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}
-(void) webViewDidStartLoad:(UIWebView *)webView    {
    [self.spinner startAnimating];
}
-(void) webViewDidFinishLoad:(UIWebView *)webView {
    [self.spinner stopAnimating];
}
-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error  {
    [self.spinner stopAnimating];
}
@end
