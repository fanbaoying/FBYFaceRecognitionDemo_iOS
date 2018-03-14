//
//  FBYFaceRecognitionViewController.h
//  FBYFaceRecognition_iOS
//
//  Created by fby on 2018/3/13.
//  Copyright © 2018年 FBYFaceRecognition_iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol FaceDetectorDelegate <NSObject>

//图片上传成功
-(void)sendFaceImage:(UIImage *)faceImage;

//图片上传失败
-(void)sendFaceImageError;

@end
@interface FBYFaceRecognitionViewController : UIViewController

@property (assign,nonatomic) id<FaceDetectorDelegate> faceDelegate;


@end
