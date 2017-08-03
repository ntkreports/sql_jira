with q as (
select pl.timestamp as date,
  pl.lc_num
from v083.p_log pl
join v083.lc on lc.lc_num = pl.lc_num
where pl.reason_code = 2025
  and pl.timestamp >= ext.get_timestamp('2017-06-30',0)
  and pl.timestamp < ext.get_timestamp('2017-08-01',0)
group by pl.timestamp, pl.lc_num
)

,arpu as (
select q.date,
  q.lc_num,
  sum(ext.abon_price_by_day(se.se_id,case when q.date::timestamp > se.created
                                          then q.date::timestamp
                                          else se.created
                                     end)) as arpu
from v083.se se
left join q on q.lc_num = se.lc_num
where se.pr_sost = 'active'
  and se.parent_se_id is null
  and se.set_se_id is null
  and q.date >= se.activated
  and (q.date < se.canceled or se.canceled is null)
group by q.date, q.lc_num
)

,a as (
select ext.get_timestamp(pl.timestamp,1) as date,
  lc.contract_ident, 
  pl.debet,
  pl.credit,
  pl.saldo,
  (select arpu.arpu from arpu where arpu.lc_num = pl.lc_num and arpu.date = pl.timestamp) as arpu,
  pl.reason_text,
  row_number() over(partition by contract_ident order by timestamp)
from v083.p_log pl
join v083.lc on lc.lc_num = pl.lc_num
where exists (select 1 from q where pl.lc_num = q.lc_num)
  and pl.timestamp >= ext.get_timestamp('2017-06-30',0)
  and pl.timestamp < ext.get_timestamp('2017-08-01',0)
order by 1
)

select a.date,
  a.contract_ident,
  a.credit,
  case when a.date::time >= '11:30:00'
       then a.saldo
       when a2.saldo is null
       then a.saldo + a.credit
       else a2.saldo
  end as saldo,
  a.arpu
from a
left join a a2 on a2.row_number = a.row_number - 1
  and a2.contract_ident = a.contract_ident
where a.reason_text = 'Платеж через Мои счета'
order by a.date