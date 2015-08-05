//
//  ViewController.m
//  iWeather
//
//  Created by hiepnq on 8/5/15.
//  Copyright (c) 2015 hiepnq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *CLabel;
@property (weak, nonatomic) IBOutlet UILabel *degree;
@property (weak, nonatomic) IBOutlet UILabel *FLabel;


@end

@implementation ViewController
{
    NSArray* locations;
    NSArray* photoFiles;
    NSArray* quotes;
    BOOL CMode;
    float tempValue;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    locations = @[@"Sydney, Australia", @"NewYork, USA"];
    photoFiles = @[@"rain", @"thunder", @"windy"];
    quotes = @[@"Di mot ngay dang hoc mot sang khon", @"Muon thanh cong thi phai tra gia"];
     CMode = true;
    
    [self setTemperature];
}
- (IBAction)updateWeather:(id)sender {
    int quoteIndex = arc4random_uniform(quotes.count);
    self.quote.text = quotes[quoteIndex];
    
    int photoIndex = arc4random_uniform(photoFiles.count);
    self.weatherIcon.image = [UIImage imageNamed:photoFiles[photoIndex]];
    
    int locationIndex = arc4random_uniform(locations.count);
    self.location.text = locations[locationIndex];
    NSString* string = [NSString stringWithFormat:@"%2.1f", [self getTemperature]];
    [self.temperature setTitle:string forState:UIControlStateNormal];
    
    [self setTemperature];
    
}
- (IBAction)convertTemperature:(id)sender {
    CMode = !CMode;
    if (CMode) {
        self.FLabel.hidden = true;
        self.CLabel.hidden = false;
        self.degree.hidden = false;
        tempValue = (tempValue -32) / 1.8;}
    else{
        self.FLabel.hidden = false;
        self.degree.hidden = true;
        self.CLabel.hidden = true;
        tempValue = (tempValue * 1.8) + 32;
    }
    NSString* string = [NSString stringWithFormat:@"%2.1f", tempValue];
    [self.temperature setTitle:string forState:UIControlStateNormal];
    
}

-(float) getTemperature{
    float temp = 14.0 + arc4random_uniform(18) + (float)arc4random()/(float)UINT32_MAX;
    if (CMode) {
        return temp;
    } else {
        return (temp * 1.8) + 32.0;
    }
}

-(void) setTemperature{
    tempValue = [self getTemperature];
    NSString* string = [NSString stringWithFormat:@"%2.1f", tempValue];
    [self.temperature setTitle:string forState:UIControlStateNormal];
}

@end
