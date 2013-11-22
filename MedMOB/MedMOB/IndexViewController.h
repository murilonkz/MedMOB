//
//  IndexViewController.h
//  MedMOB
//
//  Created by Thiago Oliveira on 11/20/13.
//  Copyright (c) 2013 Murilo Campaner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexViewController : UIViewController
- (IBAction)emergencia:(id)sender;
- (IBAction)buscar:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *opcao;

@end
