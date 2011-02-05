/*
 * AppController.j
 * SampleControls
 *
 * Created by You on February 2, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>

var defaultViewRect;
var dataStructure = {name: "Root", sub: [
                                         {name: "Music", sub: ["file1.mp3", {name: "Daft Punk", sub: ["Digital Love", "One More Time", "High Life", "Veridis Quo"]}, "AwesomeSong.mp3", "AnotherAwesomeSong.mp3"]},
                                         {name: "Pictures", sub: ["Picture1.jpg", "Picture2.jpg", "Picture3.jpg", "Picture4.jpg"]},
                                         {name: "Code", sub: [
                                                                {name: "SampleControls", sub: ["Item two", "Item three", "Item four"]},
                                                                {name: "Cappuccino", sub: [{name: "AppKit", sub: ["AppKit.j", {name: "Resources", sub: ["Image.png", "AboutPanel.cib", "Window.png", "Arist.psd"]}, "CPBrowser.j", "CPTableView.j", "CPButton.j"]}, "Foundation.j", "CPTableView.j", "Jakefile"]},
                                                                {name: "280Slides", sub: ["SlideController.j", "YouTubeController.j", "logo.png", "Side.j"]},
                                                                {name: "Atlas", sub: ["AwesomeController.j", "Icon.png", "Jakefile", "Server.js"]}
                                                             ]
                                         },
                                         {name: "System", sub: [{name: "Library", sub: ["SpecialFile", "AnotherFile", "SecretStuff", "Scarry Stuff"]}]},
                                         {name: "Applications", sub: ["XCode.app", "Atlas.app", "Kaleidoscope.app", "Issues.app"]},
                                       ]
                   };

@implementation AppController : CPObject
{
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView],
        frame = [contentView frame];

    var tabview = [[CPTabView alloc] initWithFrame:CGRectMake(15, 15, frame.size.width - 30, frame.size.height - 30)];
    [tabview setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];


    defaultViewRect = CGRectMake(15, 15, frame.size.width - 60, frame.size.height - 90);

    var items = ["generalControls", "TableView", "OutlineView", "Browser", "WindowsAndAlerts"];

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

    var control3 = [[CPSlider alloc] initWithFrame:CGRectMake(385, 150, 32,32)];
    [control3 setSliderType:CPCircularSlider];
    [view addSubview:control3];

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


    /*
        Token
    */
    var label = [CPTextField labelWithTitle:"More Awesome Stuff"];
    [label setFrameOrigin:CGPointMake(535, 20)];
    [view addSubview:label];

    var control = [[CPTokenField alloc] initWithFrame:CGRectMake(535, 40, 200, 100)];
    [control setObjectValue:["token", "field"]];
    [control setEditable:YES];
    [control setDelegate:[TokenFieldDelegate new]];
    [control setCompletionDelay:0];
    [view addSubview:control];


    var text = [[CPTextField alloc] initWithFrame:CGRectMake(535, 150, 200, 31)];
    [text setBezeled:YES];
    [text setVerticalAlignment:CPCenterVerticalTextAlignment];
    [text setStringValue:"0"];
    [view addSubview:text];

    var control = [[CPStepper alloc] initWithFrame:CGRectMake(712, 153, 19, 26)];
    [control setTarget:text];
    [control setAction:@selector(takeIntValueFrom:)];
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
    [table setUsesAlternatingRowBackgroundColors:YES];
    [table registerForDraggedTypes:["testType"]];

    while (columnCount--)
    {
        var name = "Column " + ABS(columnCount - 3),
            column = [[CPTableColumn alloc] initWithIdentifier:name];

        [[column headerView] setStringValue:name];
        [column setEditable:YES];

        if (columnCount === 2)
            var desc = [CPSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
        else
            var desc = [CPSortDescriptor sortDescriptorWithKey:@"col"+columnCount ascending:YES];

        [column setSortDescriptorPrototype:desc];
        [table addTableColumn:column];
    }

    var dataSourceAndDelegate = [[TableViewDataSource alloc] init];
    [table setDataSource:dataSourceAndDelegate];
    [table setDelegate:dataSourceAndDelegate];
    [table setAllowsMultipleSelection:YES];
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
    [table registerForDraggedTypes:["testType"]];
    [scroll setDocumentView:table];

    return view;

}

+ (CPView)OutlineView
{
    var view = [[CPView alloc] initWithFrame:defaultViewRect];

    var scroll = [[CPScrollView alloc] initWithFrame:CGRectMake(15, 20, 600, 400)],
        ov = [[CPOutlineView alloc] initWithFrame:CGRectMakeZero()],
        col = [[CPTableColumn alloc] initWithIdentifier:"ovcol"];

    [[col headerView] setStringValue:"Outline Column"];

    var dataDelegate = [[OutlineViewDataSourceDelegate alloc] init];
    [dataDelegate setOv:ov];
    [ov setDataSource:dataDelegate];
    [ov setDelegate:dataDelegate];


    [col setWidth:215];
    [ov addTableColumn:col];

    var col2 = [[CPTableColumn alloc] initWithIdentifier:"Column 2"]
    [[col2 headerView] setStringValue:"Column 2"];
    [ov addTableColumn:col2];

    [scroll setDocumentView:ov];
    [view addSubview:scroll];

    return view;

}

+ (CPView)Browser
{
    var view = [[CPView alloc] initWithFrame:defaultViewRect];

    var box = [[CPBox alloc] initWithFrame:CGRectMake(15, 40, 650, 200)];

    var browser = [[CPBrowser alloc] initWithFrame:CGRectMake(1, 1, 648, 198)];
    [browser setDelegate:[[BrowserDelegate alloc] init]];
    [browser setBackgroundColor:[CPColor whiteColor]];
    [browser setMinColumnWidth:170];
    [browser setAllowsMultipleSelection:NO];
    [box addSubview:browser];
    [view addSubview:box];

    return view;
}

+ (CPView)WindowsAndAlerts
{
    var view = [[CPView alloc] initWithFrame:defaultViewRect];

    var window = [[CPWindow alloc] initWithContentRect:CGRectMake(100, 100, 400, 400) styleMask:CPClosableWindowMask|CPResizableWindowMask];
    [window setTitle:"Sample Window"];
    [window setMinSize:CGSizeMake(100,100)];

    var button = [[CPButton alloc] initWithFrame:CGRectMake(15, 20, 100, 24)];
    [button setTitle:"CPWindow"];
    [button setTarget:window];
    [button setAction:@selector(orderFront:)];
    [view addSubview:button];


    // platofrm windows
    var platformWindow = [[CPPlatformWindow alloc] initWithContentRect:CGRectMake(100,100,775,400)],
        window = [[CPWindow alloc] initWithContentRect:CGRectMake(100, 100, 775, 400) styleMask:CPClosableWindowMask|CPResizableWindowMask];

    [window setTitle:"Sample Window"];
    [window setMinSize:CGSizeMake(100,100)];

    [window setFullBridge:YES];
    [window setPlatformWindow:platformWindow];

    [window setContentView:[self generalControls]];

    var button = [[CPButton alloc] initWithFrame:CGRectMake(130, 20, 100, 24)];
    [button setTitle:"CPPlatformWindow"];
    [button setTarget:window];
    [button setAction:@selector(orderFront:)];
    [view addSubview:button];


    // info alert
    var alrt = [[CPAlert alloc] init];
    [alrt setTitle:"Informational Alert"];
    [alrt setMessageText:"Informational Alert"];
    [alrt setInformativeText:"This CPAlert is used to display information modally. It can have a help button and an accessory view, and a supression button."];
    [alrt setShowsHelp:YES];
    [alrt setShowsSuppressionButton:YES];
    [alrt setAlertStyle:CPInformationalAlertStyle];
    [alrt addButtonWithTitle:"Okay"];

    var button = [[CPButton alloc] initWithFrame:CGRectMake(245, 20, 100, 24)];
    [button setTitle:"Info CPAlert"];
    [button setTarget:alrt];
    [button setAction:@selector(runModal)];
    [view addSubview:button];


    // Warn alert
    var alrt = [[CPAlert alloc] init];
    [alrt setTitle:"Warning Alert"];
    [alrt setMessageText:"Warning Alert"];
    [alrt setInformativeText:"This CPAlert is used to display warnings modally. It can have a help button and an accessory view, and a supression button."];
    [alrt setShowsHelp:YES];
    [alrt setShowsSuppressionButton:YES];
    [alrt setAlertStyle:CPWarningAlertStyle];
    [alrt addButtonWithTitle:"Okay"];

    var button = [[CPButton alloc] initWithFrame:CGRectMake(370, 20, 100, 24)];
    [button setTitle:"Warn CPAlert"];
    [button setTarget:alrt];
    [button setAction:@selector(runModal)];
    [view addSubview:button];

    // ERROR alert
    var alrt = [[CPAlert alloc] init];
    [alrt setTitle:"Error Alert"];
    [alrt setMessageText:"Error Alert"];
    [alrt setInformativeText:"This CPAlert is used to display errors modally. It can have a help button and an accessory view, and a supression button."];
    [alrt setShowsHelp:YES];
    [alrt setShowsSuppressionButton:YES];
    [alrt setAlertStyle:CPCriticalAlertStyle];
    [alrt addButtonWithTitle:"Okay"];

    var button = [[CPButton alloc] initWithFrame:CGRectMake(495, 20, 100, 24)];
    [button setTitle:"Error CPAlert"];
    [button setTarget:alrt];
    [button setAction:@selector(runModal)];
    [view addSubview:button];


    // SHEETS
    var alrt = [[CPAlert alloc] init];
    [alrt setTitle:"Informational Alert"];
    [alrt setMessageText:"Informational Alert"];
    [alrt setInformativeText:"CPAlerts can also be used as sheets! With the same options as before."];
    [alrt setShowsHelp:YES];
    [alrt setShowsSuppressionButton:YES];
    [alrt setAlertStyle:CPInformationalAlertStyle];
    [alrt addButtonWithTitle:"Okay"];

    var controller = [[SheetController alloc] init];
    [controller setSheet:alrt];

    var button = [[CPButton alloc] initWithFrame:CGRectMake(15, 59, 100, 24)];
    [button setTitle:"Attached Sheet"];
    [button setTarget:controller];
    [button setAction:@selector(beginSheet:)];
    [view addSubview:button];

    // color panel
    var button = [[CPButton alloc] initWithFrame:CGRectMake(130, 59, 100, 24)];
    [button setTitle:"Color Panel"];
    [view addSubview:button];
    var picker = [CPColorPanel sharedColorPanel];
    [button setTarget:picker];
    [button setAction:@selector(orderFront:)];

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
    else if ([aCol identifier] === "Column 1")
        return "Row " + data[aRow];
    else
        return [aCol identifier];
}

- (BOOL)tableView:(CPTableView)aTable isGroupRow:(int)aRow
{
    return data[aRow] % 10 === 0;
}

- (BOOL)tableView:(CPTableView)aTableView writeRowsWithIndexes:(CPIndexSet)rowIndexes toPasteboard:(CPPasteboard)pboard
{
    [pboard declareTypes:[CPArray arrayWithObject:"testType"] owner:self];

    return YES;
}

- (CPDragOperation)tableView:(CPTableView)aTableView
                   validateDrop:(id)info
                   proposedRow:(CPInteger)row
                   proposedDropOperation:(CPTableViewDropOperation)operation
{
/*    if (aTableView === tableView)
        [aTableView setDropRow:row dropOperation:CPTableViewDropOn];
    else
        [aTableView setDropRow:row dropOperation:CPTableViewDropAbove];
*/
    return CPDragOperationMove;
}

- (BOOL)tableView:(CPTableView)aTableView acceptDrop:(id)info row:(int)row dropOperation:(CPTableViewDropOperation)operation
{
    var alrt = [[CPAlert alloc] init];

    [alrt setTitle:"Cool Features"];
    [alrt setMessageText:"No reordering implemented"];
    [alrt setInformativeText:"Since this is just a demo we haven't actually implement the drop behavior here."];
    [alrt setAlertStyle:CPInformationalAlertStyle];
    [alrt addButtonWithTitle:"Okay"];

    [alrt runModal];

    return NO;
}


- (void)tableView:(CPTableView)aTableView setObjectValue:(id)aValue forTableColumn:(CPTableColumn)tableColumn row:(int)row
{
    data[row] = aValue;
}

- (void)tableView:(CPTableView)aTableView sortDescriptorsDidChange:(CPArray)oldDescriptors
{
    var newDescriptors = [aTableView sortDescriptors];
    [data sortUsingDescriptors:newDescriptors];
    [aTableView reloadData];
}

@end

@implementation TokenFieldDelegate : CPObject
{
    CPArray states;
}

- (id)init
{
    self = [super init];

    states = ["Alabama", "Alaska", "American Samoa", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia", "Guam", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Northern Marianas Islands", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Puerto Rico", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Virgin Islands", "Washington", "West Virginia", "Wisconsin", "Wyoming"];

    return self;
}

- (CPArray)tokenField:(CPTokenField)aTokenField completionsForSubstring:(CPString)aString indexOfToken:(int)anIndex indexOfSelectedItem:(int)selectedIndex
{
    if (aString)
    {
        var matches = [],
            search = [aString lowercaseString];

        for (var i = 0, c = states.length; i < c; i++)
        {
            var state = [states[i] lowercaseString];
            if ([state hasPrefix:search])
                [matches addObject:states[i]];
        }

        return matches
    }
    else
        return [];
}
@end

@implementation BrowserDelegate : CPObject

- (id)rootItemForBrowser:(CPBrowser)browser
{
    return dataStructure;    
}
 
- (int)browser:(CPBrowser)browser numberOfChildrenOfItem:(id)item
{
    return item.sub.length;
}
 
- (id)browser:(CPBrowser)browser child:(int)index ofItem:(id)item
{
    return [item.sub objectAtIndex:index];
}
 
- (BOOL)browser:(CPBrowser)browser isLeafItem:(id)item
{
    return item.sub.length === 0;
}
 
- (id)browser:(CPBrowser)browser objectValueForItem:(id)item
{
    return item.name || item;
}
@end

@implementation OutlineViewDataSourceDelegate : CPObject
{
    id rootItem;
    CPOutlineView ov @accessors;
}

- (id)init
{
    self = [super init];

    var path      = [[CPBundle mainBundle] pathForResource:@"InitInfo.dict"],
        request   = [CPURLRequest requestWithURL:path],
        connection = [CPURLConnection connectionWithRequest:request delegate:self];

    rootItem = nil;

    return self;
}


- (void)connection:(CPURLConnection)connection didReceiveData:(CPString)dataString
{
    if (!dataString)
        return;

    var data = [[CPData alloc] initWithRawString:dataString],
        rootItem = [CPPropertyListSerialization propertyListFromData:data format:CPPropertyListXMLFormat_v1_0];

    [ov reloadData];
}

- (int)outlineView:(CPOutlineView)theOutlineView numberOfChildrenOfItem:(id)theItem
{
    if (theItem == nil)
        theItem = rootItem;

    if ([theItem isKindOfClass:[CPString class]])
        return 0;

    return [[theItem objectForKey:"Children"] count];
}

- (id)outlineView:(CPOutlineView)theOutlineView child:(int)theIndex ofItem:(id)theItem
{
    if (theItem == nil)
        theItem = rootItem;

    return [[theItem objectForKey:"Children"] objectAtIndex:theIndex];
}

- (BOOL)outlineView:(CPOutlineView)theOutlineView isItemExpandable:(id)theItem
{
    if (theItem == nil)
        theItem = rootItem;

    return ![theItem isKindOfClass:[CPString class]];
}

- (id)outlineView:(CPOutlineView)anOutlineView objectValueForTableColumn:(CPTableColumn)theColumn byItem:(id)theItem
{
    if ([theItem isKindOfClass:[CPString class]])
        return theItem;

    return [theItem objectForKey:"Name"];
}

- (BOOL)outlineView:(CPOutlineView)anOutlineView writeItems:(CPArray)theItems toPasteboard:(CPPasteBoard)thePasteBoard
{
    /*_draggedItems = theItems;
    [thePasteBoard declareTypes:[CustomOutlineViewDragType] owner:self];
    [thePasteBoard setData:[CPKeyedArchiver archivedDataWithRootObject:theItems] forType:CustomOutlineViewDragType];

    return YES;*/
}

- (CPDragOperation)outlineView:(CPOutlineView)anOutlineView validateDrop:(id < CPDraggingInfo >)theInfo proposedItem:(id)theItem proposedChildIndex:(int)theIndex
{
    /*CPLog.debug(@"validate item: %@ at index: %i", theItem, theIndex);

    if (theItem === nil)
        [anOutlineView setDropItem:nil dropChildIndex:theIndex];

    [anOutlineView setDropItem:theItem dropChildIndex:theIndex];

    return CPDragOperationEvery;*/
}

- (BOOL)outlineView:(CPOutlineView)outlineView acceptDrop:(id < CPDraggingInfo >)theInfo item:(id)theItem childIndex:(int)theIndex
{/*
    if (theItem === nil)
        theItem = [self menu];

    // CPLog.debug(@"drop item: %@ at index: %i", theItem, theIndex);

    var menuIndex = [_draggedItems count];

    while (menuIndex--)
    {
        var menu = [_draggedItems objectAtIndex:menuIndex];

        // CPLog.debug(@"move item: %@ to: %@ index: %@", menu, theItem, theIndex);

        if (menu === theItem)
            continue;

        [menu removeFromMenu];
        [theItem insertSubmenu:menu atIndex:theIndex];
        theIndex += 1;
    }

    return YES;*/
}
@end


/*!
    OV Node
*/
@implementation SimpleNodeData : CPObject
{
    CPString       name @accessors(property=name);
    CPImage       image @accessors(property=image);
    BOOL      container @accessors(property=container);
    BOOL     expandable @accessors(property=expandable);
    BOOL     selectable @accessors(property=selectable);
}

- (id)init
{
    self = [super init];
    name = @"Untitled";
    expandable = YES;
    selectable = YES;
    container = YES;

    return self;
}

- (id)initWithName:(CPString)aName
{
    self = [self init];
    name = aName;

    return self;
}

+ (SimpleNodeData)nodeDataWithName:(CPString)aName
{
    return [[SimpleNodeData alloc] initWithName:aName];
}

- (CPComparisonResult)compare:(id)anOther
{
    // We want the data to be sorted by name, so we compare [self name] to [other name]
    if ([anOther isKindOfClass:[SimpleNodeData class]])
        return [name compare:[anOther name]];

    return CPOrderedAscending;
}

- (CPString)description
{
    return [CPString stringWithFormat:@"%@ - '%@' expandable: %d, selectable: %d, container: %d", [super description], name, expandable, selectable, container];
}

@end

@implementation SheetController : CPObject
{
    CPAlert sheet @accessors;
}

- (void)beginSheet:(id)sender
{
    [sheet beginSheetModalForWindow:[CPApp mainWindow]];
    //[CPApp beginSheet:sheet modalForWindow:[CPApp mainWindow] modalDelegate:self didEndSelector:@selector(didEndSheet:returnCode:contextInfo:) contextInfo:nil];
}

- (void)didEndSheet:(CPWindow)aSheet returnCode:(int)returnCode contextInfo:(id)contextInfo
{
   
}
@end