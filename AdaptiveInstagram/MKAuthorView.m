//
//  MKAuthorView.m
//  AdaptiveInstagram
//
//  Created by Michael Koukoullis on 26/01/2015.
//  Copyright (c) 2015 Michael Koukoullis. All rights reserved.
//

#import "MKAuthorView.h"
#import <Masonry/Masonry.h>

@interface MKAuthorView ()
@property BOOL didSetConstraints;
@property UIImageView *imageView;
@property UILabel *nameLabel;
@property UILabel *dateLabel;
@end

@implementation MKAuthorView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mike"]];
        [self.imageView.layer setCornerRadius:20];
        [self.imageView.layer setMasksToBounds:YES];
        [self.imageView.layer setBorderWidth:0];

        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.nameLabel setText:@"mike"];
        [self.nameLabel setFont:[UIFont boldSystemFontOfSize:14]];
        [self.nameLabel setTextColor:[UIColor colorWithRed:0.157 green:0.294 blue:0.427 alpha:1]];
        
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.dateLabel setText:@"4h ago"];
        [self.dateLabel setFont:[UIFont boldSystemFontOfSize:14]];
        [self.dateLabel setTextColor:[UIColor grayColor]];
        
        [self addSubview:self.imageView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.dateLabel];
    }
    
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetConstraints) {
        
        self.didSetConstraints = YES;
        
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(40.0, 40.0));
            make.centerY.equalTo(self);
            make.left.equalTo(self).with.offset(5);
        }];
        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView);
            make.left.equalTo(self.imageView.mas_right).with.offset(5);
        }];
        
        [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.imageView);
            make.left.equalTo(self.imageView.mas_right).with.offset(5);
        }];
    }
    
    [super updateConstraints];
}

@end
