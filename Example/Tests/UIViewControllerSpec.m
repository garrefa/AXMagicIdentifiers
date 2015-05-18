//
//  UIViewControllerSpec.m
//  AXMagicIdentifiers
//
//  Created by Alexandre Garrefa on 5/17/15.
//  Copyright 2015 Alexandre Garrefa. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <AXMagicIdentifiers.h>


SPEC_BEGIN(UIViewControllerSpec)

describe(@"UIViewController", ^{

    __block UIViewController *_vc;
    
    beforeEach(^{
        
        _vc = [[UIViewController alloc] init];
        [_vc view];
        [_vc ax_addAccId];
    });
    
    context(@"UIViewController", ^{
        
        it(@"should have a view with accessibility identifier", ^{
            
            [[_vc shouldNot] beNil];
            [[_vc.view shouldNot] beNil];
            [[_vc.view.accessibilityIdentifier shouldNot] beNil];
        });
        
        it(@"should have accessibility identifier equal to AX_UIViewController_VIEW", ^{
            
            [[_vc.view.accessibilityIdentifier should] equal:@"AX_UIViewController_VIEW"];
        });
    });
    
    context(@"Adding Subviews", ^{
        
        __block UIView *_viewA;
        __block UIView *_viewB;
        __block UIView *_viewC;
        
        context(@"Adding three UIViews", ^{
            
            beforeAll(^{
                
                _viewA = [[UIView alloc]init];
                [_vc.view addSubview:_viewA];
                
                _viewB = [[UIView alloc]init];
                [_vc.view addSubview:_viewB];
                
                _viewC = [[UIView alloc]init];
                [_vc.view addSubview:_viewC];
                
                [_vc ax_addAccId];
            });
            
            it(@"should not have accessibility identifier set to these subviews", ^{
                
                NSArray *subviews = _vc.view.subviews;
                
                [[@(subviews.count) should] equal:@(3)];
                
                [[_viewA.accessibilityIdentifier should] beNil];
                [[_viewB.accessibilityIdentifier should] beNil];
                [[_viewC.accessibilityIdentifier should] beNil];
            });
        });
        
    });
});

SPEC_END
