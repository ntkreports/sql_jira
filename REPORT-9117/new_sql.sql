/*CREATE TYPE "ext"."rtfin9" as 
(
mnt timestamp,
company varchar,
svc_title varchar,
tariff varchar,
set_tariff varchar,
count_akb integer,
sum_debet numeric(19,4),
imputed_cost numeric(19,4),
pr_min_price numeric(19,4),
nom varchar,
nom_name varchar,
seqment varchar
);

*/
CREATE OR REPLACE FUNCTION "ext"."rt_fin_9" (in pvd1 timestamp, in pvd2 timestamp, psegment varchar) RETURNS SETOF ext.rtfin9 AS
$BODY$
/* Подсчет АКБ и выручки (всей) для BI и финансовых отчетов, подготовленных для ЭРТХ
   Подсчет АКБ ведется из se_in_period, с переопределением ТП на vd2, а также с учетом особенностей услуг (вообще надо se_in_period переписать по правильному под эти услуги)
*/
declare 
  res_row ext.rtfin9;
  d1 timestamp;
  d2 timestamp;
begin 
--переводим дату в UTC
  d1 := ext.get_timestamp($1::timestamp,0);
  d2 := ext.get_timestamp($2,0);

create temporary table pre_plog
(
timestamp timestamp, 
reason_code integer,
lc_num integer,
ref_se_id integer, 
debet numeric(19,4),
cnt_pid integer
); 

create temporary table detail
(
mnt_ timestamp,
company_ varchar,
svc_title_ varchar,
tariff_ varchar,
set_tariff_ varchar,
count_akb integer,
sum_debet numeric(19,4),
imputed_cost numeric(19,4),
pr_min_price numeric(18,4),
nom_ varchar
);


insert into pre_plog(timestamp,reason_code,lc_num,ref_se_id,debet,cnt_pid)
select 
  date_trunc('month',ext.get_timestamp(pl.timestamp,1)::timestamp) as timestamp, 
  pl.reason_code,
  pl.lc_num,
  pl.ref_se_id, 
  sum(pl.debet) as debet,
  count(pl.p_id) as cnt_pid
from v083.p_log pl, v083.lc lc
where pl.timestamp >= d1
and pl.timestamp < d2
and pl.reason_code in (1001,1028,1029,1030,1031,1032,1033,1034,1038,1039,1041,1046,1050,1052,1054,1061,1062,1063,1064,1065,1066,1067,1074,1301,1302,1303,1304,4040,4068,4088)
and pl.lc_num = lc.lc_num
and lc.company = true
and lc.segment = $3
group by date_trunc('month',ext.get_timestamp(pl.timestamp,1)), pl.reason_code, pl.lc_num, pl.ref_se_id;

create index pre_plog_ref_se_id
on pre_plog
(ref_se_id);
analyze pre_plog; 

insert into detail (mnt_, company_, svc_title_, tariff_, set_tariff_, count_akb, sum_debet, imputed_cost, pr_min_price, nom_)
with plog as (
select
  a.mnt,
  a.ref_se_id,
  sum(a.debet) as debet,
  sum(a.imputed_cost) as imputed_cost,
  a.nom,
  a.company_
from ( -- Списания АП
      select
        date_trunc('month', ext.get_timestamp(pl.timestamp,1)) as mnt,
        case when se.lc_company then 'ЮЛ' else 'ФЛ' end as company_,
        pl.ref_se_id,
        sum(pl.debet) as debet,
        null::int as imputed_cost,
        case when se.svc_id = 503 and tc.pr_nomenclature_id = '101075' then '101075'
             when se.svc_id = 503 and tc.pr_nomenclature_id != '101075' then '12465'
        end as nom
      from pre_plog pl
      join v083.se on se.se_id = pl.ref_se_id and se.svc_id != 0
      left join v083.tc on tc.tc_id = se.tc_id and tc.pr_nomenclature_id in ('101075','12465','101976')
      where pl.timestamp >= d1 
        and pl.timestamp < d2
        and reason_code in (1001,1061,1052)
------------------------------------------
--Сегменты КО
and se.lc_company = true
and exists (select 1 from v083.lc lc where se.lc_num = lc.lc_num and lc.segment = $3)
------------------------------------------
      group by date_trunc('month',ext.get_timestamp(pl.timestamp,1)), ref_se_id, nom, company_

      union all -- Списание АП по пакетам
      select
        date_trunc('month', ext.get_timestamp(d.timestamp,1)) as mnt,
        case when se.lc_company then 'ЮЛ' else 'ФЛ' end as company_,
        d.ref_se_id,
        sum(d.debit) as debet,
        null::int as impted_cost,
        null as nom
      from v083.ntk_p_log_detail d
      join v083.se on se.se_id = d.ref_se_id
      where d.timestamp >= d1
      and d.timestamp <  d2
      and d.offer_id is null
------------------------------------------
--Сегменты КО
and se.lc_company = true
and exists (select 1 from v083.lc lc where se.lc_num = lc.lc_num and lc.segment = $3)
------------------------------------------
      group by date_trunc('month', ext.get_timestamp(d.timestamp,1)), d.ref_se_id, nom, company_

      union all-- Списание АП телефония
      select
        date_trunc('month', c.calldate) as mnt,
        case when se.lc_company then 'ЮЛ' else 'ФЛ' end as company_,
        c.se_id as ref_se_id,
        sum(c.cost) as debet,
        sum(imputed_cost) as imputed_cost,
        case when c.nomenclature_code in ('100821','100818') and (category = 225 or category_zone = 225) then '101976'
             else c.nomenclature_code
        end as nom
      from ntktel.cdr c
      join v083.se on se.se_id = c.se_id
      where c.calldate >= date_trunc('day',$1)
      and c.calldate < date_trunc('day', $2)
      and c.direction_id is not null
      and not c.incoming
      and c.cost > 0
------------------------------------------
--Сегменты КО
and se.lc_company = true
and exists (select 1 from v083.lc lc where se.lc_num = lc.lc_num and lc.segment = $3)
------------------------------------------
      group by date_trunc('month', c.calldate), c.se_id, nom, company_
      ) a
group by a.mnt, a.ref_se_id, nom, company_
)

,plog_o as (
select
  date_trunc('month', ext.get_timestamp(p.timestamp,1)) as mnt_,
  case when lc.company then 'ЮЛ' else 'ФЛ' end as company_,
  case when p.reason_code in (1046,1044,1041) then 'Антивирусная защита'::varchar
       when p.reason_code in (1028,1030,1032,1033,1054) then 'Прочие услуги'::varchar
       when p.reason_code = 1066 then 'Сервисный центр'
       when p.reason_code = 4040 then 'Услуга КПД'
       else 'Пакет услуг'::varchar
  end as svc_title_,
  r.title as tariff_,
  null::varchar as set_tariff_,
  akb_av.count as count_akb,
  sum(p.debet) as sum_debet,
  null::numeric(18,4) as pr_min_price,
  n.nom_code as nom_
from pre_plog p
join v083.lc on lc.lc_num = p.lc_num
join analit.ntk_nomenclature n on n.reason_code = p.reason_code
join v083.reason_codes r on r.reason_code = p.reason_code
left join (select count(distinct lc_num), reason_code
           from(select
                  lc_num,
                  pl.reason_code
                from pre_plog pl
                where timestamp >= d1
                and timestamp < d2
                and pl.ref_se_id is null
                and pl.reason_code in (1046,1044,1041)
                group by lc_num, pl.reason_code
                having sum(pl.debet)::numeric(19,4) !=0
                ) a
            group by reason_code
          ) akb_av on akb_av.reason_code = r.reason_code
where p.ref_se_id is null
and p.reason_code != 1001
and (p.reason_code < 2000 or p.reason_code = 4040)
and p.timestamp >= d1
and p.timestamp < d2
------------------------------------------
--Сегменты КО
and lc.company = true
and lc.segment = $3
------------------------------------------
group by mnt_, company_,count_akb, svc_title_, n.nom_code, r.title
)

, akb as (
-- АКБ все кроме КТВ, ТВ, Охрана, ВЛ
select
  case when sip.svc_id in (3, 518) then null
       else count(distinct sip.se_id)
  end as count,
  case when se.lc_company then 'ЮЛ' else 'ФЛ' end as company_,
  sip.svc_id,
  sip.tariff,
  sip.set_tariff,
  th.tariff_id,
  th.set_tariff_id,
  sip.mdate
from se_in_period.se_in_period_other sip
join v083.se on se.se_id = sip.se_id
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < d2)
left join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', $1)
and se.lc_contract_ident not in ('1175', '160129')
and sip.state = 'АКБ'
and sip.svc_id not in (516, 503, 666, 667, 522, 514)
and th.tariff_id != 5006211   -- VLAN бесплтаный убираем
and case when se.svc_id = 105 then sip.company else true end  -- Домен у ФЛ убираем
and case when se.svc_id = 524 then se.tc_id not in (5007445, 5007284) else true end -- Служебные датчики спокойствия
and case when se.svc_id = 519 and tc.pr_min_price = '0' then false else true end
------------------------------------------
--Сегменты КО
and se.lc_company = true
and exists (select 1 from v083.lc lc where se.lc_num = lc.lc_num and lc.segment = $3)
------------------------------------------
group by sip.svc_id, company_, sip.tariff, sip.set_tariff, th.tariff_id, th.set_tariff_id, sip.mdate


--АКБ АВ
union
select 
  count(distinct se.se_id),
  case when se.lc_company then 'ЮЛ' else 'ФЛ' end as company_,
  se.svc_id,
  null::varchar as tariff,
  null::varchar as set_tariff,
  th.tariff_id,
  th.set_tariff_id,
  date_trunc('day', $1) as mnt
from (select
         ext.se_ch_th_by_date(pl.ref_se_id,d2,1) as se_id_
      from pre_plog pl
      join v083.se se on pl.ref_se_id = se.se_id
      where timestamp >= d1
      and timestamp < d2
      and se.svc_id = 514
      and se.lc_company = false
      group by se_id_
      having sum(pl.debet)::numeric(19,4) !=0
      ) a
join v083.se se on se.se_id = a.se_id_
left join v083.ntk_se_tariff_history th
     on th.se_id = se.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < d2)
------------------------------------------
--Сегменты КО
where se.lc_company = true
and exists (select 1 from v083.lc lc where se.lc_num = lc.lc_num and lc.segment = $3)
------------------------------------------
group by se.svc_id, company_, th.tariff_id, th.set_tariff_id, date_trunc('day', $1)


-- АКБ охрана
union
select
  count(distinct sip.se_id) as count,
  case when se.lc_company then 'ЮЛ' else 'ФЛ' end as company_,
  sip.svc_id,
  sip.tariff,
  sip.set_tariff,
  th.tariff_id,
  th.set_tariff_id,
  sip.mdate
from se_in_period.se_in_period_other sip
join v083.se se on sip.se_id = se.se_id
left join v083.ntk_se_tariff_history th
     on th.se_id = sip.se_id
     and th.deleted_at is null
     and th.applied_at = (select max(applied_at)
                          from v083.ntk_se_tariff_history th1
                          where th1.se_id = th.se_id
                          and th1.deleted_at is null
                          and th1.applied_at < d2)
where se.svc_id = 522
and sip.mdate = date_trunc('day', $1)
and sip.state = 'АКБ'
and not exists (select 1
                from v083.ntk_user_block ub
                where ub.lc_num = se.lc_num
                and ub.creating_date < d2
                and (ub.closing_date is null or ub.closing_date > d2)
                  )
and not exists (select 1
                from v083.se_state ss
                where ss.se_id = se.se_id
                and ss.state_id = 104
                and ss.time < d2
                and not exists (select 1
                                from v083.se_state ss2
                                where ss2.se_id = se.se_id
                                and ss2.state_id = 105
                                and ss2.time > ss.time
                                and ss2.time < d2
                                and ss.time  < d2)
               )
------------------------------------------
--Сегменты КО
and se.lc_company = true
and exists (select 1 from v083.lc lc where se.lc_num = lc.lc_num and lc.segment = $3)
------------------------------------------
group by sip.svc_id, company_, sip.tariff, sip.set_tariff, th.tariff_id, th.set_tariff_id, sip.mdate


-- АКБ КТВ И телефония
union
select 
  case when se.svc_id = 516 then count(se.se_id)
       else count(distinct se.lc_contract_ident)
  end as count,
  case when se.lc_company then 'ЮЛ' else 'ФЛ' end as company_,
  se.svc_id, 
  tc1.title, 
  tc2.title, 
  th.tariff_id, 
  th.set_tariff_id, 
  date_trunc('day', $1) as mdate
from v083.se
join v083.tc on tc.tc_id = se.tc_id
join v083.ntk_se_tariff_history th on th.se_id = se.se_id
  and th.deleted_at is null
  and th.applied_at = (select max(applied_at)
                       from v083.ntk_se_tariff_history th1
                       where th1.se_id = th.se_id
                       and th1.deleted_at is null
                       and th1.applied_at < d2)
left join v083.tc tc1 on tc1.tc_id = th.tariff_id
left join v083.tc tc2 on tc2.tc_id = th.set_tariff_id
where se.svc_id in (516, 503)
and se.created < d2
and se.activated <  d2
and (se.deleted = false or se.removed >= d2)
and se.lc_contract_ident != '160129'
and case when se.svc_id = 503 
         then tc.pr_min_price::numeric(18,4) != 0 
              and se.lc_contract_ident != '1175'
              and exists (select 1 from pre_plog pl
                           where pl.ref_se_id = se.se_id
                             and pl.timestamp >= d1
                             and pl.timestamp < d2)
           else true
      end
------------------------------------------
--Сегменты КО
and se.lc_company = true
and exists (select 1 from v083.lc lc where se.lc_num = lc.lc_num and lc.segment = $3)
------------------------------------------
group by se.svc_id, company_, tc1.title, tc2.title, th.tariff_id, th.set_tariff_id, date_trunc('day', $1)


-- АКБ ВЛ
union
select
  count(sip.se_id),
  case when sip.company then 'ЮЛ' else 'ФЛ' end as company_,
  20 as svc_id,
  sip.tariff,
  sip.set_tariff,
  th.tariff_id,
  th.set_tariff_id,
  sip.mdate
from se_in_period.se_in_period sip
join v083.se se on se.se_id = sip.se_id
left join v083.ntk_se_tariff_history th on th.se_id = sip.se_id
  and th.deleted_at is null
  and th.applied_at = (select max(applied_at)
                       from v083.ntk_se_tariff_history th1
                       where th1.se_id = th.se_id
                       and th1.deleted_at is null
                       and th1.applied_at < d2)
join v083.tc on tc.tc_id = th.tariff_id
where mdate = date_trunc('day', $1)
and state = 'АКБ'
and case when sip.company then tc.pr_min_price::numeric(18,4) != 0 else true end
------------------------------------------
--Сегменты КО
and se.lc_company = true
and exists (select 1 from v083.lc lc where se.lc_num = lc.lc_num and lc.segment = 'КО')
------------------------------------------
group by sip.svc_id, company_, sip.tariff, sip.set_tariff, th.tariff_id, th.set_tariff_id, sip.mdate

--- акб hdtv iptv

union
select
  count(distinct(case when exists(select 1 
                                  from v083.se se1 
                                  where se1.lc_num = se.lc_num
                                  and se1.svc_id in (666,667)
                                  and se1.created < d2
                                  and se1.activated < d2
                                  and (se1.deleted = false or se1.canceled >= d2)
                   )  then se.lc_num
       end)) as count,
  case when sip.company = false then 'ФЛ' else 'ЮЛ' end as company_,
  666 as svc_id,
  'Цифровое телевидение' as tariff,
  null as set_tariff,
  null as tariff_id,
  null as set_tariff_id ,
  sip.mdate
from se_in_period.se_in_period sip
join v083.se on se.se_id = sip.se_id
where se.se_id = sip.se_id
and sip.mdate = date_trunc('day', $1)
and sip.state = 'АКБ'
and sip.svc_id = 20
and case when sip.company = true 
           then sip.min_price != 0
         else sip.company = false end
------------------------------------------
--Сегменты КО
and se.lc_company = true
and exists (select 1 from v083.lc lc where se.lc_num = lc.lc_num and lc.segment = $3)
------------------------------------------
group by case when sip.company = false then 'ФЛ' else 'ЮЛ' end, sip.mdate
)

,vl as (
select
  coalesce(p.mnt,akb.mdate) as mnt_,
  coalesce(p.company_, akb.company_) as company_,
  'Выделенная линия' as svc_title_,
  tc.title as tariff_,
  tcp.title as set_tariff_,
  akb.count as count_akb,
  sum(p.debet) as sum_debet,
  tc.pr_min_price:: numeric(18,4) as pr_min_price,
  case when se.svc_id = 20 and tcp.tc_id = 5006689 then '101683' -- ВЛ Социальный интернет
       else '12455'
  end as nom_
from plog p
join v083.se on se.se_id = p.ref_se_id and svc_id in (3,20)
join v083.ntk_se_tariff_history th on th.se_id = se.se_id
 and th.deleted_at is null
 and th.applied_at = (select max(th1.applied_at)
                      from v083.ntk_se_tariff_history th1
                      where th1.se_id = th.se_id
                      and th1.deleted_at is null
                      and th1.applied_at < d2)
full join akb on akb.tariff_id = th.tariff_id
             and coalesce(akb.set_tariff_id,0) = coalesce(th.set_tariff_id,0)
             and akb.company_ = p.company_
left join v083.svc svc2 on svc2.svc_id = akb.svc_id
left join v083.tc tc on tc.tc_id = coalesce(th.tariff_id,akb.tariff_id)
left join v083.tc tcp on tcp.tc_id = coalesce(th.set_tariff_id, akb.set_tariff_id)
where (akb.svc_id in (3,20) or se.svc_id in (3,20))
------------------------------------------
--Сегменты КО
and se.lc_company = true
and exists (select 1 from v083.lc lc where se.lc_num = lc.lc_num and lc.segment = $3)
------------------------------------------
group by mnt_, coalesce(p.company_, akb.company_), svc_title_, tariff_, set_tariff_, tc.pr_min_price, nom_, count_akb
)

,others as (
select
  coalesce(p.mnt,akb.mdate) as mnt_,
  coalesce(p.company_, akb.company_) as company_,
  case when coalesce(svc.title,svc2.title) = 'Абонентская плата за доступ к сети' then 'Выделенная линия'
       when coalesce(svc.title,svc2.title) = 'Доступ к камере' then 'Видеоконтроль'
       else coalesce(svc.title,svc2.title)
  end as svc_title_,
  tc.title as tariff_,
  case when coalesce(svc.title,svc2.title) = 'Доступ к камере' then 'Доступ к камере'
       else tcp.title
  end as set_tariff_,
  akb.count as count_akb,
  sum(p.debet) as sum_debet,
  sum(p.imputed_cost) as imputed_cost,
  tc.pr_min_price :: numeric(18,4) as pr_min_price_,
  case when coalesce(svc.svc_id,svc2.svc_id) = 525 then '102057' -- Colocation
       when coalesce(svc.svc_id,svc2.svc_id) = 514 then '100740' -- Антивирус
       when coalesce(svc.svc_id,svc2.svc_id) = 81 then '12454' -- VLAN
       when coalesce(svc.svc_id,svc2.svc_id) = 517 then '101262' -- leasing/аренда оборудования
       when coalesce(svc.svc_id,svc2.svc_id) = 83 then '12529' -- vols
       when coalesce(svc.svc_id,svc2.svc_id) = 519 then '102018' -- vk
       when coalesce(svc.svc_id,svc2.svc_id) = 520 then '102410' -- vats
       when coalesce(svc.svc_id,svc2.svc_id) = 518 then '12455' -- vats
       when coalesce(svc.svc_id,svc2.svc_id) = 524 then '102851' -- Датчики спокойствия
       when coalesce(svc.svc_id,svc2.svc_id) = 523 then '102615' -- Домофон
       when coalesce(svc.svc_id,svc2.svc_id) = 521 then '102434' -- Доступ к камере
       when coalesce(svc.svc_id,svc2.svc_id) = 516 then '101243' -- КТВ
       when coalesce(svc.svc_id,svc2.svc_id) = 522 and coalesce(p.company_,akb.company_) = 'ФЛ' then '102511' -- Охрана ФЛ
       when coalesce(svc.svc_id,svc2.svc_id) = 522 and coalesce(p.company_,akb.company_) = 'ЮЛ' then '102908' -- Охрана ЮЛ
       when coalesce(svc.svc_id,svc2.svc_id) = 503 and p.nom is null then '12465' -- Телефон Ап
       when coalesce(svc.svc_id,svc2.svc_id) = 503 and p.nom is not null then p.nom -- Телефон списание за связь
       when coalesce(svc.svc_id,svc2.svc_id) in (526, 515) then tc.pr_nomenclature_id -- Тех. Обслуживание и Рассрочка оборудования
       when coalesce(svc.svc_id,svc2.svc_id) = 666 then '101564' -- IPTV
       when coalesce(svc.svc_id,svc2.svc_id) = 667 then '101416' -- HDTV
       when coalesce(svc.svc_id,svc2.svc_id) = 105 then '12461' -- Домен
       else null
  end as nom_
from plog p
join v083.se se on se.se_id = p.ref_se_id and not svc_id in (3, 20)
join v083.svc on svc.svc_id = se.svc_id
left join v083.se sep on sep.se_id = se.set_se_id
left join v083.ntk_se_tariff_history th on th.se_id = se.se_id
      and th.deleted_at is null
      and th.applied_at = (select max(th1.applied_at)
                           from v083.ntk_se_tariff_history th1
                           where th1.se_id = th.se_id
                           and th1.deleted_at is null
                           and th1.applied_at < d2)
full join akb on akb.tariff_id = th.tariff_id
             and coalesce(akb.set_tariff_id,0) = coalesce(th.set_tariff_id,0)
             and akb.svc_id = se.svc_id and akb.company_ = p.company_
left join v083.svc svc2 on svc2.svc_id = akb.svc_id
left join v083.tc tc on tc.tc_id = coalesce(th.tariff_id,akb.tariff_id)
left join v083.tc tcp on tcp.tc_id = coalesce(th.set_tariff_id, akb.set_tariff_id)
where (akb.svc_id not in (3,20, 666,667) or se.svc_id not in (3,20,666,667))
------------------------------------------
--Сегменты КО
and se.lc_company = true
and exists (select 1 from v083.lc lc where se.lc_num = lc.lc_num and lc.segment = $3)
------------------------------------------
group by mnt_, coalesce(p.company_, akb.company_), svc_title_, tariff_, set_tariff_, pr_min_price_, nom_, count_akb
)


,conn as (
select
  date_trunc('month', ad.data) as mnt_,
  case when ad.company then 'ЮЛ' else 'ФЛ' end as company_,
  svc.title as svc_title_,
  null as tariff_,
  null as set_tariff_,
  null::bigint as count_akb,
  sum(debet) as sum_debet, --greatest(sum(debet), sum(jira_debet)) as debet,
  null :: numeric(18,4) as pr_min_price,
  ad.nom_code as nom_
from analit.analisis_debet ad
left join v083.svc on svc.svc_id = ad.svc_id
where ad.nom_code in ('12521','101686','101240','12679','12681', '101077', '101079', '101081', '102016', '102411','102513','102614','101138', '102850', '102906')
and ad.data >= date_trunc('day', $1)
and ad.data < date_trunc('day', $2)
------------------------------------------
--Сегменты КО
and ad.company = true
and exists (select 1 from v083.lc lc where ad.lc_num = lc.lc_num and lc.segment = $3)
------------------------------------------
group by mnt_, case when ad.company then 'ЮЛ' else 'ФЛ' end, svc_title_, tariff_, set_tariff_, count_akb, pr_min_price, ad.nom_code
)

,iptv as (
select coalesce(p.mnt,akb.mdate) as mnt_,
       coalesce(p.company_,akb.company_) as company,
       akb.tariff as svc_title_,
       null::varchar as tariff,
       null::varchar as set_tariff,
       akb.count as count_akb,
       sum(debet) as sum_debet,
       null::numeric(18,4) as pr_min_price,
       '101564'::varchar as nom
from plog p
join v083.se on se.se_id = p.ref_se_id and se.svc_id in (666,667)
full join akb on akb.company_ = p.company_ and akb.svc_id = 666
where akb.svc_id = 666
------------------------------------------
--Сегменты КО
and se.lc_company = true
and exists (select 1 from v083.lc lc where se.lc_num = lc.lc_num and lc.segment = $3)
------------------------------------------
group by mnt_, akb.tariff, akb.count, p.nom, company
)
select
  mnt_,
  company_,
  svc_title_ ,
  tariff_,
  set_tariff_,
  count_akb,
  sum_debet,
  null as imputed_cost,
  pr_min_price :: numeric(18,4) as pr_min_price,
  nom_
from vl

union all
select
  mnt_,
  company_,
  svc_title_ ,
  tariff_,
  set_tariff_,
  count_akb,
  sum_debet,
  case when nom_ ~ '^(102511|102908)$' then sum_debet * 0.8 else imputed_cost end as imputed_cost,
  pr_min_price_ :: numeric(18,4) as pr_min_price,
  nom_
from others

union all
select
  mnt_,
  company_,
  svc_title_ ,
  tariff_,
  set_tariff_,
  count_akb,
  sum_debet,
  null as imputed_cost,
  pr_min_price :: numeric(18,4) as pr_min_price,
  nom_
from conn

union all
select
  mnt_,
  company_,
  svc_title_ ,
  tariff_,
  set_tariff_,
  count_akb,
  sum_debet,
  null as imputed_cost,
  pr_min_price :: numeric(18,4) as pr_min_price,
  nom_
from plog_o

union all
select
  mnt_,
  company,
  svc_title_,
  tariff,
  set_tariff,
  count_akb,
  sum_debet,
  null as imputed_cost,
  pr_min_price :: numeric(18,4) as pr_min_price,
  nom
from iptv;

drop table pre_plog;

for res_row in
select distinct
  p.mnt_,
  p.company_,
  p.svc_title_ ,
  p.tariff_,
  p.set_tariff_,
  p.count_akb,
  p.sum_debet,
  p.imputed_cost,
  p.pr_min_price,
  p.nom_,
  case when p.nom_ = '101976' then 'Услуга МГ/МН телефонной связи' else n.nom_name end as nom_name,
  $3
from detail p
left join analit.ntk_nomenclature n on n.nom_code = p.nom_
order by 3,4,5

LOOP
  return next res_row;
END LOOP;

drop table detail;

end;
$BODY$

  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION ext.rt_fin_9(timestamp, timestamp, varchar)
  OWNER TO ja_operator;


--select * from ext.rt_fin_9('2017-01-01'::timestamp, '2017-02-01':: timestamp, 'КО')