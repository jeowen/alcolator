//
//  ViewController.m
//  alcolator v1.0
//
//  Created by Jason Owen on 1/23/16.
//  Copyright © 2016 Jason Owen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)textFieldDidChange:(UITextField *)sender {
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];
    if (enteredNumber == 0) {
        // The user typed 0, or something that's not a number, so clear the field
        sender.text = nil;
    }
}
- (IBAction)sliderValueDidChange:(UISlider *)sender {
    
    int numberOfBeers = self.beerCountSlider.value;
    self.navigationItem.title = [NSString stringWithFormat:@"Wine (%d Shots)",numberOfBeers];
    [self.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%d", (int) sender.value]];
    
//    NSLog(@"Slider value changed to %f", sender.value);
//    [self.beerPercentTextField resignFirstResponder];
//    // [self.drinkText setString:@"Wine"];
//    [self.beerPercentTextField resignFirstResponder];
//    // first, calculate how much alcohol is in all those beers...
//    int numberOfBeers = self.beerCountSlider.value;
//    int ouncesInOneBeerGlass = 12;  //assume they are 12oz beer bottles
//    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
//    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
//    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
//    // now, calculate the equivalent amount of wine...
//    NSLog(@"ounces of alcohol = %f", ouncesOfAlcoholTotal);
//    float ouncesInOneWineGlass = 5;  // wine glasses are usually 5oz
//    float alcoholPercentageOfWine = 0.13;  // 13% is average
//    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
//    float numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass;
//    // decide whether to use "beer"/"beers" and "glass"/"glasses"
//    // NSLog(@"numberOfWineGlasses = %f", numberOfWineGlassesForEquivalentAlcoholAmount);
//    
//
//    NSString *wineText;
//    if (numberOfWineGlassesForEquivalentAlcoholAmount == 1) {
//        wineText = NSLocalizedString(@"glass", @"singular glass");
//    } else {
//        wineText = NSLocalizedString(@"glasses", @"plural of glass");
//    }
//    // generate the result text, and display it on the  nav bar
//
//
//    NSString *numWineGlasses = [NSString stringWithFormat:@"%f", numberOfWineGlassesForEquivalentAlcoholAmount];
//    NSLog(@"numWineGlasses = %@", numWineGlasses);
//    
//    NSString *navText = [NSString stringWithFormat:@"Wine (%.1f %@)", numberOfWineGlassesForEquivalentAlcoholAmount, wineText];
//
//
//      NSLog(@"navText = %@", navText);
//    
//    
//    self.navigationItem.title = navText;
    
}
- (IBAction)buttonPressed:(id)sender {
    [self.beerPercentTextField resignFirstResponder];
    // first, calculate how much alcohol is in all those beers...
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;  //assume they are 12oz beer bottles
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    // now, calculate the equivalent amount of wine...
    float ouncesInOneWineGlass = 5;  // wine glasses are usually 5oz
    float alcoholPercentageOfWine = 0.13;  // 13% is average
    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass;
    // decide whether to use "beer"/"beers" and "glass"/"glasses"
    NSString *beerText;
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    NSString *wineText;
    if (numberOfWineGlassesForEquivalentAlcoholAmount == 1) {
        wineText = NSLocalizedString(@"glass", @"singular glass");
    } else {
        wineText = NSLocalizedString(@"glasses", @"plural of glass");
    }
    // generate the result text, and display it on the label
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of wine.", nil), numberOfBeers, beerText,  [self.beerPercentTextField.text floatValue], numberOfWineGlassesForEquivalentAlcoholAmount, wineText];
   
    self.resultLabel.text = resultText;
    
}
- (IBAction)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    [self.beerPercentTextField resignFirstResponder];
}

@end
