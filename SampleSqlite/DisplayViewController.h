//
//  DisplayViewController.h
//  SampleSqlite
//
//  Created by Naresh Kandala on 23/12/16.
//  Copyright © 2016 Naresh Kandala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIButton *Back_btn;

@property (strong, nonatomic) IBOutlet UITableView *tbl_view;
- (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData;
-(NSMutableArray *)GetAllDate;
@end

