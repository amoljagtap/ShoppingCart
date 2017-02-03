//
//  CatalogWireFrame.m
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import "CatalogWireFrame.h"
#import "CatalogPresenter.h"
#import "CatalogInteractor.h"
#import "ProductManager.h"
#import "ServiceManager.h"
#import "CatalogViewController.h"
#import "ServiceManager.h"
#import "ProductsViewController.h"

@implementation CatalogWireFrame

+(void)configureView:(CatalogViewController *)view{

    CatalogPresenter *presenter = [[CatalogPresenter alloc] init];
    CatalogInteractor *interactor = [[CatalogInteractor alloc] init];
    CatalogWireFrame *wireframe = [[CatalogWireFrame alloc] init];
  
    view.presenter = presenter;
    presenter.view = view;
    presenter.interactor = interactor;
    presenter.wireframe = wireframe;
    interactor.presenter = presenter;
    ProductManager *manager = ProductManager.sharedInstance;
    interactor.productManager = manager;
    manager.delegate = ServiceManager.sharedInstance;
}

-(void)showProducts:(NSString *)category fromView:(id)view{
    if ([view isKindOfClass:[CatalogViewController class]]){
        ProductsViewController *destinationView = [[UIStoryboard storyboardWithName:@"Catalog" bundle:nil] instantiateViewControllerWithIdentifier:@"ProductsViewController"];
        [destinationView.presenter setCategory:category];
        CatalogViewController *sourceView = (CatalogViewController *)view;
        [sourceView.navigationController pushViewController:destinationView animated:true];
    }
    
    
}

@end
