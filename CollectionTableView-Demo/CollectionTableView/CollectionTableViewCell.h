//
//  CollectionTableViewCell.h
//  CollectionTableView-Demo
//
//  Created by 李杰 on 2017/4/1.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import <UIKit/UIKit.h>


@class CollectionItem;

@interface CollectionTableViewCell : UITableViewCell

- (void)confirmItem:( __kindof CollectionItem *)item;

@end
