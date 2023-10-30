BEGIN;


CREATE TABLE public."DimDate"
(
    "Dateid" integer NOT NULL,
    "Date" date,
    "Year" integer,
    "Quarter" integer,
    "Quartername" character varying,
    "Month" integer,
    "Monthname" character varying,
    "Day" integer,
    "Weekday" integer,
    "Weekdayname" character varying,
    PRIMARY KEY ("Dateid")
);

CREATE TABLE public."DimStation"
(
    "Stationid" integer NOT NULL,
    "City" character varying,
    PRIMARY KEY ("Stationid")
);

CREATE TABLE public."DimTruck"
(
    "Truckid" integer NOT NULL,
    "Trucktype" character varying,
    PRIMARY KEY ("Truckid")
);

CREATE TABLE public."FactTrips"
(
    "Tripid" integer NOT NULL,
    "Dateid" integer,
    "Stationid" integer,
    "Truckid" integer,
    "Wastecollected" numeric,
    PRIMARY KEY ("Tripid")
);

ALTER TABLE public."FactTrips"
    ADD FOREIGN KEY ("Dateid")
    REFERENCES public."DimDate" ("Dateid")
    NOT VALID;


ALTER TABLE public."FactTrips"
    ADD FOREIGN KEY ("Truckid")
    REFERENCES public."DimTruck" ("Truckid")
    NOT VALID;


ALTER TABLE public."FactTrips"
    ADD FOREIGN KEY ("Stationid")
    REFERENCES public."DimStation" ("Stationid")
    NOT VALID;

END;