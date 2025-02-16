
proc format ;
    value $ demhomeowner "U"="Unknown"
                        "H"="HomeOwner";
run;

data churn2 (rename=(DemHomeOwnerCode=DemHomeOwner));
    set churn1;
    /* Add customer age */
    customerAge=intck('YEAR', birthdate, today(),'C');
    /* Add additional measures */
    AvgPurchasePerAd12 = AvgPurchaseAmount12/intAdExposureCount12;
    /* Put a format on demhomeowner */
    format demHomeOwnerCode $demhomeowner. ;
run;

/* Same thing but with SQL */
proc sql;
    create table churn2(drop=DemHomeOwnerCode) as
    select *,
    intck('YEAR', birthdate, today(),'C'),
    DemHomeOwnerCode as DemHomeOwner format=$demHomeOwner.,
    AvgPurchaseAmount12/intAdExposureCount12 as AvgPurchasePerAd12
    from churn1;
quit;