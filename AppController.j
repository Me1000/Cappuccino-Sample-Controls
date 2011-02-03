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

    var label = [CPTextField labelWithTitle:"Buttons"];
    [label setFrameOrigin:CGPointMake(55, 20)];
    [view addSubview:label]

    var button = [[CPButton alloc] initWithFrame:CGRectMake(15, 40, 120, 24)];
    [button setTitle:"Standard Button"];
    [view addSubview:button];

    var button = [[CPButton alloc] initWithFrame:CGRectMake(15, 75, 120, 24)];
    [button setTitle:"Round Button"];
    [button setThemeState:CPButtonStateBezelStyleRounded];
    [view addSubview:button];

    var button = [[CPButton alloc] initWithFrame:CGRectMake(15, 110, 120, 24)];
    [button setTitle:"Default Button"];
    [button setKeyEquivalent:CPCarriageReturnCharacter];
    [view addSubview:button];

    var button = [CPCheckBox checkBoxWithTitle:"Checkbox"];
    [button setFrameOrigin:CGPointMake(15, 145)];
    [button setAllowsMixedState:YES];
    [view addSubview:button];

    var button = [CPRadio radioWithTitle:"Radio"];
    [button setFrameOrigin:CGPointMake(15, 170)];
    [view addSubview:button];

    var button = [[CPPopUpButton alloc] initWithFrame:CGRectMake(15, 195, 120, 24) pullsDown:NO];
    [button addItemsWithTitles:["Popup Button", "Item 2", "Item 3"]];
    [view addSubview:button];

    var button = [[CPPopUpButton alloc] initWithFrame:CGRectMake(15, 235, 120, 24) pullsDown:YES];
    [button addItemsWithTitles:["Pulldown Button", "Item 2", "Item 3"]];
    [view addSubview:button];


    /*
        Text
    */
    var label = [CPTextField labelWithTitle:"Textfields"];
    [label setFrameOrigin:CGPointMake(220, 20)];
    [view addSubview:label];

    var text = [[CPTextField alloc] initWithFrame:CGRectMake(190, 40, 120, 28)];
    [text setStringValue:"Standard Text"];
    [text setEditable:YES];
    [text setBezeled:YES];
    [view addSubview:text];

    var text = [[CPTextField alloc] initWithFrame:CGRectMake(190, 75, 120, 28)];
    [text setPlaceholderString:"Placeholder Text"];
    [text setEditable:YES];
    [text setBezeled:YES];
    [view addSubview:text];

    var text = [[CPTextField alloc] initWithFrame:CGRectMake(190, 105, 120, 30)];
    [text setPlaceholderString:"Rounded Text"];
    [text setEditable:YES];
    [text setBezeled:YES];
    [text setBezelStyle:CPTextFieldRoundedBezel];
    [view addSubview:text];

    var text = [[CPTextField alloc] initWithFrame:CGRectMake(190, 142, 120, 30)];
    [text setStringValue:"Label"];
    [view addSubview:text];

    var text = [[CPSearchField alloc] initWithFrame:CGRectMake(190, 172, 120, 30)];
    [text setStringValue:"Search Field"];
    [view addSubview:text];


    /*
        Other
    */
    var label = [CPTextField labelWithTitle:"Other Controls"];
    [label setFrameOrigin:CGPointMake(380, 20)];
    [view addSubview:label];

    var control = [[CPSegmentedControl alloc] initWithFrame:CGRectMake(340, 40, 0, 24)];
    [control setSegmentCount:3];
    [control setWidth:50 forSegment:0];
    [control setWidth:50 forSegment:1];
    [control setWidth:50 forSegment:2];
    [control setLabel:"Seg 1" forSegment:0];
    [control setLabel:"Seg 2" forSegment:1];
    [control setLabel:"Seg 3" forSegment:2];
    [view addSubview:control];

    var control = [[CPSegmentedControl alloc] initWithFrame:CGRectMake(340, 75, 0, 24)];
    [control setSegmentCount:3];
    [control setWidth:50 forSegment:0];
    [control setWidth:50 forSegment:1];
    [control setWidth:50 forSegment:2];
    [control setLabel:"Seg 1" forSegment:0];
    [control setLabel:"Seg 2" forSegment:1];
    [control setLabel:"Seg 3" forSegment:2];
    [control setTrackingMode:CPSegmentSwitchTrackingSelectAny];
    [control setSelected:YES forSegment:0];
    [control setSelected:YES forSegment:2];
    [view addSubview:control];

    var control1 = [[CPSlider alloc] initWithFrame:CGRectMake(340, 100, 150, 24)];
    [control setFloatValue:25.0];
    
    [view addSubview:control1];

    var control2 = [[CPSlider alloc] initWithFrame:CGRectMake(340, 135, 24, 120)];
    [view addSubview:control2];

    // bind the two sliders
    [control1 setTarget:control2];
    [control1 setAction:@selector(takeFloatValueFrom:)];
    [control2 setTarget:control1];
    [control2 setAction:@selector(takeFloatValueFrom:)];

    var progress = [[CPProgressIndicator alloc] initWithFrame:CGRectMake(340, 265, 120, 15)];
    [view addSubview:progress];

    var callback = function(){
        var value = [progress doubleValue];

        if (this.increment && value >= 100)
            this.increment = NO;
        else if (!this.increment && value <= 0)
            this.increment = YES;

        [progress incrementBy:(this.increment) ? 1 : -1];
    }
    callback.increment = YES;

    var timer = [CPTimer scheduledTimerWithTimeInterval:.05 callback:callback repeats:YES];


    var control = [[CPProgressIndicator alloc] initWithFrame:CGRectMake(340, 295, 64, 64)];
    [control setStyle:CPProgressIndicatorSpinningStyle];
    [view addSubview:control];

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

/*@implementation ProgressbarAnimation : CPObject

@end*/