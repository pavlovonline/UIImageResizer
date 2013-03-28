//
//  ImageResizer.m
//  UIImageResizer
//
//  Created by Anton Pavlov on 3/28/13.
//  Copyright (c) 2013 Anton Pavlov. All rights reserved.
//

#import "ImageResizer.h"

@implementation ImageResizer

-(UIImage*)resizeImage:(UIImage*)image toSize:(CGFloat)size
{
    //I may be getting an image that has width bigger than height
    CGFloat width=image.size.width;
    CGFloat height=image.size.height;
    
    if (width>height)
    {
        //we need to change dimensions appropriately to keep the aspect ratio
        
        CGImageRef cropped=CGImageCreateWithImageInRect([image CGImage], CGRectMake((0+width/2-height/2), 0, height, height));
        UIImage *croppedImage=[UIImage imageWithCGImage:cropped];
        
        CGSize newSize=CGSizeMake(size, size);
        //nslog(@"newSize w=%f, newSize h=%f", newSize.height, newSize.width);
        UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
        [croppedImage drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
        UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
        
    }
    else if (height>width)
    {
        
        CGImageRef cropped=CGImageCreateWithImageInRect([image CGImage], CGRectMake((0+height/2-width/2), 0, width, width));
        UIImage *croppedImage=[UIImage imageWithCGImage:cropped];
        
        CGSize newSize=CGSizeMake(size, size);
        //nslog(@"newSize w=%f, newSize h=%f", newSize.height, newSize.width);
        UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
        [croppedImage drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
        UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
    }
    else if (height==width)
    {
        CGSize newSize=CGSizeMake(size, size);
        //nslog(@"newSize w=%f, newSize h=%f", newSize.height, newSize.width);
        UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
        [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
        UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
    }
}

@end
