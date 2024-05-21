with
    fonte_funcionarios as (
        select
            cast(businessentityid as  int) as  fk_pessoa
            ,cast(nationalidnumber  as  int) as  numero_identifcacao
            ,cast(loginid  as  varchar) as  id_login
            ,cast(jobtitle  as  varchar) as  cargo
            ,cast(birthdate as  date) as  aniversario
            ,cast(maritalstatus  as  varchar) as  estado_civil
            ,cast(gender  as  varchar) as  genero
            ,cast(hiredate  as  date) as  data_admissao
            ,cast(salariedflag  as  boolean) as  flag_salario
            ,cast(vacationhours as  number) as  hora_ferias
            ,cast(sickleavehours  as  number) as  hora_doente
            ,cast(currentflag  as  boolean) as  flag_bandeira
            ,cast(rowguid  as  varchar) as  rowguid 
            ,cast(modifieddate  as  date) as  data_modificacao
            ,cast(organizationnode  as  varchar) as  organizacao
        from {{ source("aw", "Employee") }}
    )
select *
from fonte_funcionarios