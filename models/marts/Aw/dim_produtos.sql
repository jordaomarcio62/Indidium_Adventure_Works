with
    produtos as (
        select *
        from {{ ref('stg_aw__produtos') }}
    ),

    joined as (
        select
        *
        from produtos               as pd

    )
select *
from joined