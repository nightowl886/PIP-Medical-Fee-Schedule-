select lpad(cast(carrier_code as text),7,'0'),
region_name
from medicare_allowed_amt.carrier_regions
