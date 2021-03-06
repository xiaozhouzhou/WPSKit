//
// WPSCollectionViewCell.h
//
// Created by Kirby Turner.
// Copyright 2014 White Peak Software. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to permit
// persons to whom the Software is furnished to do so, subject to the
// following conditions:
//
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
// CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import <UIKit/UIKit.h>

/**
 A generic collection view cell providing additional functionality not found in `UICollectionViewCell`.
 */
@interface WPSCollectionViewCell : UICollectionViewCell

/**
 Returns a default cell identifier string.
 
 @returns A string.
 */
+ (NSString *)cellIdentifier;

/**
 Returns the `UINib` for the cell if available.
 
 @returns A `UINib`.
 */
+ (UINib *)nib;

/**
 Returns the default NIB name.
 
 @returns A string.
 */
+ (NSString *)nibName;

/**
 Register this class for use with the provided collection view.
 
 @param collectionView The collection view that will use this cell class.
 */
+ (void)registerClassWithCollectionView:(UICollectionView *)collectionView;

/**
 Register the nib for this class for use with the provided collection view.
 
 @param collectionView The collection view that will use this cell class.
 */
+ (void)registerNibWithCollectionView:(UICollectionView *)collectionView;

@end
