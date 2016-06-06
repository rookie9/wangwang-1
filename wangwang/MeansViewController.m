//
//  MeansViewController.m
//  wangwang
//
//  Created by mac on 16/6/4.
//  Copyright © 2016年 王晓东. All rights reserved.
//
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#import "MeansViewController.h"
#import "Masonry.h"
@interface MeansViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    UILabel *_nameL;
    UIImageView *_nanimageView;
    UIImageView *_nvimageView;
    UILabel *_date;

}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *imageB;//头像按钮
@property (nonatomic, strong) NSArray *datalist;

@end

@implementation MeansViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _datalist = [[NSArray alloc]init];
    
    self.navigationItem.title = @"个人资料";
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationController.navigationBar.barTintColor=[UIColor redColor];
    
    UIButton *backbutton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    
    [backbutton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:backbutton];
    
    //设置左侧按钮
    self.navigationItem.leftBarButtonItem = leftItem;
    
    [backbutton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *okbutton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    
    [okbutton setImage:[UIImage imageNamed:@"ok"] forState:UIControlStateNormal];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:okbutton];
    
    //设置右侧按钮
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [okbutton addTarget:self action:@selector(ok:) forControlEvents:UIControlEventTouchUpInside];
    
    _datalist = @[@"姓名",@"性别",@"生日"];
    
    //创建表视图
    [self creationTV];

}

//左边
-(void)back:(UIButton *)backbutton{

    NSLog(@"左边");

}

//右边
-(void)ok:(UIButton *)okbutton{

    NSLog(@"右边");

}

//创建表视图
-(void)creationTV{

    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];

}

//点击头像
-(void)imageB:(UIButton *)imageB{

    NSLog(@"imageB");

}

-(void)setName:(NSString *)name{

    _name = name;
    
    [_tableView reloadData];

}

-(void)setSex:(NSString *)sex{

    _sex = sex;
    
    [_tableView reloadData];

}

#pragma mark ---- 视图方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 1;
        
    }
    
    return 3;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        
        return 100;
        
    }

    return 60;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    if (indexPath.section == 0) {
        
            UILabel *label = [[UILabel alloc]init];
        
            label.text = @"头像";
        
            label.textColor = [UIColor grayColor];
        
            [cell addSubview:label];
        
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(cell.mas_width).with.multipliedBy(0.2);
                make.height.equalTo(cell.mas_width).with.multipliedBy(0.1);
                make.centerX.equalTo(cell.mas_centerX).with.multipliedBy(0.3);
                make.centerY.equalTo(cell.mas_centerY);
            }];
        
            _imageB = [[UIButton alloc]init];
        
            [_imageB setImage:[UIImage imageNamed:@"boy"] forState:UIControlStateNormal];
        
            [cell addSubview:_imageB];
        
            [_imageB addTarget:self action:@selector(imageB:) forControlEvents:UIControlEventTouchUpInside];
        
            [_imageB mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.width.equalTo(cell.mas_width).with.multipliedBy(0.1);
//                make.height.equalTo(cell.mas_width).with.multipliedBy(0.1);
                make.centerX.equalTo(cell.mas_centerX).with.multipliedBy(1.7);
                make.centerY.equalTo(cell.mas_centerY);
            }];
        
        _imageB.transform = CGAffineTransformMakeScale(2.6, 2.6);

        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _tableView.frame.size.width, 1)];
    
    view.backgroundColor = [UIColor grayColor];
    
    [cell addSubview:view];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel *label = [[UILabel alloc]init];
    
    label.textColor = [UIColor grayColor];
    
    label.text = _datalist[indexPath.row];
    
    [cell addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(cell.mas_width).with.multipliedBy(0.2);
        make.height.equalTo(cell.mas_width).with.multipliedBy(0.1);
        make.centerX.equalTo(cell.mas_centerX).with.multipliedBy(0.3);
        make.centerY.equalTo(cell.mas_centerY);
    }];

    
    if (indexPath.section == 1 ) {
        
        if (indexPath.row == 0) {
            _nameL = [[UILabel alloc]init];
            
            _nameL.text = self.name;
            
            _nameL.textAlignment = NSTextAlignmentCenter;
            
            _nameL.textColor = [UIColor grayColor];
            
            [cell addSubview:_nameL];
            
            [_nameL mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(cell.mas_width).with.multipliedBy(0.4);
                make.height.equalTo(cell.mas_width).with.multipliedBy(0.1);
                make.centerX.equalTo(cell.mas_centerX).with.multipliedBy(1.75);
                make.centerY.equalTo(cell.mas_centerY);
            }];
            
            return cell;
        }else if (indexPath.row == 1){
            _nanimageView = [[UIImageView alloc]init];
            
            _nanimageView.image = [UIImage imageNamed:@"boy"];
            
            if ([self.sex  isEqual: @"男"]) {
                
                _nanimageView.image = [UIImage imageNamed:@"boy-0"];
                
            }
            
            [cell addSubview:_nanimageView];
            [_nanimageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(cell.mas_width).with.multipliedBy(0.1);
                make.height.equalTo(cell.mas_width).with.multipliedBy(0.1);
                make.centerX.equalTo(cell.mas_centerX).with.multipliedBy(1.5);
                make.centerY.equalTo(cell.mas_centerY);
            }];
            
            _nvimageView = [[UIImageView alloc]init];
            
            _nvimageView.image = [UIImage imageNamed:@"girl"];
            
            if ([self.sex  isEqual: @"女"]) {
                
                _nvimageView.image = [UIImage imageNamed:@"girl-0"];
                
            }
            
            
            [cell addSubview:_nvimageView];
            [_nvimageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(cell.mas_width).with.multipliedBy(0.1);
                make.height.equalTo(cell.mas_width).with.multipliedBy(0.1);
                make.centerX.equalTo(cell.mas_centerX).with.multipliedBy(1.8);
                make.centerY.equalTo(cell.mas_centerY);
            }];

            return cell;
        
        }else if (indexPath.row == 2){
        
            _date = [[UILabel alloc]init];
            
            _date.text = @"请选择出生日期";
            
            _date.textColor = [UIColor grayColor];
            
            _date.textAlignment = NSTextAlignmentCenter;
            
            [cell addSubview:_date];
            
            [_date mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(cell.mas_width).with.multipliedBy(0.6);
                make.height.equalTo(cell.mas_width).with.multipliedBy(0.1);
                make.centerX.equalTo(cell.mas_centerX).with.multipliedBy(1.6);
                make.centerY.equalTo(cell.mas_centerY);
            }];
            
            return cell;

        
        }

        
    }
    
    
    return cell;

}

//点击单元格
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"你是全世界最骚的骚猪");

}

















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
