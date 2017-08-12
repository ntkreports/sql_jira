with aa_201601 as (
select
  distinct sip.se_id,
  case when sip.tariff ~ 'WIFI' then 'WIFI' else 'VLAN' end as svc_id,
  sip.mdate,
  lc.segment
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
join v083.lc lc on lc.lc_num = se.lc_num and lc.company = true
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < '2015-12-31 17:00:00.000')
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', '2016-01-01':: timestamp)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id = 81
),
aa_201602 as (
select
  distinct sip.se_id,
  case when sip.tariff ~ 'WIFI' then 'WIFI' else 'VLAN' end as svc_id,
  sip.mdate,
  lc.segment
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
join v083.lc lc on lc.lc_num = se.lc_num and lc.company = true
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < '2016-01-31 17:00:00.000')
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', '2016-02-01':: timestamp)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id = 81
),aa_201603 as (
select
  distinct sip.se_id,
  case when sip.tariff ~ 'WIFI' then 'WIFI' else 'VLAN' end as svc_id,
  sip.mdate,
  lc.segment
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
join v083.lc lc on lc.lc_num = se.lc_num and lc.company = true
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < '2016-02-29 17:00:00.000')
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', '2016-03-01':: timestamp)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id = 81
),aa_201604 as (
select
  distinct sip.se_id,
  case when sip.tariff ~ 'WIFI' then 'WIFI' else 'VLAN' end as svc_id,
  sip.mdate,
  lc.segment
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
join v083.lc lc on lc.lc_num = se.lc_num and lc.company = true
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < '2016-03-31 17:00:00.000')
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', '2016-04-01':: timestamp)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id = 81
),aa_201605 as (
select
  distinct sip.se_id,
  case when sip.tariff ~ 'WIFI' then 'WIFI' else 'VLAN' end as svc_id,
  sip.mdate,
  lc.segment
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
join v083.lc lc on lc.lc_num = se.lc_num and lc.company = true
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < '2016-04-30 17:00:00.000')
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', '2016-05-01':: timestamp)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id = 81
),aa_201606 as (
select
  distinct sip.se_id,
  case when sip.tariff ~ 'WIFI' then 'WIFI' else 'VLAN' end as svc_id,
  sip.mdate,
  lc.segment
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
join v083.lc lc on lc.lc_num = se.lc_num and lc.company = true
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < '2016-05-31 17:00:00.000')
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', '2016-06-01':: timestamp)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id = 81
),aa_201607 as (
select
  distinct sip.se_id,
  case when sip.tariff ~ 'WIFI' then 'WIFI' else 'VLAN' end as svc_id,
  sip.mdate,
  lc.segment
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
join v083.lc lc on lc.lc_num = se.lc_num and lc.company = true
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < '2016-06-30 17:00:00.000')
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', '2016-07-01':: timestamp)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id = 81
),aa_201608 as (
select
  distinct sip.se_id,
  case when sip.tariff ~ 'WIFI' then 'WIFI' else 'VLAN' end as svc_id,
  sip.mdate,
  lc.segment
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
join v083.lc lc on lc.lc_num = se.lc_num and lc.company = true
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < '2016-07-31 17:00:00.000')
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', '2016-08-01':: timestamp)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id = 81
),aa_201609 as (
select
  distinct sip.se_id,
  case when sip.tariff ~ 'WIFI' then 'WIFI' else 'VLAN' end as svc_id,
  sip.mdate,
  lc.segment
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
join v083.lc lc on lc.lc_num = se.lc_num and lc.company = true
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < '2016-08-31 17:00:00.000')
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', '2016-09-01':: timestamp)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id = 81
),aa_201610 as (
select
  distinct sip.se_id,
  case when sip.tariff ~ 'WIFI' then 'WIFI' else 'VLAN' end as svc_id,
  sip.mdate,
  lc.segment
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
join v083.lc lc on lc.lc_num = se.lc_num and lc.company = true
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < '2016-09-30 17:00:00.000')
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', '2016-10-01':: timestamp)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id = 81
),aa_201611 as (
select
  distinct sip.se_id,
  case when sip.tariff ~ 'WIFI' then 'WIFI' else 'VLAN' end as svc_id,
  sip.mdate,
  lc.segment
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
join v083.lc lc on lc.lc_num = se.lc_num and lc.company = true
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < '2016-10-31 17:00:00.000')
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', '2016-11-01':: timestamp)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id = 81
),aa_201612 as (
select
  distinct sip.se_id,
  case when sip.tariff ~ 'WIFI' then 'WIFI' else 'VLAN' end as svc_id,
  sip.mdate,
  lc.segment
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
join v083.lc lc on lc.lc_num = se.lc_num and lc.company = true
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < '2015-11-30 17:00:00.000')
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', '2016-12-01':: timestamp)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id = 81
),
----
aa_201701 as (
select
  distinct sip.se_id,
  case when sip.tariff ~ 'WIFI' then 'WIFI' else 'VLAN' end as svc_id,
  sip.mdate,
  lc.segment
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
join v083.lc lc on lc.lc_num = se.lc_num and lc.company = true
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < '2016-12-31 17:00:00.000')
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', '2017-01-01':: timestamp)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id = 81
),
aa_201702 as (
select
  distinct sip.se_id,
  case when sip.tariff ~ 'WIFI' then 'WIFI' else 'VLAN' end as svc_id,
  sip.mdate,
  lc.segment
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
join v083.lc lc on lc.lc_num = se.lc_num and lc.company = true
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < '2017-01-31 17:00:00.000')
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', '2017-02-01':: timestamp)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id = 81
),aa_201703 as (
select
  distinct sip.se_id,
  case when sip.tariff ~ 'WIFI' then 'WIFI' else 'VLAN' end as svc_id,
  sip.mdate,
  lc.segment
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
join v083.lc lc on lc.lc_num = se.lc_num and lc.company = true
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < '2017-02-28 17:00:00.000')
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', '2017-03-01':: timestamp)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id = 81
),aa_201704 as (
select
  distinct sip.se_id,
  case when sip.tariff ~ 'WIFI' then 'WIFI' else 'VLAN' end as svc_id,
  sip.mdate,
  lc.segment
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
join v083.lc lc on lc.lc_num = se.lc_num and lc.company = true
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < '2017-03-31 17:00:00.000')
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', '2017-04-01':: timestamp)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id = 81
),aa_201705 as (
select
  distinct sip.se_id,
  case when sip.tariff ~ 'WIFI' then 'WIFI' else 'VLAN' end as svc_id,
  sip.mdate,
  lc.segment
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
join v083.lc lc on lc.lc_num = se.lc_num and lc.company = true
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < '2017-04-30 17:00:00.000')
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', '2017-05-01':: timestamp)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id = 81
),aa_201706 as (
select
  distinct sip.se_id,
  case when sip.tariff ~ 'WIFI' then 'WIFI' else 'VLAN' end as svc_id,
  sip.mdate,
  lc.segment
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
join v083.lc lc on lc.lc_num = se.lc_num and lc.company = true
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < '2017-05-31 17:00:00.000')
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', '2017-06-01':: timestamp)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id = 81
),aa_201707 as (
select
  distinct sip.se_id,
  case when sip.tariff ~ 'WIFI' then 'WIFI' else 'VLAN' end as svc_id,
  sip.mdate,
  lc.segment
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
join v083.lc lc on lc.lc_num = se.lc_num and lc.company = true
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < '2017-06-30 17:00:00.000')
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', '2017-07-01':: timestamp)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id = 81
),aa_201708 as (
select
  distinct sip.se_id,
  case when sip.tariff ~ 'WIFI' then 'WIFI' else 'VLAN' end as svc_id,
  sip.mdate,
  lc.segment
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
join v083.lc lc on lc.lc_num = se.lc_num and lc.company = true
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < '2017-07-31 17:00:00.000')
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', '2017-08-01':: timestamp)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id = 81
)
/*
-- АКБ
select mdate, svc_id,case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, count(se_id) from aa_201601 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, count(se_id) from aa_201602 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, count(se_id) from aa_201603 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, count(se_id) from aa_201604 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, count(se_id) from aa_201605 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, count(se_id) from aa_201606 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, count(se_id) from aa_201607 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, count(se_id) from aa_201608 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, count(se_id) from aa_201609 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, count(se_id) from aa_201610 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, count(se_id) from aa_201611 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, count(se_id) from aa_201612 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, count(se_id) from aa_201701 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, count(se_id) from aa_201702 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, count(se_id) from aa_201703 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, count(se_id) from aa_201704 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, count(se_id) from aa_201705 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, count(se_id) from aa_201706 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, count(se_id) from aa_201707 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, count(se_id) from aa_201708 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
*/
-- Выручка
select mdate, svc_id,case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, sum(pl.debet) from aa_201601 aa,v083.p_log pl where aa.se_id = pl.ref_se_id and pl.timestamp >='2015-12-31 17:00:00.000' and pl.timestamp < '2016-01-31 17:00:00.000' and pl.reason_code = 1001 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, sum(pl.debet) from aa_201602 aa,v083.p_log pl where aa.se_id = pl.ref_se_id and pl.timestamp >='2016-01-31 17:00:00.000' and pl.timestamp < '2016-02-29 17:00:00.000' and pl.reason_code = 1001 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, sum(pl.debet) from aa_201603 aa,v083.p_log pl where aa.se_id = pl.ref_se_id and pl.timestamp >='2016-02-29 17:00:00.000' and pl.timestamp < '2016-03-31 17:00:00.000' and pl.reason_code = 1001 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, sum(pl.debet) from aa_201604 aa,v083.p_log pl where aa.se_id = pl.ref_se_id and pl.timestamp >='2016-03-31 17:00:00.000' and pl.timestamp < '2016-04-30 17:00:00.000' and pl.reason_code = 1001 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, sum(pl.debet) from aa_201605 aa,v083.p_log pl where aa.se_id = pl.ref_se_id and pl.timestamp >='2016-04-30 17:00:00.000' and pl.timestamp < '2016-05-31 17:00:00.000' and pl.reason_code = 1001 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, sum(pl.debet) from aa_201606 aa,v083.p_log pl where aa.se_id = pl.ref_se_id and pl.timestamp >='2016-05-31 17:00:00.000' and pl.timestamp < '2016-06-30 17:00:00.000' and pl.reason_code = 1001 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, sum(pl.debet) from aa_201607 aa,v083.p_log pl where aa.se_id = pl.ref_se_id and pl.timestamp >='2016-06-30 17:00:00.000' and pl.timestamp < '2016-07-31 17:00:00.000' and pl.reason_code = 1001 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, sum(pl.debet) from aa_201608 aa,v083.p_log pl where aa.se_id = pl.ref_se_id and pl.timestamp >='2016-07-31 17:00:00.000' and pl.timestamp < '2016-08-31 17:00:00.000' and pl.reason_code = 1001 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, sum(pl.debet) from aa_201609 aa,v083.p_log pl where aa.se_id = pl.ref_se_id and pl.timestamp >='2016-08-31 17:00:00.000' and pl.timestamp < '2016-09-30 17:00:00.000' and pl.reason_code = 1001 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, sum(pl.debet) from aa_201610 aa,v083.p_log pl where aa.se_id = pl.ref_se_id and pl.timestamp >='2016-09-30 17:00:00.000' and pl.timestamp < '2016-10-31 17:00:00.000' and pl.reason_code = 1001 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, sum(pl.debet) from aa_201611 aa,v083.p_log pl where aa.se_id = pl.ref_se_id and pl.timestamp >='2016-10-31 17:00:00.000' and pl.timestamp < '2016-11-30 17:00:00.000' and pl.reason_code = 1001 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, sum(pl.debet) from aa_201612 aa,v083.p_log pl where aa.se_id = pl.ref_se_id and pl.timestamp >='2016-11-30 17:00:00.000' and pl.timestamp < '2016-12-31 17:00:00.000' and pl.reason_code = 1001 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, sum(pl.debet) from aa_201701 aa,v083.p_log pl where aa.se_id = pl.ref_se_id and pl.timestamp >='2016-12-31 17:00:00.000' and pl.timestamp < '2017-01-31 17:00:00.000' and pl.reason_code = 1001 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, sum(pl.debet) from aa_201702 aa,v083.p_log pl where aa.se_id = pl.ref_se_id and pl.timestamp >='2017-01-31 17:00:00.000' and pl.timestamp < '2017-02-28 17:00:00.000' and pl.reason_code = 1001 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, sum(pl.debet) from aa_201703 aa,v083.p_log pl where aa.se_id = pl.ref_se_id and pl.timestamp >='2017-02-28 17:00:00.000' and pl.timestamp < '2017-03-31 17:00:00.000' and pl.reason_code = 1001 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, sum(pl.debet) from aa_201704 aa,v083.p_log pl where aa.se_id = pl.ref_se_id and pl.timestamp >='2017-03-31 17:00:00.000' and pl.timestamp < '2017-04-30 17:00:00.000' and pl.reason_code = 1001 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, sum(pl.debet) from aa_201705 aa,v083.p_log pl where aa.se_id = pl.ref_se_id and pl.timestamp >='2017-04-30 17:00:00.000' and pl.timestamp < '2017-05-31 17:00:00.000' and pl.reason_code = 1001 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, sum(pl.debet) from aa_201706 aa,v083.p_log pl where aa.se_id = pl.ref_se_id and pl.timestamp >='2017-05-31 17:00:00.000' and pl.timestamp < '2017-06-30 17:00:00.000' and pl.reason_code = 1001 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, sum(pl.debet) from aa_201707 aa,v083.p_log pl where aa.se_id = pl.ref_se_id and pl.timestamp >='2017-06-30 17:00:00.000' and pl.timestamp < '2017-07-31 17:00:00.000' and pl.reason_code = 1001 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
--union all select mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end as segment, sum(pl.debet) from aa_201708 aa,v083.p_log pl where aa.se_id = pl.ref_se_id and pl.timestamp >='2017-07-31 17:00:00.000' and pl.timestamp < '2017-08-31 17:00:00.000' and pl.reason_code = 1001 group by mdate, svc_id, case when segment in ('КО', 'Не указано') then 'b2b' when segment='Телеком' then 'b2o' else 'b2g' end
