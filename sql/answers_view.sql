CREATE OR REPLACE VIEW answers_view AS
SELECT s.id, s.created, s.recaptcha_score, 
  ( SELECT if(answer='', 0, cast(answer as signed)) FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'salarymx') AS salarymx,
  ( SELECT if(answer='', 0, cast(answer as signed)) FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'salaryusd') AS salaryusd,
  ( SELECT if(answer='', 0, cast(answer as signed)) FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'extramx') AS extramx,
  ( SELECT if(answer='', 0, cast(answer as signed)) FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'extrausd') AS extrausd,
  ( SELECT if(answer='', 0, cast(answer as signed)) FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'variation') AS variation,
  ( SELECT if(answer='', 0, cast(answer as signed)) FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'english') AS english_num,
  ( SELECT c.text FROM encuesta_answeritem i, encuesta_choice c
    WHERE answerset_id = s.id AND i.answer = c.`key` AND i.slug = 'english') AS english_label,   
  ( SELECT if(answer='', 0, cast(answer as signed)) FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'age') AS age,
  ( SELECT if(answer='', 0, cast(answer as signed)) FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'experience') AS experience,
  ( SELECT if(answer='', 0, cast(answer as signed)) FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'seniority') AS seniority,
  ( SELECT c.text FROM encuesta_answeritem i, encuesta_choice c
    WHERE answerset_id = s.id AND i.answer = c.`key` AND i.slug = 'country') AS country,   
  ( SELECT trim(answer) FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'city') AS city,
  ( SELECT answer FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'profile') AS profile,
  ( SELECT answer FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'edutype') AS edutype,
  ( SELECT answer FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'orgtype') AS orgtype,
  ( SELECT answer FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'emptype') AS emptype,
  ( SELECT answer FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'remote') AS remote,
  ( SELECT answer FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'gender') AS gender,
  ( SELECT answer FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'education') AS education,    
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%dba%' ) AS act_dba,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%req%' ) AS act_req,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%arq%' ) AS act_arq,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%bi%' ) AS act_bi,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%cap%' ) AS act_cap,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%datascience%' ) AS act_dsc,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%spi%' ) AS act_spi,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%cons%' ) AS act_cons,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%prog%' ) AS act_prog,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%mobile%' ) AS act_mobile,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%front%' ) AS act_front,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%devrel%' ) AS act_devrel,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%dir%' ) AS act_dir,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%doc%' ) AS act_doc,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%techwrite%' ) AS act_techwrite,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%infra%' ) AS act_devops,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%erp%' ) AS act_erp,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%dataeng%' ) AS act_deng,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%techsales%' ) AS act_techsales,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%pm%' ) AS act_pm,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%iot%' ) AS act_iot,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%infosec%' ) AS act_infosec,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%soporte%' ) AS act_soporte,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%test%' ) AS act_test,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%uxd%' ) AS act_uxd,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%ventas%' ) AS act_ventas,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'prog' AND answer LIKE '%bash%' ) AS lang_bash,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'prog' AND answer LIKE '%csharp%' ) AS lang_csharp,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'prog' AND answer LIKE '%clang%' ) AS lang_clang,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'prog' AND answer LIKE '%cobol%' ) AS lang_cobol,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'prog' AND answer LIKE '%delphi%' ) AS lang_delphi,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'prog' AND answer LIKE '%elixir%' ) AS lang_elixir,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'prog' AND answer LIKE '%go%' ) AS lang_go,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'prog' AND answer LIKE '%groovy%' ) AS lang_groovy,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'prog' AND answer LIKE '%java%' ) AS lang_java,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'prog' AND answer LIKE '%js%' ) AS lang_js,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'prog' AND answer LIKE '%kotlin%' ) AS lang_kotlin,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'prog' AND answer LIKE '%perl%' ) AS lang_perl,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'prog' AND answer LIKE '%php%' ) AS lang_php,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'prog' AND answer LIKE '%plsql%' ) AS lang_plsql,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'prog' AND answer LIKE '%python%' ) AS lang_python,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'prog' AND answer LIKE '%ruby%' ) AS lang_ruby,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'prog' AND answer LIKE '%rust%' ) AS lang_rust,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'prog' AND answer LIKE '%scala%' ) AS lang_scala,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'prog' AND answer LIKE '%swift%' ) AS lang_swift,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'prog' AND answer LIKE '%vbnet%' ) AS lang_vbnet,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'front' AND answer LIKE '%angular%' ) AS front_angular,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'front' AND answer LIKE '%phonegap%' ) AS front_phonegap,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'front' AND answer LIKE '%electron%' ) AS front_electron,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'front' AND answer LIKE '%flutter%' ) AS front_flutter,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'front' AND answer LIKE '%ionic%' ) AS front_ionic,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'front' AND answer LIKE '%ntscript%' ) AS front_ntscript,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'front' AND answer LIKE '%qt%' ) AS front_qt,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'front' AND answer LIKE '%react%' ) AS front_react,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'front' AND answer LIKE '%unity%' ) AS front_unity,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'front' AND answer LIKE '%vue%' ) AS front_vue,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'front' AND answer LIKE '%xamarin%' ) AS front_xamarin,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'db' AND answer LIKE '%dynamo%' ) AS db_dynamo,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'db' AND answer LIKE '%cosmos%' ) AS db_cosmos,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'db' AND answer LIKE '%cassandra%' ) AS db_cassandra,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'db' AND answer LIKE '%elastic%' ) AS db_elastic,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'db' AND answer LIKE '%firebasert%' ) AS db_firebasert,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'db' AND answer LIKE '%firestore%' ) AS db_firestore,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'db' AND answer LIKE '%DB2%' ) AS db_DB2,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'db' AND answer LIKE '%sqlserver%' ) AS db_sqlserver,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'db' AND answer LIKE '%mongoDB%' ) AS db_mongoDB,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'db' AND answer LIKE '%mysql%' ) AS db_mysql,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'db' AND answer LIKE '%neo4j%' ) AS db_neo4j,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'db' AND answer LIKE '%oracle%' ) AS db_oracle,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'db' AND answer LIKE '%pgsql%' ) AS db_pgsql,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'db' AND answer LIKE '%redis%' ) AS db_redis,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'db' AND answer LIKE '%sap%' ) AS db_sap,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'datascience' AND answer LIKE '%alteryx%' ) AS dsc_alteryx,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'datascience' AND answer LIKE '%azureml%' ) AS dsc_azureml,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'datascience' AND answer LIKE '%dataiku%' ) AS dsc_dataiku,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'datascience' AND answer LIKE '%domino%' ) AS dsc_domino,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'datascience' AND answer LIKE '%h2o%' ) AS dsc_h2o,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'datascience' AND answer LIKE '%watson%' ) AS dsc_watson,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'datascience' AND answer LIKE '%knime%' ) AS dsc_knime,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'datascience' AND answer LIKE '%rapidminer%' ) AS dsc_rapidminer,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'datascience' AND answer LIKE '%sas%' ) AS dsc_sas,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'datascience' AND answer LIKE '%tf%' ) AS dsc_tf,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'infrastructure' AND answer LIKE '%ansible%' ) AS infra_ansible,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'infrastructure' AND answer LIKE '%chef%' ) AS infra_chef,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'infrastructure' AND answer LIKE '%docker%' ) AS infra_docker,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'infrastructure' AND answer LIKE '%k8s%' ) AS infra_k8s,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'infrastructure' AND answer LIKE '%oshift%' ) AS infra_oshift,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'infrastructure' AND answer LIKE '%ostack%' ) AS infra_ostack,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'infrastructure' AND answer LIKE '%puppet%' ) AS infra_puppet,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'infrastructure' AND answer LIKE '%terraform%' ) AS infra_terraform,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'infrastructure' AND answer LIKE '%vmware%' ) AS infra_vmware,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%agile%' ) AS cert_agile,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%android%' ) AS cert_android,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%awsdev%' ) AS cert_awsdev,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%awsarch%' ) AS cert_awsarch,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%ba%' ) AS cert_ba,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%cisco%' ) AS cert_cisco,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%cobit%' ) AS cert_cobit,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%entarch%' ) AS cert_entarch,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%cgeit%' ) AS cert_cgeit,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%gcloudarch%' ) AS cert_gcloudarch,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%gdata%' ) AS cert_gdata,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%gweb%' ) AS cert_gweb,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%itilint%' ) AS cert_itilint,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%itilpra%' ) AS cert_itilpra,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%java%' ) AS cert_java,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%linux%' ) AS cert_linux,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%msass%' ) AS cert_msass,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%msexp%' ) AS cert_msexp,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%oracle%' ) AS cert_oracle,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%pmp%' ) AS cert_pmp,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%sap%' ) AS cert_sap,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%scrum%' ) AS cert_scrum,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%infosec%' ) AS cert_infosec,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%sixsigma%' ) AS cert_sixsigma,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%testing2%' ) AS cert_testing2,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'certification' AND answer LIKE '%testing1%' ) AS cert_testing1,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'benefits' AND answer LIKE '%equity%' ) AS ben_equity,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'benefits' AND answer LIKE '%car%' ) AS ben_car,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'benefits' AND answer LIKE '%family%' ) AS ben_family,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'benefits' AND answer LIKE '%edu%' ) AS ben_edu,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'benefits' AND answer LIKE '%bonus%' ) AS ben_bonus,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'benefits' AND answer LIKE '%housing%' ) AS ben_housing,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'benefits' AND answer LIKE '%parking%' ) AS ben_parking,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'benefits' AND answer LIKE '%gas%' ) AS ben_gas,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'benefits' AND answer LIKE '%gym%' ) AS ben_gym,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'benefits' AND answer LIKE '%flexhours%' ) AS ben_flexhours,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'benefits' AND answer LIKE '%homeoffice%' ) AS ben_homeoffice,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'benefits' AND answer LIKE '%loan%' ) AS ben_loan,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'benefits' AND answer LIKE '%healthmajor%' ) AS ben_healthmajor,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'benefits' AND answer LIKE '%healthminor%' ) AS ben_healthminor,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'benefits' AND answer LIKE '%lifeins%' ) AS ben_lifeins,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'benefits' AND answer LIKE '%cafeteria%' ) AS ben_cafeteria,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'benefits' AND answer LIKE '%cellphone%' ) AS ben_cellphone,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'benefits' AND answer LIKE '%vouchers%' ) AS ben_vouchers,
  ( SELECT answer FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'covid-remoto') AS covid_remoto,
  ( SELECT answer FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'covid-salario') AS covid_salario,
  ( SELECT answer FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'covid-carga') AS covid_carga,
  ( SELECT answer FROM encuesta_answeritem i
    WHERE answerset_id = s.id AND i.slug = 'covid-apoyo') AS covid_apoyo
FROM encuesta_answerset s
WHERE s.created > DATE_SUB(NOW(), INTERVAL 1 YEAR)
ORDER by s.id;

