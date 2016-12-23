//
//  DisplayTableViewCell.h
//  SampleSqlite
//
//  Created by Naresh Kandala on 23/12/16.
//  Copyright © 2016 Naresh Kandala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lbl_FirstName;
@property (strong, nonatomic) IBOutlet UILabel *lbl_lastName;
@property (strong, nonatomic) IBOutlet UIImageView *display_img_view;

@end
