
insert into ext.rt_fin9(mnt,company,svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name,seqment)
---------
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-01-01', '2016-02-01', 'КО')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-01-01', '2016-02-01', 'Телеком')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-01-01', '2016-02-01', 'ГУ')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-01-01', '2016-02-01', 'Госконтракт')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-01-01', '2016-02-01', 'Не указано')
-----------
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-02-01', '2016-03-01', 'КО')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-02-01', '2016-03-01', 'Телеком')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-02-01', '2016-03-01', 'ГУ')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-02-01', '2016-03-01', 'Госконтракт')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-02-01', '2016-03-01', 'Не указано')
-----------
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-03-01', '2016-04-01', 'КО')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-03-01', '2016-04-01', 'Телеком')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-03-01', '2016-04-01', 'ГУ')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-03-01', '2016-04-01', 'Госконтракт')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-03-01', '2016-04-01', 'Не указано')
-----------
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-04-01', '2016-05-01', 'КО')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-04-01', '2016-05-01', 'Телеком')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-04-01', '2016-05-01', 'ГУ')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-04-01', '2016-05-01', 'Госконтракт')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-04-01', '2016-05-01', 'Не указано')
-----------
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-05-01', '2016-06-01', 'КО')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-05-01', '2016-06-01', 'Телеком')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-05-01', '2016-06-01', 'ГУ')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-05-01', '2016-06-01', 'Госконтракт')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-05-01', '2016-06-01', 'Не указано')
-----------
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-06-01', '2016-07-01', 'КО')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-06-01', '2016-07-01', 'Телеком')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-06-01', '2016-07-01', 'ГУ')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-06-01', '2016-07-01', 'Госконтракт')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-06-01', '2016-07-01', 'Не указано')
-----------
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-07-01', '2016-08-01', 'КО')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-07-01', '2016-08-01', 'Телеком')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-07-01', '2016-08-01', 'ГУ')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-07-01', '2016-08-01', 'Госконтракт')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-07-01', '2016-08-01', 'Не указано')
-----------
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-08-01', '2016-09-01', 'КО')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-08-01', '2016-09-01', 'Телеком')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-08-01', '2016-09-01', 'ГУ')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-08-01', '2016-09-01', 'Госконтракт')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-08-01', '2016-09-01', 'Не указано')
-----------
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-09-01', '2016-10-01', 'КО')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-09-01', '2016-10-01', 'Телеком')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-09-01', '2016-10-01', 'ГУ')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-09-01', '2016-10-01', 'Госконтракт')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-09-01', '2016-10-01', 'Не указано')
-----------
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-10-01', '2016-11-01', 'КО')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-10-01', '2016-11-01', 'Телеком')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-10-01', '2016-11-01', 'ГУ')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-10-01', '2016-11-01', 'Госконтракт')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-10-01', '2016-11-01', 'Не указано')
-----------
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-11-01', '2016-12-01', 'КО')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-11-01', '2016-12-01', 'Телеком')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-11-01', '2016-12-01', 'ГУ')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-11-01', '2016-12-01', 'Госконтракт')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-11-01', '2016-12-01', 'Не указано')
-----------
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-12-01', '2017-01-01', 'КО')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-12-01', '2017-01-01', 'Телеком')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-12-01', '2017-01-01', 'ГУ')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-12-01', '2017-01-01', 'Госконтракт')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2016-12-01', '2017-01-01', 'Не указано')
-----------
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-01-01', '2017-02-01', 'КО')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-01-01', '2017-02-01', 'Телеком')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-01-01', '2017-02-01', 'ГУ')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-01-01', '2017-02-01', 'Госконтракт')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-01-01', '2017-02-01', 'Не указано')
-----------
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-02-01', '2017-03-01', 'КО')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-02-01', '2017-03-01', 'Телеком')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-02-01', '2017-03-01', 'ГУ')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-02-01', '2017-03-01', 'Госконтракт')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-02-01', '2017-03-01', 'Не указано')
-----------
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-03-01', '2017-04-01', 'КО')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-03-01', '2017-04-01', 'Телеком')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-03-01', '2017-04-01', 'ГУ')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-03-01', '2017-04-01', 'Госконтракт')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-03-01', '2017-04-01', 'Не указано')
-----------
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-04-01', '2017-05-01', 'КО')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-04-01', '2017-05-01', 'Телеком')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-04-01', '2017-05-01', 'ГУ')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-04-01', '2017-05-01', 'Госконтракт')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-04-01', '2017-05-01', 'Не указано')
-----------
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-05-01', '2017-06-01', 'КО')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-05-01', '2017-06-01', 'Телеком')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-05-01', '2017-06-01', 'ГУ')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-05-01', '2017-06-01', 'Госконтракт')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-05-01', '2017-06-01', 'Не указано')
-----------
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-06-01', '2017-07-01', 'КО')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-06-01', '2017-07-01', 'Телеком')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-06-01', '2017-07-01', 'ГУ')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-06-01', '2017-07-01', 'Госконтракт')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-06-01', '2017-07-01', 'Не указано')
-----------
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-07-01', '2017-08-01', 'КО')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-07-01', '2017-08-01', 'Телеком')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-07-01', '2017-08-01', 'ГУ')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-07-01', '2017-08-01', 'Госконтракт')
union all
select mnt,company, svc_title,tariff,set_tariff,count_akb,sum_debet,imputed_cost,pr_min_price,nom,nom_name, seqment
from  ext.rt_fin_9 ('2017-07-01', '2017-08-01', 'Не указано')