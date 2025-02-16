ods html5 style=Illuminate;
ods select Variables;
proc contents data=sashelp.cars;
run;

proc print data=sashelp.cars(obs=5);
run;

proc freq data=sashelp.cars order=freq;
    tables Make Origin EngineSize / plots=freq;
run;

proc means data=sashelp.cars mean;
    class Make;
    var MPG_City MPG_Highway;
run;