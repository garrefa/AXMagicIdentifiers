//
//  UIPageControlSpec.m
//  AXMagicIdentifiers
//
//  Created by Alexandre Garrefa on 5/17/15.
//  Copyright 2015 Alexandre Garrefa. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <AXMagicIdentifiers.h>


SPEC_BEGIN(UIPageControlSpec)

describe(@"UIPageControl with MagicId Category", ^{
    
    __block UIViewController *_vc;
    __block UIPageControl *_pgControl01;
    __block UIPageControl *_pgControl02;
    
    beforeEach(^{
        
        _pgControl01 = [[UIPageControl alloc] init];
        _pgControl02 = [[UIPageControl alloc] init];
        
        _vc = [[UIViewController alloc] init];
        [_vc.view addSubview:_pgControl01];
        [_vc.view addSubview:_pgControl02];
        [_vc ax_addAccId];
    });
    
    context(@"UIPageControl", ^{
        
        it(@"should have accessibility identifier", ^{
            
            [[_pgControl01.accessibilityIdentifier shouldNot] beNil];
            [[_pgControl01.accessibilityIdentifier should] equal:@"AX_UIViewController_PAGEC_1"];
            
            [[_pgControl02.accessibilityIdentifier shouldNot] beNil];
            [[_pgControl02.accessibilityIdentifier should] equal:@"AX_UIViewController_PAGEC_2"];
        });
        
        it(@"should not set accessibility identifier if already set outside MagicId", ^{
            
            UIPageControl *aPgControl = [[UIPageControl alloc] init];
            aPgControl.accessibilityIdentifier = @"ANY_ACCESSIBILITY_IDENTIFIER";
            [_vc.view addSubview:aPgControl];
            [_vc ax_addAccId];
            [[aPgControl.accessibilityIdentifier should] equal:@"ANY_ACCESSIBILITY_IDENTIFIER"];
        });
    });
    
});

SPEC_END
