/*
 * Jakefile
 * SampleControls
 *
 * Created by You on February 2, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

var ENV = require("system").env,
    FILE = require("file"),
    JAKE = require("jake"),
    task = JAKE.task,
    FileList = JAKE.FileList,
    app = require("cappuccino/jake").app,
    configuration = ENV["CONFIG"] || ENV["CONFIGURATION"] || ENV["c"] || "Debug",
    OS = require("os");

app ("SampleControls", function(task)
{
    task.setBuildIntermediatesPath(FILE.join("Build", "SampleControls.build", configuration));
    task.setBuildPath(FILE.join("Build", configuration));

    task.setProductName("SampleControls");
    task.setIdentifier("com.yourcompany.SampleControls");
    task.setVersion("1.0");
    task.setAuthor("Your Company");
    task.setEmail("feedback @nospam@ yourcompany.com");
    task.setSummary("SampleControls");
    task.setSources((new FileList("**/*.j")).exclude(FILE.join("Build", "**")));
    task.setResources(new FileList("Resources/**"));
    task.setIndexFilePath("index.html");
    task.setInfoPlistPath("Info.plist");

    if (configuration === "Debug")
        task.setCompilerFlags("-DDEBUG -g");
    else
        task.setCompilerFlags("-O");
});

function printResults(configuration)
{
    print("----------------------------");
    print(configuration+" app built at path: "+FILE.join("Build", configuration, "SampleControls"));
    print("----------------------------");
}

task ("default", ["SampleControls"], function()
{
    printResults(configuration);
});

task ("build", ["default"]);

task ("debug", function()
{
    ENV["CONFIGURATION"] = "Debug";
    JAKE.subjake(["."], "build", ENV);
});

task ("release", function()
{
    ENV["CONFIGURATION"] = "Release";
    JAKE.subjake(["."], "build", ENV);
});

task ("run", ["debug"], function()
{
    OS.system(["open", FILE.join("Build", "Debug", "SampleControls", "index.html")]);
});

task ("run-release", ["release"], function()
{
    OS.system(["open", FILE.join("Build", "Release", "SampleControls", "index.html")]);
});

task ("deploy", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Deployment", "SampleControls"));
    OS.system(["press", "-f", FILE.join("Build", "Release", "SampleControls"), FILE.join("Build", "Deployment", "SampleControls")]);
    printResults("Deployment")
});
