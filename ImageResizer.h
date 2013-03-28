//
//  ImageResizer.h
//  UIImageResizer
//
//  Created by Anton Pavlov on 3/28/13.
//  Copyright (c) 2013 Anton Pavlov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageResizer : NSObject

-(UIImage*)resizeImage:(UIImage*)image toSize:(CGFloat)size;

@end
