/*
 * AppController.j
 * SampleControls
 *
 * Created by You on February 2, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>

var defaultViewRect;

@implementation AppController : CPObject
{
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView],
        frame = [contentView frame];

    var tabview = [[CPTabView alloc] initWithFrame:CGRectMake(15, 15, frame.size.width - 30, frame.size.height - 30)];


    defaultViewRect = CGRectMake(15, 15, frame.size.width - 60, frame.size.height - 90);

    var items = ["generalControls", "TableView", "OutlineView", "WindowsAndAlerts"];

    for (var i = 0, c = [items count]; i < c; i++)
    {
        var view = objj_msgSend(SampleControlTabs, items[i], nil);//[SampleControlTabs performSelector:items[i]];

        var tab = [[CPTabViewItem alloc] initWithIdentifier:items[i]];
        [tab setLabel:items[i]];
        [tab setView:view];

        [tabview addTabViewItem:tab];
    }

    [contentView addSubview:tabview];


    [theWindow orderFront:self];

    // Uncomment the following line to turn on the standard menu bar.
    [CPMenu setMenuBarVisible:YES];
}

@end


/*!
    This class contains class methods which returns a view that will be contained in the tab view

*/
@implementation SampleControlTabs : CPObject

+ (CPView)generalControls
{
    var view = [[CPView alloc] initWithFrame:defaultViewRect];

    var button = [[CPButton alloc] initWithFrame:CGRectMake(15, 15, 100, 24)];
    [view addSubview:button];

    return view;

}

+ (CPView)TableView
{
    var view = [[CPView alloc] initWithFrame:defaultViewRect];

    /*
        Regular selection style
    */
    var scroll = [[CPScrollView alloc] initWithFrame:CGRectMake(15, 25, CGRectGetWidth(defaultViewRect)/2 - 50, CGRectGetHeight(defaultViewRect))];
    [scroll setBorderType:CPLineBorder];
    [view addSubview:scroll];

    var table = [[CPTableView alloc] initWithFrame:CGRectMakeZero()],
        columnCount = 3;

    //add image column
    var column = [[CPTableColumn alloc] initWithIdentifier:"Image"],
        imageView = [[CPImageView alloc] initWithFrame:CGRectMakeZero()];

    [[column headerView] setStringValue:"Image"];

    [imageView setImageScaling:CPScaleNone];
    [column setDataView:imageView];
    [table addTableColumn:column];


    while (columnCount--)
    {
        var name = "Column " + ABS(columnCount - 3),
            column = [[CPTableColumn alloc] initWithIdentifier:name];

        [[column headerView] setStringValue:name];

        [table addTableColumn:column];
    }

    [table setDataSource:[[TableViewDataSource alloc] init]];
    [scroll setDocumentView:table];


    /*!
        Source List selection style
    */
    var scroll = [[CPScrollView alloc] initWithFrame:CGRectMake(CGRectGetMaxX([scroll frame]) + 25, 25, CGRectGetWidth(defaultViewRect)/2 - 50, CGRectGetHeight(defaultViewRect))];
    [scroll setBorderType:CPLineBorder];
    [view addSubview:scroll];

    var table = [[CPTableView alloc] initWithFrame:CGRectMakeZero()],
        columnCount = 3;
    //add image column
    var column = [[CPTableColumn alloc] initWithIdentifier:"Image"],
        imageView = [[CPImageView alloc] initWithFrame:CGRectMakeZero()];

    [[column headerView] setStringValue:"Image"];

    [imageView setImageScaling:CPScaleNone];
    [column setDataView:imageView];
    [table addTableColumn:column];

    while (columnCount--)
    {
        var name = "Column " + ABS(columnCount - 3),
            column = [[CPTableColumn alloc] initWithIdentifier:name];

        [[column headerView] setStringValue:name];

        [table addTableColumn:column];
    }

    [table setDataSource:[[TableViewDataSource alloc] init]];
    [table setSelectionHighlightStyle:CPTableViewSelectionHighlightStyleSourceList];
    [scroll setDocumentView:table];

    return view;

}

+ (CPView)OutlineView
{
    var view = [[CPView alloc] initWithFrame:defaultViewRect];

    var button = [[CPButton alloc] initWithFrame:CGRectMake(15, 15, 100, 24)];
    [view addSubview:button];

    return view;

}

+ (CPView)WindowsAndAlerts
{
    var view = [[CPView alloc] initWithFrame:defaultViewRect];

    var button = [[CPButton alloc] initWithFrame:CGRectMake(15, 15, 100, 24)];
    [view addSubview:button];

    return view;

}

@end




@implementation TableViewDataSource : CPObject
{
    CPArray data;
}

- (id)init
{
    self = [super init];

    data = [ ];
    var c = 500;

    while (c--)
        [data addObject:c];

    return self;
}

- (int)numberOfRowsInTableView:(CPTableView)aTable
{
    return [data count];
}

- (id)tableView:(CPTableView)aTable objectValueForTableColumn:(CPTableColumn)aCol row:(int)aRow
{
    if ([aCol identifier] === "Image")
        return [[CPImage alloc] initWithContentsOfFile:"http://cappuccino.org/images/favicon.png" size:CGSizeMake(16,16)];
    return [aCol identifier] + " - " + data[aRow];
}
@end