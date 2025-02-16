libname churn "/workspaces/myfolder/sas_viya_workbench/sas1/data/output";

data churn.customer_churn_abt;
    set churn2;
run;

/* Same thing in SQl */
proc sql;
    create table churn.customer_churn_abt
    as select * from churn2;
quit;

/* Add more data */
proc append base=churn.customer_churn_abt data=churn2;
run;

/* Export to CSV file */
proc export data=churn2 outfile="/workspaces/myfolder/sas_viya_workbench/sas1/data/output/customer_churn_abt.csv" dbms=csv replace;
run;

/* Upload to snowflake */
data cust.customer_churn_abt;
    set churn2;
run;

/* Upload to google cloud storage */
data gcs.customer_churn_abt;
    set churn2;
run;