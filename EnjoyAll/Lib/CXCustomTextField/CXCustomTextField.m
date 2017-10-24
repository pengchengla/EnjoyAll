//
//  RegisterTextField.m
//

#import "CXCustomTextField.h"

@implementation CXCustomTextField

// 控制默认文本的位置(placeholder)
- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    return CGRectMake(15, bounds.origin.y, bounds.size.width, bounds.size.height);
}

// 控制编辑文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectMake(15, bounds.origin.y, bounds.size.width, bounds.size.height);
}

// 控制显示文本的位置
- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectMake(15, bounds.origin.y, bounds.size.width, bounds.size.height);
}

//修改提示文字颜色
//- (void)setPlaceholder:(NSString *)placeholder {
//    
//    [super setPlaceholder:placeholder];
//    
//    self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:placeholder attributes:@{NSForegroundColorAttributeName:KLabelTextColor}];
//}

@end
