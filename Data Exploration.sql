select 
CONCAT(cpt.carrier_num, cpt.locality) AS carrier_code,
cpt.hcpcs_code,
reg.state_acronym,
reg.region_name,
cpt.non_fac_fee_schedule_amt,
cpt.fac_fee_schedule_amt,
cpt.status_code,
cpt.multi_sur_ind,
cpt.source_ver


from medicare_allowed_amt.cpt_allowed_amt cpt

left join medicare_allowed_amt.carrier_regions reg
on CONCAT(cpt.carrier_num, cpt.locality) = lpad(cast(reg.carrier_code as text),7,'0')

