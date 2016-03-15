//
//  UIButton+ESTabBar.m
//  Pods
//
//  Created by Ezequiel Scaruli on 5/5/15.
//
//

#import "UIButton+ESTabBar.h"


@implementation UIButton (ESTabBar)


#pragma mark - Public methods


- (void)customizeForTabBarWithImage:(UIImage *)image
                      selectedColor:(UIColor *)selectedColor
                        highlighted:(BOOL)highlighted {
    if (highlighted) {
        [self customizeAsHighlightedButtonForTabBarWithImage:image
                                               selectedColor:selectedColor];
    } else {
        [self customizeAsNormalButtonForTabBarWithImage:image
                                          selectedColor:selectedColor];
    }
}
- (void)customizeForTabBarWithImage:(UIImage *)image
                      selectedColor:(UIColor *)selectedColor
                        highlighted:(BOOL)highlighted WithTitle:(NSString *)title{
    if (highlighted) {
        [self customizeAsHighlightedButtonForTabBarWithImage:image
                                               selectedColor:selectedColor];
    } else {
        [self customizeAsNormalButtonForTabBarWithImage:image
                                          selectedColor:selectedColor AndTitle:title];
    }
}

#pragma mark - Private methods


- (void)customizeAsHighlightedButtonForTabBarWithImage:(UIImage *)image
                                         selectedColor:(UIColor *)selectedColor {
    
    // We want the image to be always white in highlighted state.
    self.tintColor = [UIColor whiteColor];
    [self setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]
          forState:UIControlStateNormal];
    
    // And its background color should always be the selected color.
    self.backgroundColor = selectedColor;
    
}


- (void)customizeAsNormalButtonForTabBarWithImage:(UIImage *)image
                                    selectedColor:(UIColor *)selectedColor {
    
    
    
    // The tint color is the one used for selected state.
    self.tintColor = selectedColor;
    
    // When the button is not selected, we show the image always with its
    // original color.
    [self setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
          forState:UIControlStateNormal];
    
    // When the button is selected, we apply the tint color using the
    // always template mode.
    [self setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]
          forState:UIControlStateSelected];
    
    
    // We don't want a background color to use the one in the tab bar.
    self.backgroundColor = [UIColor clearColor];
    
}
- (void)customizeAsNormalButtonForTabBarWithImage:(UIImage *)image
                                    selectedColor:(UIColor *)selectedColor AndTitle:(NSString *)title{
    
    
    
    // The tint color is the one used for selected state.
    self.tintColor = selectedColor;
    
    // When the button is not selected, we show the image always with its
    // original color.
    [self setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
          forState:UIControlStateNormal];
    
    // When the button is selected, we apply the tint color using the
    // always template mode.
    [self setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]
          forState:UIControlStateSelected];
    
    
    [self setTitle:title forState:UIControlStateNormal];
    
    
    [self setTitle:title forState:UIControlStateSelected];
    
    self.titleLabel.font = [UIFont fontWithName:@"GE SS Two" size:10];
    
    // We don't want a background color to use the one in the tab bar.
    self.backgroundColor = [UIColor clearColor];
    
    
    
    
    [self setEdgeInsects];
}
-(void)setEdgeInsects {
    // the space between the image and text
    CGFloat spacing = 1.0;
    
    // lower the text and push it left so it appears centered
    //  below the image
    CGSize imageSize = self.imageView.image.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(
                                              0.0, - imageSize.width, - (imageSize.height + spacing), 0.0);
    
    // raise the image and push it right so it appears centered
    //  above the text
    CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    self.imageEdgeInsets = UIEdgeInsetsMake(
                                              - (titleSize.height + spacing), 0.0, 0.0, - titleSize.width);


}

@end
