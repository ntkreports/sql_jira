with a as (
select *
from asterisk.abon_obzvon
where callend >= '2017-08-07'
  and callend <= '2017-08-10'
  and obzvon_type = 'domofon'
)

,extended as (
select distinct 
  contract,
  phone,
  case
    when tag = 'obzvon_domofon_dtmf_1' then '1'
    when tag = 'obzvon_domofon_dtmf_2' then '2'
    else tag
  end as tag
from asterisk.ivr_item_extended iit
where iit.data >= '2017-08-07'
  and iit.data <= '2017-08-10'
  and tag ~ 'obzvon_domofon_dtmf_1|obzvon_domofon_dtmf_2'
)


,main as (
select distinct
       a.phone,
       a.contract,
       case 
        when a.disposition = 'ANSWERED' and e.tag is not null
         then 'Дозвон' 
        when a.disposition = 'NO ANSWER'
         then 'Недозвон'
        when a.disposition = 'ANSWERED' and e.tag is null
         then 'Дозвон без оценки'
       end as full_record,
       e.tag
from a
left join extended e on (e.phone = a.phone) or (e.contract::varchar = a.contract) -- робот иногда не проставляет номера телефонов
)


,detail as (
select
  phone,
  contract,
  min(full_record) as dial, -- тут по алфавиту нормально выдернется
  max(tag) as tag
from main
group by phone, contract
)

,svod as ( 
select 
  count(distinct ivr.phone) as count_re,
  (select count(distinct lc.customer_id) 
   from a
   join v083.lc on lc.contract_ident = a.contract) as count_id,
  (select sum(tries) from a) as count_tries
from asterisk.ivr_item_extended ivr
where ivr.tag ~ 'call_to_3832090000'
  and ivr.phone in (select phone from a)
  and ivr.data >= '2017-08-08'
  and ivr.data < '2017-08-11'
)

--select * from detail
select * from svod