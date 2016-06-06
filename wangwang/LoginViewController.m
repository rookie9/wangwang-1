//
//  LoginViewController.m
//  wangwang
//
//  Created by mac on 16/6/2.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import "LoginViewController.h"
#import "Masonry.h"
#import "SetDataViewController.h"
//#define MAS_SHORTHAND_GLOBALS

@interface LoginViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UILabel *phoneLabel;
@property (nonatomic, strong) UILabel *codeLabel;
@property (nonatomic, strong) UITextField *phoneTF;
@property (nonatomic, strong) UITextField *codeTF;


@end

@implementation LoginViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  
  UIImageView *imageView = [[UIImageView alloc]init];
  
  imageView.image = [[UIImage imageNamed:@"LoginBackground.jpeg"]stretchableImageWithLeftCapWidth:0 topCapHeight:10];
  
  imageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
  
  [self.view addSubview:imageView];
  
  UIImageView *logoView = [[UIImageView alloc]init];
  
  logoView.image = [UIImage imageNamed:@"DogLogo.jpg"];
  
  [self.view addSubview:logoView];
  
  [logoView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.equalTo(self.view.mas_height).with.multipliedBy(0.12);
    make.height.equalTo(self.view.mas_height).with.multipliedBy(0.12);
    make.centerX.equalTo(self.view.mas_centerX);
    make.centerY.equalTo(self.view.mas_centerY).with.multipliedBy(0.2);
  }];
  
  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap0:)];
  
  [self.view addGestureRecognizer:tap];
  
  UILabel *logoLabel = [[UILabel alloc]init];
  
  logoLabel.font = [UIFont boldSystemFontOfSize:30];
  
  logoLabel.textColor = [UIColor whiteColor];
  
  logoLabel.text = @"汪汪附近";
  
  logoLabel.textAlignment = NSTextAlignmentCenter;
  
  [self.view addSubview:logoLabel];
  
  [logoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.equalTo(self.view.mas_height).with.multipliedBy(0.4);
    make.height.equalTo(self.view.mas_height).with.multipliedBy(0.12);
    make.centerX.equalTo(self.view.mas_centerX);
    make.centerY.equalTo(self.view.mas_centerY).with.multipliedBy(0.4);
  }];
  
  _phoneTF = [[UITextField alloc]init];
  
  _phoneTF.backgroundColor = [UIColor whiteColor];
  
  _phoneTF.alpha = 0.5;
  
  _phoneTF.layer.cornerRadius = 15;
  
  _phoneTF.clipsToBounds = YES;
  
  _phoneTF.borderStyle = UITextBorderStyleRoundedRect;
  
  _phoneTF.textColor = [UIColor blackColor];
  
  _phoneTF.font = [UIFont systemFontOfSize:17];
  
  _phoneTF.textAlignment = NSTextAlignmentLeft;
  
  //    phoneTF.placeholder = @"请输入是11位手机号";
  
  //安全输入
  //    phoneTF.secureTextEntry = YES;
  
  _phoneTF.keyboardType = UIKeyboardTypeNumberPad;
  
  _phoneTF.clearButtonMode = UITextFieldViewModeWhileEditing;
  
  _phoneTF.delegate =self;
  
  [self.view addSubview:_phoneTF];
  
  [_phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.equalTo(self.view.mas_width).with.multipliedBy(0.8);
    make.height.equalTo(self.view.mas_height).with.multipliedBy(0.05);
    make.centerX.equalTo(self.view.mas_centerX);
    make.centerY.equalTo(self.view.mas_centerY).with.multipliedBy(0.6);
  }];
  
  _phoneLabel = [[UILabel alloc]init];
  
  _phoneLabel.text = @"请输入11位手机号";
  
  _phoneLabel.textColor = [UIColor whiteColor];
  
  _phoneLabel.font = [UIFont systemFontOfSize:13];
  
  _phoneLabel.textAlignment = NSTextAlignmentCenter;
  
  [self.view addSubview:_phoneLabel];
  
  [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.equalTo(_phoneTF.mas_width).with.multipliedBy(0.8);
    make.height.equalTo(_phoneTF.mas_height).with.multipliedBy(0.7);
    make.centerX.equalTo(_phoneTF.mas_centerX);
    make.centerY.equalTo(_phoneTF.mas_centerY);
  }];
  
  
  _codeTF = [[UITextField alloc]init];
  
  _codeTF.backgroundColor = [UIColor whiteColor];
  
  _codeTF.alpha = 0.4;
  
  _codeTF.layer.cornerRadius = 15;
  
  _codeTF.clipsToBounds = YES;
  
  _codeTF.borderStyle = UITextBorderStyleRoundedRect;
  
  _codeTF.textColor = [UIColor blackColor];
  
  _codeTF.font = [UIFont systemFontOfSize:17];
  
  _codeTF.textAlignment = NSTextAlignmentLeft;
  
  //    codeTF.placeholder = @"请输入是4位验证码";
  
  //        phoneTF.secureTextEntry = YES;
  
  _codeTF.keyboardType = UIKeyboardTypeNumberPad;
  
  _codeTF.clearButtonMode = UITextFieldViewModeWhileEditing;
  
  _codeTF.delegate = self;
  
  [self.view addSubview:_codeTF];
  
  [_codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.equalTo(self.view.mas_width).with.multipliedBy(0.8);
    make.height.equalTo(self.view.mas_height).with.multipliedBy(0.05);
    make.centerX.equalTo(self.view.mas_centerX);
    make.centerY.equalTo(self.view.mas_centerY).with.multipliedBy(0.8);
  }];
  
  _codeLabel = [[UILabel alloc]init];
  
  _codeLabel.text = @"请输入4位验证码";
  
  _codeLabel.textColor = [UIColor whiteColor];
  
  _codeLabel.font = [UIFont systemFontOfSize:13];
  
  _codeLabel.textAlignment = NSTextAlignmentCenter;
  
  [self.view addSubview:_codeLabel];
  
  [_codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.equalTo(_codeTF.mas_width).with.multipliedBy(0.8);
    make.height.equalTo(_codeTF.mas_height).with.multipliedBy(0.7);
    make.centerX.equalTo(_codeTF.mas_centerX);
    make.centerY.equalTo(_codeTF.mas_centerY);
  }];
  
  UIButton *codeB = [[UIButton alloc]init];
  
  codeB.layer.cornerRadius = 15;
  
  codeB.clipsToBounds = YES;
  
  [codeB setImage:[UIImage imageNamed:@"button-.compressed"] forState:UIControlStateNormal];
  
  [codeB addTarget:self action:@selector(code:) forControlEvents:UIControlEventTouchUpInside];
  
  [self.view addSubview:codeB];
  
  [codeB mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.equalTo(_codeTF.mas_width).with.multipliedBy(0.3);
    make.height.equalTo(_codeTF.mas_height).with.multipliedBy(0.7);
    make.centerX.equalTo(_codeTF.mas_centerX).with.multipliedBy(1.55);
    make.centerY.equalTo(_codeTF.mas_centerY);
  }];
  
  UIButton *codeB0 = [[UIButton alloc]init];
  
  [codeB0 setTitle:@"获取验证码" forState:UIControlStateNormal];
  
  [codeB0 setTintColor:[UIColor whiteColor]];
  
  codeB0.titleLabel.font = [UIFont systemFontOfSize:14];
  
  [codeB0 addTarget:self action:@selector(code:) forControlEvents:UIControlEventTouchUpInside];
  
  [self.view addSubview:codeB0];
  
  [codeB0 mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.equalTo(codeB.mas_width).with.multipliedBy(0.8);
    make.height.equalTo(codeB.mas_height).with.multipliedBy(0.8);
    make.centerX.equalTo(codeB.mas_centerX);
    make.centerY.equalTo(codeB.mas_centerY);
  }];
  
  
  UILabel *readLabel = [[UILabel alloc]init];
  
  readLabel.text = @"我已阅读《用户注册协议》";
  
  readLabel.textColor = [UIColor whiteColor];
  
  readLabel.textAlignment = NSTextAlignmentCenter;
  
  [self.view addSubview:readLabel];
  
  [readLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.equalTo(self.view.mas_width).with.multipliedBy(0.6);
    make.height.equalTo(self.view.mas_height).with.multipliedBy(0.12);
    make.centerX.equalTo(self.view.mas_centerX).with.multipliedBy(1.1);
    make.centerY.equalTo(self.view.mas_centerY).with.multipliedBy(1.05);
  }];
  
  UIButton *loginButton = [[UIButton alloc]init];
  
  [loginButton setImage:[UIImage imageNamed:@"button-.compressed"] forState:UIControlStateNormal];
  
  [loginButton addTarget:self action:@selector(loginaa:) forControlEvents:UIControlEventTouchUpInside];
  
  [self.view addSubview:loginButton];
  
  [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.equalTo(self.view.mas_width).with.multipliedBy(0.8);
    make.height.equalTo(self.view.mas_height).with.multipliedBy(0.05);
    make.centerX.equalTo(self.view.mas_centerX);
    make.centerY.equalTo(self.view.mas_centerY).with.multipliedBy(1.3);
  }];
  
  UIButton *loginButton0 = [[UIButton alloc]init];
  
  [loginButton0 setTitle:@"登录" forState:UIControlStateNormal];
  
  [loginButton0 setTintColor:[UIColor whiteColor]];
  
  [loginButton0 addTarget:self action:@selector(loginaa:) forControlEvents:UIControlEventTouchUpInside];
  
  [self.view addSubview:loginButton0];
  
  [loginButton0 mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.equalTo(loginButton.mas_width).with.multipliedBy(0.2);
    make.height.equalTo(loginButton.mas_height).with.multipliedBy(0.5);
    make.centerX.equalTo(loginButton.mas_centerX);
    make.centerY.equalTo(loginButton.mas_centerY);
  }];
  
  UILabel *socialLabel = [[UILabel alloc]init];
  
  socialLabel.text = @"社交账号登录";
  
  socialLabel.textColor = [UIColor whiteColor];
  
  socialLabel.textAlignment = NSTextAlignmentCenter;
  
  [self.view addSubview:socialLabel];
  
  [socialLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.equalTo(self.view.mas_width).with.multipliedBy(0.5);
    make.height.equalTo(self.view.mas_height).with.multipliedBy(0.12);
    make.centerX.equalTo(self.view.mas_centerX);
    make.centerY.equalTo(self.view.mas_centerY).with.multipliedBy(1.5);
  }];
  
  UIView *view = [[UIView alloc]init];
  
  view.backgroundColor = [UIColor grayColor];
  
  [self.view addSubview:view];
  
  [view mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.equalTo(self.view.mas_width).with.multipliedBy(0.25);
    make.height.equalTo(socialLabel.mas_height).with.multipliedBy(0.04);
    make.centerX.equalTo(self.view.mas_centerX).with.multipliedBy(0.35);
    make.centerY.equalTo(self.view.mas_centerY).with.multipliedBy(1.5);
  }];
  
  UIView *view0 = [[UIView alloc]init];
  
  view0.backgroundColor = [UIColor grayColor];
  
  [self.view addSubview:view0];
  
  [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.equalTo(self.view.mas_width).with.multipliedBy(0.25);
    make.height.equalTo(socialLabel.mas_height).with.multipliedBy(0.04);
    make.centerX.equalTo(self.view.mas_centerX).with.multipliedBy(1.65);
    make.centerY.equalTo(self.view.mas_centerY).with.multipliedBy(1.5);
  }];
  
  UIButton *QQB = [[UIButton alloc]init];
  
  [QQB setImage:[UIImage imageNamed:@"QQ.compressed"] forState:UIControlStateNormal];
  
  [QQB addTarget:self action:@selector(QQlogin:) forControlEvents:UIControlEventTouchUpInside];
  
  [self.view addSubview:QQB];
  
  [QQB mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.equalTo(self.view.mas_width).with.multipliedBy(0.35);
    make.height.equalTo(self.view.mas_height).with.multipliedBy(0.10);
    make.centerX.equalTo(self.view.mas_centerX).with.multipliedBy(0.45);
    make.centerY.equalTo(self.view.mas_centerY).with.multipliedBy(1.7);
  }];
  
  UIButton *WeiXinB = [[UIButton alloc]init];
  
  [WeiXinB setImage:[UIImage imageNamed:@"weixin.compressed"] forState:UIControlStateNormal];
  
  [WeiXinB addTarget:self action:@selector(WeiXinlogin:) forControlEvents:UIControlEventTouchUpInside];
  
  [self.view addSubview:WeiXinB];
  
  [WeiXinB mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.equalTo(self.view.mas_width).with.multipliedBy(0.35);
    make.height.equalTo(self.view.mas_height).with.multipliedBy(0.10);
    make.centerX.equalTo(self.view.mas_centerX);
    make.centerY.equalTo(self.view.mas_centerY).with.multipliedBy(1.7);
  }];
  
  UIButton *WeiBoB = [[UIButton alloc]init];
  
  [WeiBoB setImage:[UIImage imageNamed:@"weibo.compressed"] forState:UIControlStateNormal];
  
  [WeiBoB addTarget:self action:@selector(WeiBologin:) forControlEvents:UIControlEventTouchUpInside];
  
  [self.view addSubview:WeiBoB];
  
  [WeiBoB mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.equalTo(self.view.mas_width).with.multipliedBy(0.35);
    make.height.equalTo(self.view.mas_height).with.multipliedBy(0.10);
    make.centerX.equalTo(self.view.mas_centerX).with.multipliedBy(1.55);
    make.centerY.equalTo(self.view.mas_centerY).with.multipliedBy(1.7);
  }];
  
  UIButton *duihaoB = [[UIButton alloc]init];
  
  [duihaoB setImage:[UIImage imageNamed:@"0.jpg"] forState:UIControlStateNormal];
  
  duihaoB.selected = YES;
  
  [duihaoB addTarget:self action:@selector(duihao:) forControlEvents:UIControlEventTouchUpInside];
  
  [self.view addSubview:duihaoB];
  
  [duihaoB mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.equalTo(self.view.mas_width).with.multipliedBy(0.05);
    make.height.equalTo(self.view.mas_width).with.multipliedBy(0.05);
    make.centerX.equalTo(self.view.mas_centerX).with.multipliedBy(0.45);
    make.centerY.equalTo(readLabel.mas_centerY);
  }];
  
  
  
  
}

//对号
-(void)duihao:(UIButton *)duihaoB{
  
  duihaoB.selected = !duihaoB.selected;
  
  if (duihaoB.selected) {
    [duihaoB setImage:[UIImage imageNamed:@"0.jpg"] forState:UIControlStateNormal];
    
  }else{
    
    [duihaoB setImage:[UIImage imageNamed:@"1.jpg"] forState:UIControlStateNormal];
    
    
  }
  
}

//微博
-(void)WeiBologin:(UIButton *)WeiBoB{
  
  NSLog(@"微博");
  
}

//微信
-(void)WeiXinlogin:(UIButton *)WeiXinB{
  
  NSLog(@"微信");
  
}

//QQ
-(void)QQlogin:(UIButton *)QQB{
  
  NSLog(@"QQ");
  
}

//登录按钮
-(void)loginaa:(UIButton *)loginButton{
  
    SetDataViewController *setVC = [[SetDataViewController alloc]init];   
    
    [self presentViewController:setVC animated:YES completion:^{
        
        
    }];
    
    NSLog(@"登录");  
}

//验证码按钮
-(void)code:(UIButton *)codeB{
  
  NSLog(@"验证码");
  
}

//手势取消编辑模式 取消第一响应者
-(void)tap0:(UITapGestureRecognizer *)tap{
  
  [_phoneTF resignFirstResponder];
  [_codeTF resignFirstResponder];
  
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
  
  _phoneLabel.hidden = YES;
  _codeLabel.hidden = YES;
  
  return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
  _phoneLabel.hidden = YES;
  _codeLabel.hidden = YES;
  
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
  _phoneLabel.hidden = NO;
  _codeLabel.hidden = NO;
  
  
  return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
  _phoneLabel.hidden = NO;
  _codeLabel.hidden = NO;
  
  
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

