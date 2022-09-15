select * 
from {{ metrics.calculate(
    metric('avg_odr_amt'),
    grain='week',
    dimensions=[],
) }}