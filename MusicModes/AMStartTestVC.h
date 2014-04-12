//
//  AMStartTestVC.h
//  AncientModes
//
//  Created by Vladimir Mollov on 3/1/14.
//  Copyright (c) 2014 Vladimir Mollov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface AMStartTestVC : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet UIPickerView *pkrNumQuestions;
@property (strong, nonatomic) IBOutlet UIImageView *imgBackground;

@end
