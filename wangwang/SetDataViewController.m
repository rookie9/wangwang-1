//
//  SetDataViewController.m
//  wangwang
//
//  Created by Mac on 16/6/2.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import "SetDataViewController.h"
#import "Masonry.h"

@interface SetDataViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *nameTF; //名字输入框
@property (nonatomic, strong) UITextField *sexTF; //性别输入框
@property (nonatomic, strong) UIButton *sexbt1; //男选择button
@property (nonatomic, strong) UIButton *sexbt2; //女选择button


@end

@implementation SetDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景图片
    UIImageView *imageView = [[UIImageView alloc]init];
    
    imageView.image = [[UIImage imageNamed:@"LoginBackground.jpeg"]stretchableImageWithLeftCapWidth:0 topCapHeight:10];
    
    imageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
    [self.view addSubview:imageView];
    
    //圆形白色View
    UIView *headview = [[UIView alloc]init];
    
    headview.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];

    headview.layer.cornerRadius = 53;
    
    [self.view addSubview:headview];
    
    [headview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width).with.multipliedBy(0.25);
        make.height.equalTo(self.view.mas_width).with.multipliedBy(0.25);
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY).with.multipliedBy(0.5);
    }];
    
    //上传头像button
    UIButton *headbt = [[UIButton alloc]init];
    
    [headbt setTitle:@"请上传头像" forState:UIControlStateNormal];
    
    [headbt setTintColor:[UIColor whiteColor]];
    
    headbt.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [headbt addTarget:self action:@selector(headAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:headbt];
 
    [headbt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width).with.multipliedBy(0.25);
        make.height.equalTo(self.view.mas_width).with.multipliedBy(0.25);
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY).with.multipliedBy(0.5);
    }];

    _nameTF = [[UITextField alloc]init];
    
    _nameTF.backgroundColor = [UIColor whiteColor];
    
    _nameTF.alpha = 0.5;
    
    _nameTF.layer.cornerRadius = 15;
    
    _nameTF.clipsToBounds = YES;
    
    _nameTF.borderStyle = UITextBorderStyleRoundedRect;
    
    _nameTF.textColor = [UIColor blackColor];
    
    _nameTF.font = [UIFont systemFontOfSize:14];
    
    _nameTF.placeholder = @"请告诉我们您的名字";
    
    _nameTF.textColor = [UIColor lightGrayColor];
    
    _nameTF.textAlignment = NSTextAlignmentCenter;
    
    //安全输入
    //    phoneTF.secureTextEntry = YES;
    
    _nameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _nameTF.delegate =self;
    
    [self.view addSubview:_nameTF];
    
    [_nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width).with.multipliedBy(0.7);
        make.height.equalTo(self.view.mas_height).with.multipliedBy(0.05);
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY).with.multipliedBy(0.75);
    }];
    
    _sexTF = [[UITextField alloc]init];
    
    _sexTF.backgroundColor = [UIColor whiteColor];
    
    _sexTF.alpha = 0.5;
    
    _sexTF.layer.cornerRadius = 15;
    
    _sexTF.clipsToBounds = YES;
    
    _sexTF.borderStyle = UITextBorderStyleRoundedRect;
    
    _sexTF.textColor = [UIColor blackColor];
    
    _sexTF.font = [UIFont systemFontOfSize:14];
    
    _sexTF.placeholder = @"请告诉我们您的性别";
    
    _sexTF.textColor = [UIColor lightGrayColor];
    
    _sexTF.textAlignment = NSTextAlignmentCenter;
    
    _sexTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _sexTF.delegate =self;
    
    [self.view addSubview:_sexTF];
    
    [_sexTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width).with.multipliedBy(0.4);
        make.height.equalTo(self.view.mas_height).with.multipliedBy(0.05);
        make.centerX.equalTo(self.view.mas_centerX).with.multipliedBy(0.7);
        make.centerY.equalTo(self.view.mas_centerY).with.multipliedBy(0.95);
    }];
    
    //性别选择button(男)
    _sexbt1 = [[UIButton alloc]init];
    
    [_sexbt1 setTintColor:[UIColor blackColor]];
     
    [_sexbt1 setBackgroundImage:[UIImage imageNamed:@"3.jpg"] forState:UIControlStateNormal];
    
    [_sexbt1 setBackgroundImage:[UIImage imageNamed:@"2.jpg"] forState:UIControlStateSelected];
    
    _sexbt1.titleLabel.textAlignment = NSTextAlignmentRight;
    
    [_sexbt1 addTarget:self action:@selector(sex1Action:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_sexbt1];
    
    [_sexbt1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width).with.multipliedBy(0.2);
        make.height.equalTo(self.view.mas_width).with.multipliedBy(0.2);
        make.centerX.equalTo(_sexTF.mas_right).with.offset(30);
        make.centerY.equalTo(self.view.mas_centerY).with.multipliedBy(0.95);
    }];
    
    UILabel *sexlabel1 = [[UILabel alloc]init];
    
    sexlabel1.text = @"男";
    
    sexlabel1.textColor = [UIColor whiteColor];
    
    sexlabel1.font = [UIFont systemFontOfSize:15];
    
    [self.view addSubview:sexlabel1];
    
    [sexlabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(_sexbt1.mas_width).with.multipliedBy(0.2);
        make.height.equalTo(_sexbt1.mas_height).with.multipliedBy(0.13);
        make.centerX.equalTo(_sexbt1.mas_centerX).with.offset(15);
        make.centerY.equalTo(_sexbt1.mas_centerY).with.multipliedBy(0.99);
    }];
    
    //性别选择button（女）
    _sexbt2 = [[UIButton alloc]init];
    
//    _sexbt2.backgroundColor = [UIColor whiteColor];
    
    [_sexbt2 setTintColor:[UIColor blackColor]];
    
    [_sexbt2 setBackgroundImage:[UIImage imageNamed:@"3.jpg"] forState:UIControlStateNormal];
    
    [_sexbt2 setBackgroundImage:[UIImage imageNamed:@"2.jpg"] forState:UIControlStateSelected];
    
    _sexbt2.titleLabel.textAlignment = NSTextAlignmentRight;
    
    [_sexbt2 addTarget:self action:@selector(sex2Action:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_sexbt2];
    
    [_sexbt2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width).with.multipliedBy(0.2);
        make.height.equalTo(self.view.mas_width).with.multipliedBy(0.2);
        make.centerX.equalTo(sexlabel1.mas_right).with.offset(20);
        make.centerY.equalTo(self.view.mas_centerY).with.multipliedBy(0.95);
    }];
    
    UILabel *sexlabel2 = [[UILabel alloc]init];
    
    sexlabel2.text = @"女";
    
    sexlabel2.textColor = [UIColor whiteColor];
    
    sexlabel2.font = [UIFont systemFontOfSize:15];
    
    [self.view addSubview:sexlabel2];
    
    [sexlabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(_sexbt2.mas_width).with.multipliedBy(0.2);
        make.height.equalTo(_sexbt2.mas_height).with.multipliedBy(0.13);
        make.centerX.equalTo(_sexbt2.mas_centerX).with.offset(15);
        make.centerY.equalTo(_sexbt2.mas_centerY).with.multipliedBy(0.99);
    }];

    //进入汪汪button
    UIButton *comebt = [[UIButton alloc]init];
    
    [comebt setBackgroundImage:[UIImage imageNamed:@"button-.compressed"] forState:UIControlStateNormal];
    
    [comebt setTitle:@"进入汪汪" forState:UIControlStateNormal];
        
    comebt.titleLabel.font = [UIFont systemFontOfSize:17];
    
    [comebt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [comebt addTarget:self action:@selector(comeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:comebt];
    
    [comebt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width).with.multipliedBy(0.6);
        make.height.equalTo(self.view.mas_width).with.multipliedBy(0.1);
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY).with.multipliedBy(1.2);
    }];

    
}


//上传头像
-(void)headAction:(UIButton *)headbt{
    
    NSLog(@"上传头像");
    
}

//男button选择
-(void)sex1Action:(UIButton *)sexbt1{
    
    sexbt1.selected = !sexbt1.selected;
    
    if (_sexbt1.selected) {
        
        _sexbt2.selected=NO;
    }    
    NSLog(@"sex1点击");
    
    
}

//女button选择
-(void)sex2Action:(UIButton *)sexbt2{
    
    sexbt2.selected = !sexbt2.selected;
    
    if (_sexbt2.selected) {
        
        _sexbt1.selected=NO;
    }
    
    NSLog(@"sex2点击");
    
}

//进入汪汪button
-(void)comeAction:(UIButton *)comebt{
    
    NSLog(@"进入汪汪");
    
}



//手势取消编辑模式 取消第一响应者
-(void)tap0:(UITapGestureRecognizer *)tap{
    
    [_nameTF resignFirstResponder];
    [_sexTF resignFirstResponder];
    
}

//#pragma mark --UITextFieldDelegate
//
//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
//    
//    NSLog(@"将要开始编辑时");
//    
//    return YES;
//}
//- (void)textFieldDidBeginEditing:(UITextField *)textField{
//    
//    NSLog(@"已经开始编辑时");
//}
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
//    
//    NSLog(@"将要结束编辑时");
//    
//    return YES;
//}
//- (void)textFieldDidEndEditing:(UITextField *)textField{
//    
//    NSLog(@"已经结束编辑时");
//}
//
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    
//    NSLog(@"修改文本内容");
//    
//    NSLog(@"%@",NSStringFromRange(range));
//    NSLog(@"%@",string);
//    
//    return YES;
//    
//}
//
//- (BOOL)textFieldShouldClear:(UITextField *)textField{
//    
//    NSLog(@"清空");
//    
//    return YES;
//    
//}
//
//- (BOOL)textFieldShouldReturn:(UITextField *)textField{
//    
//    NSLog(@"发送了内容:%@",_nameTF.text);
//    NSLog(@"发送了内容:%@",_sexTF.text);
//    
//    return YES;
//}
@end
