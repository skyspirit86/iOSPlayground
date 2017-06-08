//
//  CustomTableViewCell.h
//  PersonalPlayground
//
//  Created by Varga Zolt on 6/8/17.
//  Copyright © 2017 Varga Zolt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *emailLabel;
@property (strong, nonatomic) IBOutlet UILabel *idLabel;
@property (strong, nonatomic) IBOutlet UIImageView *profileImage;


@end
