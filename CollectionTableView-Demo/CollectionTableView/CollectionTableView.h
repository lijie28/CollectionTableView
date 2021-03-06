//
//  CollectionTableView.h
//  CollectionTableView-Demo
//
//  Created by 李杰 on 2017/4/1.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol CollectionTableViewDelegate <UITableViewDelegate>

- (NSUInteger )numberOfCollectionViewCellInTableViewCell;

@end


@interface CollectionTableView : UITableView

@property (nonatomic, weak) id<CollectionTableViewDelegate> delegate;

@end
