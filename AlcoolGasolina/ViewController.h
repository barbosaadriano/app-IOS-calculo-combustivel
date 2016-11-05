//
//  ViewController.h
//  AlcoolGasolina
//
//  Created by Faculdade Alfa on 05/11/16.
//  Copyright (c) 2016 Faculdade Alfa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <MessageUI/MessageUI.h>

@interface ViewController : UIViewController<UITextFieldDelegate, UIActionSheetDelegate, MFMessageComposeViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextField *valorAlcool;
@property (strong, nonatomic) IBOutlet UITextField *valorGasolina;

-(IBAction)calcular:(id)sender;
-(IBAction)compartilhar:(id)sender;

@end

