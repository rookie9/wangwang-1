//
//  PublishViewController.m
//  wangwang
//
//  Created by Beiwo on 16/6/4.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import "PublishViewController.h"
#import "Masonry.h"

@interface PublishViewController ()<UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImageView *_imageView;
}
@property (nonatomic,strong)UILabel *placeHolder;
@property (nonatomic,strong)UITextView *textView;

@end

@implementation PublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    self.navigationItem.title =@"汪汪发布--兴趣交友";
    
    //设置导航栏item的字体颜色
    //    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    //设置导航栏不为半透明
    self.navigationController.navigationBar.translucent=NO;
    //设置导航栏颜色
    self.navigationController.navigationBar.barTintColor=[UIColor redColor];
    
    //通过自定义视图创建
    UIButton *sendButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    
    [sendButton addTarget:self action:@selector(ClickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [sendButton setImage:[UIImage imageNamed:@"ok"] forState:UIControlStateNormal];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:sendButton];
    
    //设置右侧按钮
    self.navigationItem.rightBarButtonItem = right;
    
    //创建 label
    UILabel *promptlabel = [[UILabel alloc]init];
    
    [self.view addSubview:promptlabel];
    
    promptlabel.text =@"请写下自己的详细信息和交友兴趣资料。例如：";
    
    promptlabel.textColor =[UIColor grayColor];
    
    [promptlabel mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.centerY.equalTo(self.view.mas_top).with.offset(26);
        make.left.equalTo(self.view.mas_left).with.offset(20);
    }];
    
    UILabel *orangeLable =[[UILabel alloc]init];
    
    orangeLable.textColor =[UIColor orangeColor];
    
    orangeLable.text =@"我想约人开黑打LOL,时间是这周末,地点是万达广场,有兴趣的私信我吧。";
    
    orangeLable.numberOfLines =0;
    
    [self.view addSubview:orangeLable];
    
    [orangeLable mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(promptlabel.mas_bottom).with.offset(5);
        make.left.equalTo(self.view.mas_left).with.offset (20);
        make.right.equalTo(self.view.mas_right).with.offset(-20);
    }];
    
    _textView =[[UITextView alloc]init];

    _textView.backgroundColor =[UIColor whiteColor];
    
    _textView.delegate =self;
    
    [self.view addSubview:_textView];
    
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.view.mas_height).with.multipliedBy(0.2);
        make.top.equalTo(orangeLable.mas_bottom).with.offset(10);
        make.left.equalTo(self.view).with.offset (20);
        make.right.equalTo(self.view).with.offset(-20);
        
    }];
    
    _placeHolder=[[UILabel alloc]init];
    
    _placeHolder.text=@"点击输入详细信息...";
    
    _placeHolder.enabled=NO;
    
    _placeHolder.textColor=[UIColor grayColor];
    
    [_textView addSubview:_placeHolder];
    
    [_placeHolder mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_textView.mas_left);
        make.top.equalTo(_textView.mas_top).with.offset(3);
    }];
    
    UIButton *imageButton =[[UIButton alloc]init];
    
    [imageButton setImage:[UIImage imageNamed:@"photo"] forState:UIControlStateNormal];
    
    [imageButton addTarget:self action:@selector(OpenCamera:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:imageButton];
    
    [imageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_textView.mas_bottom).with.offset(20);
        make.left.equalTo(self.view.mas_left).with.offset(20);
        make.width.equalTo(self.view.mas_width).with.multipliedBy(0.3);
        make.height.equalTo(self.view.mas_width).with.multipliedBy(0.3);
    }];
    
    _imageView =[[UIImageView alloc]initWithFrame:CGRectMake(20,365,100, 100)];
    
    [self.view addSubview:_imageView];
    
}

#pragma mark ------ UITextViewDelegate

//如果输入的字数超过100就不让再输入
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if (range.location>=100) {
        
        return NO;
        
    }else{
        
        return YES;
        
    }
    
    
    
}


-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    
    if (_textView.text.length ==0) {
        
        _placeHolder.hidden =YES;
        
    }
    
    return YES;
    
}

-(void)textViewDidChange:(UITextView *)textView{
    
    if (_textView.text.length==0) {
        
        _placeHolder.hidden=NO;
    }else{
        _placeHolder.hidden=YES;
    }
    
    
}

//点击加号弹出相册
-(void)OpenCamera:(id *)imgbutton{
    
    NSLog(@"弹出相册");
    
    //创建
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    
    //代理对象
    imagePicker.delegate = self;
    //相册类型
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:imagePicker animated:YES completion:^{
        
    }];
    
}

//通过 相机或相册获取了一个图片后 调用的方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    NSLog(@"照片选择完成");
    
    NSLog(@"info : %@",info);
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    _imageView.image = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

//点击 OK 触发事件
-(void)ClickButton:(UIButton *)button{
    
    NSLog(@"发布成功返回上一页");
    
}

      







@end
