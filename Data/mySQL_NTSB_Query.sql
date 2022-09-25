/* 
BrainStation Capstone: Aviation Accidents 

Created by: Katy Christensen
Date Created: September 2022
*/

#########################
### Create Base Table ###
#########################
-- The 'base table' is created from the aircraft tables and is the table all other columns (also known as features) will be joined to for final export into Jupyter Notebook for additional cleaning and exploratory data analysis.
-- Step 1. Duplicate the aircraft_08 table as the basis for the combined table ntsb_08
DROP TABLE IF EXISTS ntsb_08;
CREATE TABLE ntsb_08 AS
	SELECT *
	FROM aircraft_08;
 
#########################
### Review Base Table ###
#########################
-- Review table information and inital data exploration and cleaning by dropping undesired features

-- Step 1. Review table
SELECT * 
FROM ntsb_08;

-- Step 3. Drop features not relevant to the analysis
ALTER TABLE ntsb_08
	DROP regis_no,
    DROP ntsb_no,
    DROP owner_acft, 
    DROP owner_street,
    DROP owner_city,
    DROP owner_state,
    DROP owner_country,
    DROP owner_zip, 
    DROP oper_individual_name,
    DROP oper_name,
    DROP oper_same,
    DROP oper_street,
    DROP oper_city, 
    DROP oper_state, 
    DROP oper_country,
    DROP oper_zip, 
    DROP oper_code,
    DROP oper_dba,
    DROP oper_addr_same,
    DROP lchg_date, 
    DROP lchg_userid;

-- Step 4. Review table and verify columns were dropped    
SELECT *
FROM ntsb_08; 

-- Step 5. Some columns appeared to have a significant number of nulls; calculate the percentage of nulls for those tables
SELECT COUNT(*) AS total,
	   SUM(CASE WHEN fc_seats IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS fc_seats,
       SUM(CASE WHEN cc_seats IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS cc_seats,
       SUM(CASE WHEN pax_seats IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS pax_seats,
       SUM(CASE WHEN elt_type IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS elt_type,
	   SUM(CASE WHEN oper_cert_num IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS oper_cert_num,
       SUM(CASE WHEN oper_sched IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS oper_sched,
       SUM(CASE WHEN oper_dom_int IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS oper_dom_int,
       SUM(CASE WHEN oper_pax_cargo IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS oper_pax_cargo,
       SUM(CASE WHEN report_to_icao IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS report_to_icao,
       SUM(CASE WHEN evacuation IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS evacuation,
       SUM(CASE WHEN afm_hrs_since IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS afm_hrs_since,
       SUM(CASE WHEN med_type_flight IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS med_type_flight,
       SUM(CASE WHEN acft_year IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS acft_year,
       SUM(CASE WHEN fuel_on_board IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS fuel_on_board,
       SUM(CASE WHEN elt_manufacturer IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS elt_manufacturer,
       SUM(CASE WHEN elt_model IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS elt_model,
       SUM(CASE WHEN elt_reason_other IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS elt_reason_other
FROM ntsb_08;   

-- Step 6. Drop all columns that are over 95% NULLS (fc_seats, cc_seats, pax_seats, elt_type, oper_cert_num, acft_year, fuel_on_board, elt_manufacturer, elt_model, and elt_reason_other
	-- Also drop oper_pax_cargo which indicates the type of cargo onboard; if there are passengers onboard that information will be found in the injury table/columns
ALTER TABLE ntsb_08
	DROP fc_seats,
    DROP cc_seats,
    DROP pax_seats,
    DROP elt_type,
    DROP oper_cert_num,
    DROP oper_dom_int,
    DROP oper_pax_cargo,
    DROP acft_year,
    DROP fuel_on_board, 
    DROP elt_manufacturer,
    DROP elt_model, 
    DROP elt_reason_other;
 
 -- Step 7. Verify the columns were dropped
 SELECT *
 FROM ntsb_08;

###########################
### Review Events Table ###
###########################
-- Step 1. Review original table
SELECT * 
FROM events_08;
   
-- Step 2. Drop features not relevant to the analysis
ALTER TABLE events_08
	DROP ntsb_no,
    DROP latlong_acq,
    DROP apt_name, 
    DROP invest_agy, 
    DROP ntsb_docket,
    DROP ntsb_notf_from,
    DROP ntsb_notf_date,
    DROP ntsb_notf_tm,
    DROP fiche_number, 
    DROP lchg_date,
    DROP lchg_userid,
    DROP faa_dist_office;
    
-- Step 3. Some columns appeared to have a significant number of nulls; calculate the percentage of nulls for those tables
SELECT COUNT(*) AS total,
	   SUM(CASE WHEN apt_dist IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS apt_dist,
       SUM(CASE WHEN apt_dir IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS apt_dir,
       SUM(CASE WHEN metar IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS metar
FROM events_08;   

-- Step 4. Drop the metar column since it has over 95% nulls; determine how to imput nulls or consider dropping columns in Jupyter Notebook
ALTER TABLE events_08
	DROP metar;

-- Step 5. Review table to verify changes 
SELECT *
FROM events_08;


############################
### Review Engines Table ###
############################
-- Step 1. Review original table
SELECT * 
FROM engines_08;

-- Step 2. Drop undesired features
ALTER TABLE engines_08
	DROP lchg_date,
	DROP lchg_userid; 

-- Step 3. Review features with a siginficant number of nulls and calculate percentage of data
SELECT COUNT(*) AS total,
	   SUM(CASE WHEN propeller_type IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS propeller_type,
       SUM(CASE WHEN propeller_make IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS propeller_make,
       SUM(CASE WHEN propeller_model IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS propeller_model,
       SUM(CASE WHEN eng_time_total IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS engine_time_total,
       SUM(CASE WHEN eng_time_last_insp IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS engine_time_last_insp,
       SUM(CASE WHEN eng_time_overhaul IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS engine_time_overhaul
FROM engines_08;   

-- Step 4. Drop the features with more than 95% null values
ALTER TABLE engines_08
	DROP propeller_make,
    DROP propeller_model,
    DROP eng_time_total,
    DROP eng_time_last_insp,
    DROP eng_time_overhaul; 

-- Step 5. Verify features were dropped from table
SELECT *
FROM engines_08;

################################
### Review Flight Crew Table ###
################################
-- Step 1. Review original data
SELECT *
FROM flight_crew_08;

-- Step 2. Drop undesired features
ALTER TABLE flight_crew_08
	DROP crew_inj_level, -- derive from injury_08 table
    DROP lchg_date,
    DROP lchg_userid;

-- Step 3. Calculate percentage of nulls
SELECT COUNT(*) AS total,
	   SUM(CASE WHEN bfr_date IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS bfr_date,
       SUM(CASE WHEN ft_as_of IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS ft_as_of,
       SUM(CASE WHEN seat_occ_row IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS seat_occ_row,
       SUM(CASE WHEN infl_rest_inst IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS infl_rest_inst,
       SUM(CASE WHEN infl_rest_depl IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS infl_rest_depl,
       SUM(CASE WHEN child_restraint IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS child_restraint,
       SUM(CASE WHEN med_crtf_limit IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS med_crtf_limit,
       SUM(CASE WHEN mr_faa_med_certf IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS mr_faa_med_certf,
       SUM(CASE WHEN available_restraint IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS available_restraint,
       SUM(CASE WHEN restraint_used IS NULL THEN 1 ELSE 0 END)/COUNT(*)*100 AS restraint_used
FROM flight_crew_08;  

-- Step 4. Drop features with over 95% nulls 
ALTER TABLE flight_crew_08
	DROP ft_as_of,
    DROP seat_occ_row,
    DROP infl_rest_inst,
    DROP infl_rest_depl,
    DROP child_restraint,
    DROP med_crtf_limit, 
    DROP mr_faa_med_certf,
    DROP available_restraint,
    DROP restraint_used;

-- Step 6. Verify features were dropped
SELECT *
FROM flight_crew_08;

###########################
### Review Flight Time Table ###
###########################
-- Step 1. Review original data
SELECT *
FROM flight_time_08;

-- Step 2. Drop undesired features
ALTER TABLE flight_time_08
	DROP lchg_userid,
    DROP lchg_date;

-- Step 3. Verify features were dropped
SELECT * 
FROM flight_time_08;

-- Step 4. Sum the flight hour experience for each crew member grouped by the event ID and aircraft (export results)
SELECT ev_id,
	   Aircraft_Key,
	   flight_type,
	   flight_craft,
       SUM(CASE WHEN flight_type ='TOTL' AND flight_craft !='MENG' 
           AND flight_craft !='NGHT' AND flight_craft !='ROTO'
           AND flight_craft !='SENG' AND flight_craft !='SIMU'
           AND flight_craft !='ACTU' AND flight_craft !='GLDR'
           AND flight_craft !='LTA' AND flight_craft !='MAKE'  
           AND flight_craft !='INC' 
		   THEN flight_hours ELSE 0 END) AS total_hours
FROM flight_time_08
WHERE flight_type = 'TOTL' AND flight_craft != 'ACTU'
GROUP BY ev_id, Aircraft_Key;

-- Step 5. Review new table 'flight_crew_hours_08'
SELECT *
FROM flight_crew_hours_08;

###########################
### Review Injury Table ###
###########################
-- Step 1. Review original data
SELECT * 
FROM injury_08;

-- Step 2. Drop undesired features
ALTER TABLE injury_08
	DROP lchg_userid,
    DROP lchg_date;

-- Step 3. Verify chnages were made
SELECT * 
FROM injury_08;

################################
### Review Occurrences Table ###
################################
-- Step 1. Review original data
SELECT *
FROM occurrences_08;

-- Step 2. Drop undesired features
ALTER TABLE occurrences_08
	DROP lchg_userid,
    DROP lchg_date;

-- Step 3. Verify features were dropped
SELECT *
FROM occurrences_08;

-- Step 4. Find total number of rows in the table (137989 rows)
SELECT COUNT(*) as total
FROM occurrences_08;

-- Step 5. Find the number of rows where Altitude is 0 (137082 rows >> 99% of rows do not have an altitude value >> drop this column)
SELECT Altitude, 
	   COUNT(*)
FROM occurrences_08
WHERE Altitude = 0;

-- Step 6. Drop feature(s) with more than 95% null values
ALTER TABLE occurrences_08
	DROP Altitude;

-- Step 7. Verify features were dropped
SELECT *
FROM occurrences_08;

###########################
### Create Final Table ###
###########################
-- Join 2008 tables 
SELECT ntsb_08.*, 
       events_08.ev_type, events_08.ev_date, events_08.ev_dow, events_08.ev_time, events_08.ev_tmzn, events_08.ev_city, events_08.ev_state, events_08.ev_country, events_08.ev_site_zipcode, 
			events_08.ev_year, events_08.ev_month, events_08.mid_air, events_08.on_ground_collision, events_08.latitude, events_08.longitude, events_08.ev_nr_apt_id, events_08.ev_nr_apt_loc, 
            events_08.apt_dist, events_08.apt_dir, events_08.apt_elev, events_08.wx_brief_comp, events_08.wx_src_iic, events_08.wx_obs_time, events_08.wx_obs_dir, events_08.wx_obs_fac_id, 
            events_08.wx_obs_elev, events_08.wx_obs_dist, events_08.wx_obs_tmzn, events_08.light_cond, events_08.sky_cond_nonceil, events_08.sky_nonceil_ht, events_08.sky_ceil_ht, events_08.sky_cond_ceil, 
            events_08.vis_rvr, events_08.vis_rvv, events_08.vis_sm, events_08.wx_temp, events_08.wx_dew_pt, events_08.wind_dir_deg, events_08.wind_dir_ind, events_08.wind_vel_kts, 
            events_08.wind_vel_ind, events_08.gust_ind, events_08.gust_kts, events_08.altimeter, events_08.wx_dens_alt, events_08.wx_int_precip, events_08.ev_highest_injury, 
            events_08.inj_f_grnd, events_08.inj_m_grnd, events_08.inj_s_grnd, events_08.inj_tot_f, events_08.inj_tot_m, events_08.inj_tot_n, events_08.inj_tot_s, events_08.inj_tot_t, events_08.wx_cond_basic,
       flight_crew_08.crew_no, flight_crew_08.crew_category, flight_crew_08.crew_age, flight_crew_08.crew_sex, flight_crew_08.crew_city, flight_crew_08.crew_res_state, flight_crew_08.crew_res_country, 
			flight_crew_08.med_certf, flight_crew_08.med_crtf_vldty, flight_crew_08.date_lst_med, flight_crew_08.crew_rat_endorse, flight_crew_08.seatbelts_used, flight_crew_08.shldr_harn_used, 
            flight_crew_08.crew_tox_perf, flight_crew_08.seat_occ_pic, flight_crew_08.pc_profession, flight_crew_08.bfr, flight_crew_08.bfr_date, flight_crew_08.pilot_flying,
       flight_crew_hours_08.total_flightcrew_hours_08
FROM ntsb_08    
LEFT JOIN events_08
	ON ntsb_08.ev_id = events_08.ev_id
LEFT JOIN flight_crew_08
	ON ntsb_08.ev_id = flight_crew_08.ev_id AND ntsb_08.Aircraft_Key = flight_crew_08.Aircraft_Key
LEFT JOIN flight_crew_hours_08
	ON ntsb_08.ev_id = flight_crew_hours_08.ev_id AND ntsb_08.Aircraft_Key = flight_crew_hours_08.Aircraft_Key;

-- Make sure to export result for further analysis into Jupyter Notebook
