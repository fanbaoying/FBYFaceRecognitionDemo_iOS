//
//  ViewController.m
//  FBYFaceRecognitionDemo_iOS
//
//  Created by fby on 2018/3/14.
//  Copyright © 2018年 FBYFaceRecognitionDemo_iOS. All rights reserved.
//

#import "ViewController.h"
#import "FBYFaceRecognitionViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<FaceDetectorDelegate>
{
    UIImageView *imgView;
}

@property(strong,nonatomic)UIButton *faceBtn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"人脸活体识别";
    
    self.faceBtn = [[UIButton alloc]initWithFrame:CGRectMake(50, 50, SCREEN_WIDTH-100, 50)];
    self.faceBtn.backgroundColor = [UIColor lightGrayColor];
    [self.faceBtn setTitle:@"人脸识别" forState:0];
    [self.faceBtn addTarget:self action:@selector(pushToFaceStreamDetectorVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_faceBtn];
    
    
    imgView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 160, SCREEN_WIDTH-100, 320)];
    imgView.backgroundColor = [UIColor colorWithRed:44/255.0 green:48/255.0 blue:75/255.0 alpha:1];
    [self.view addSubview:imgView];
    
}

-(void)sendFaceImage:(UIImage *)faceImage
{
    imgView.frame = CGRectMake(50, 150, self.view.frame.size.width-100, (self.view.frame.size.width-100)/faceImage.size.width*faceImage.size.height);
    imgView.image = faceImage;
    
    NSLog(@"图片上传成功");
}

- (void)sendFaceImageError {
    
    NSLog(@"图片上传失败");
}

-(void)pushToFaceStreamDetectorVC
{
    FBYFaceRecognitionViewController *faceVC = [[FBYFaceRecognitionViewController alloc]init];
    faceVC.faceDelegate = self;
    [self.navigationController pushViewController:faceVC animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
