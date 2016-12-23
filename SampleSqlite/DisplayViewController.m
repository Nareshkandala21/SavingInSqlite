//
//  DisplayViewController.m
//  SampleSqlite
//
//  Created by Naresh Kandala on 23/12/16.
//  Copyright © 2016 Naresh Kandala. All rights reserved.
//

#import "DisplayViewController.h"
#import "DisplayTableViewCell.h"
#import "FMDatabase.h"
#import "DBManager.h"
@interface DisplayViewController ()

@property(atomic,strong) NSMutableArray *array_values;

@end

@implementation DisplayViewController

- (void)viewDidLoad {
    _array_values =[self GetAllDate ];
    
    [self.tbl_view reloadData];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(NSMutableArray *)GetAllDate
{
    DBManager *db = [[DBManager alloc]init];
    
    FMDatabase *fmDB = [FMDatabase databaseWithPath:[db databasePath]];
    
    [fmDB open];
    
    NSString *insertQuery_fetch_Emp_Names=[NSString stringWithFormat:@"SELECT * FROM Employee"];
    
    
    FMResultSet *resultSet =  [fmDB executeQuery:insertQuery_fetch_Emp_Names];
    
    NSMutableArray *arr_total1=[[NSMutableArray alloc]init];
    
    
    while([resultSet next])
    {
        NSMutableArray *arr_total=[[NSMutableArray alloc]init];
        
        NSString *str_name = [NSString stringWithFormat:@"%@",[resultSet stringForColumn:@"FirstNames" ]];
        
        NSString *str_id = [NSString stringWithFormat:@"%@",[resultSet stringForColumn:@"LastNames" ]];
        
        NSString *str_phone = [NSString stringWithFormat:@"%@",[resultSet stringForColumn:@"Image" ]];
        
        [arr_total addObject:str_name];
        [arr_total addObject:str_id];
        [arr_total addObject:str_phone];
        
        [arr_total1 addObject:arr_total];
        
    }
//    NSLog(@"scjhvasj %@",arr_total1);
    return arr_total1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDataSource
// number of section(s), now I assume there is only 1 section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_array_values count];
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"DisplayTableViewCell";
    
    // Similar to UITableViewCell, but
    DisplayTableViewCell *cell = (DisplayTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[DisplayTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.lbl_FirstName.text = [[_array_values objectAtIndex:indexPath.row] objectAtIndex:0];
    cell.lbl_lastName.text = [[_array_values objectAtIndex:indexPath.row] objectAtIndex:1];
    NSString *str_image = [[_array_values objectAtIndex:indexPath.row] objectAtIndex:2];
    
    NSData* data = [[NSData alloc] initWithBase64EncodedString:str_image options:0];

   /// NSLog(@"aevkave %@",data);
   cell.display_img_view.image = [UIImage imageWithData:data];
    
    // Just want to test, so I hardcode the data
//    cell.descriptionLabel.text = @"Testing";
    
    return cell;
}
- (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
