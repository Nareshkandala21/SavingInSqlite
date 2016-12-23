//
//  ViewController.m
//  SampleSqlite
//
//  Created by Naresh Kandala on 23/12/16.
//  Copyright © 2016 Naresh Kandala. All rights reserved.
//

#import "ViewController.h"
#import "DBManager.h"
#import "FMDatabase.h"
@interface ViewController ()

@property (atomic,strong)   NSString *imageString;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)Save_Action:(id)sender {
    
    BOOL check;
    DBManager *db = [[DBManager alloc]init];
    
    
    FMDatabase *database = [FMDatabase databaseWithPath:[db databasePath]];
    [database open];
    
    
    NSString *insertQuery_insert_Names = [NSString stringWithFormat:@"INSERT INTO Employee (FirstNames ,LastNames ,Image ) VALUES ('%@','%@','%@')",self.txtfld_FirstName.text,_txtfld_lastName.text,_imageString];
  check =   [database executeUpdate:insertQuery_insert_Names];
    
    if (check) {
        NSLog(@"inserted");
        
    }else
    {
        NSLog(@"not inserted");
        
    }
    
    [database close];
    
    
    
    
    
}

- (IBAction)selectPhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
    _imageString = [self encodeToBase64String:chosenImage];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (NSString *)encodeToBase64String:(UIImage *)image {
    return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
