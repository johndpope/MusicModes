//
//  AMModeDetailVC.h
//  AncientModes
//
//  Created by Vladimir Mollov on 2/24/14.
//  Copyright (c) 2014 Vladimir Mollov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMScale.h"

@interface AMModeDetailVC : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lbTest;

@property NSString *modeName;
@property AMScale *scale;

@end
