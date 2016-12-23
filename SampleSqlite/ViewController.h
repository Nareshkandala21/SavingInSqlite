//
//  ViewController.h
//  SampleSqlite
//
//  Created by Naresh Kandala on 23/12/16.
//  Copyright © 2016 Naresh Kandala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (strong, nonatomic) IBOutlet UIButton *Save_btn;
@property (strong, nonatomic) IBOutlet UILabel *lbl_firstName;
@property (strong, nonatomic) IBOutlet UILabel *lbl_lastName;
@property (strong, nonatomic) IBOutlet UITextField *txtfld_FirstName;
@property (strong, nonatomic) IBOutlet UITextField *txtfld_lastName;

@end

