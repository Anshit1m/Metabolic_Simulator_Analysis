Create database Metabolic_Simulator;
use Metabolic_Simulator;

#CO2 Levels[average]
create view AVG_CO2_lvl as
SELECT AVG(CO2_ppm) FROM meta_sim;

#O2 Levels[average]
create view AVG_O2_lvl as
select avg(O2_percent) from meta_sim;

#Humidity Levels[average]
create view humidity_lvl as
select avg(Humidity_percent) from meta_sim;

#safe[co2 levels]
create view safe_co2_lvl as
select count(*) from meta_sim 
where CO2_ppm > 1000;

#safe[O2 levels]
create view safe_o2_lvl as
select count(*) from meta_sim 
where O2_percent < 20.0; 

#safe[Humidity levels]
create view safe_humidity_lvl as
SELECT COUNT(*) FROM meta_sim 
WHERE Humidity_percent > 70;

#Total Minutes in each matebolic state
create view minutes as
SELECT Metabolic_State, COUNT(*) FROM meta_sim 
GROUP BY Metabolic_State;

#Average CO2 levels per Matabolic state
create view AVG_CO2_lvl_pms as
select Metabolic_State,avg(CO2_ppm) from meta_sim
GROUP BY Metabolic_State;

#Average O2 levels per Metabolic_State
create view AVG_O2_lvl_pms as
select Metabolic_State,avg(O2_percent) from meta_sim
group by Metabolic_State;

#Average Humidity Levles per Metabolic_State
create view AVG_humid_lvl_pms as
select Metabolic_State,avg(Humidity_percent) from meta_sim
group by Metabolic_State;

#Peak CO2 time
create view peak_CO2_lvl as
select Timestamp, CO2_ppm from meta_sim
order by CO2_ppm desc limit 1;

#Peak Humidity time
create view peak_humid_lvl as
select Timestamp, Humidity_percent from meta_sim
order by Humidity_percent desc limit 1;

#Lowest O2 time
create view least_O2_lvl as
select Timestamp, O2_percent from meta_sim
order by O2_percent asc limit 1;



#CO2 Levels[average]
select * from AVG_CO2_lvl;

#O2 Levels[average]
select * from AVG_O2_lvl;

#Humidity Levels[average]
select * from humidity_lvl;

#safe[co2 levels]
select * from safe_co2_lvl;

#safe[O2 levels]
select * from safe_o2_lvl;

#safe[Humidity levels]
select * from safe_humidity_lvl;

#Total Minutes in each matebolic state
select * from minutes ;

#Average CO2 levels per Matabolic state
select * from AVG_CO2_lvl_pms;

#Average O2 levels per Metabolic_State
select * from AVG_O2_lvl_pms;

#Average Humidity Levles per Metabolic_State
select * from AVG_humid_lvl_pms;

#Peak CO2 time
select * from peak_CO2_lvl;

#Peak Humidity time
select * from peak_humid_lvl;

#Lowest O2 time
select * from least_O2_lvl