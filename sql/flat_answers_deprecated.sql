# We do not use this anymore, we use a view. Leaving it here just in case.

CREATE TABLE encuesta_flat_answers (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  recaptcha_score decimal(2,1),
  `salarymx` bigint(21),
  `salaryusd` bigint(21),
  `extramx` bigint(21),
  `extrausd` bigint(21),
  `variation` bigint(21),
  `english_num` bigint(21),
  `english_label` varchar(200),
  `age` bigint(21),
  `experience` bigint(21),
  `seniority` bigint(21),
  `country` varchar(200),
  `city` varchar(200),
  `profile` varchar(200),
  `edutype` varchar(200),
  `orgtype` varchar(200),
  `emptype` varchar(200),
  `remote` varchar(200),
  `gender` varchar(200),
  `education` varchar(200),
  `act_dba` varchar(1),
  `act_req` varchar(1),
  `act_arq` varchar(1),
  `act_bi` varchar(1),
  `act_cap` varchar(1),
  `act_dsc` varchar(1),
  `act_spi` varchar(1),
  `act_cons` varchar(1),
  `act_dir` varchar(1),
  `act_doc` varchar(1),
  act_techwrite varchar(1),
  `act_devops` varchar(1),
  `act_erp` varchar(1),
  `act_deng` varchar(1),
  `act_techsales` varchar(1),
  `act_prog` varchar(1),
  `act_front` varchar(1),
  `act_pm` varchar(1),
  `act_infosec` varchar(1),
  `act_soporte` varchar(1),
  `act_test` varchar(1),
  `act_uxd` varchar(1),
  `act_ventas` varchar(1),
  `lang_bash` varchar(1),
  `lang_csharp` varchar(1),
  `lang_clang` varchar(1),
  `lang_cobol` varchar(1),
  `lang_dart` varchar(1),
  `lang_delphi` varchar(1),
  `lang_elixir` varchar(1),
  `lang_assm` varchar(1),
  `lang_go` varchar(1),
  `lang_groovy` varchar(1),
  `lang_java` varchar(1),
  `lang_js` varchar(1),
  `lang_kotlin` varchar(1),
  `lang_objc` varchar(1),
  `lang_perl` varchar(1),
  `lang_php` varchar(1),
  `lang_plsql` varchar(1),
  `lang_python` varchar(1),
  `lang_rlang` varchar(1),
  `lang_ruby` varchar(1),
  `lang_rust` varchar(1),
  `lang_scala` varchar(1),
  `lang_swift` varchar(1),
  `lang_vbnet` varchar(1),
  `front_angular` varchar(1),
  `front_phonegap` varchar(1),
  `front_electron` varchar(1),
  `front_flutter` varchar(1),
  `front_ionic` varchar(1),
  `front_ntscript` varchar(1),
  `front_qt` varchar(1),
  `front_react` varchar(1),
  `front_unity` varchar(1),
  `front_vue` varchar(1),
  `front_xamarin` varchar(1),
  `db_dynamo` varchar(1),
  `db_cosmos` varchar(1),
  `db_cassandra` varchar(1),
  `db_elastic` varchar(1),
  `db_firebasert` varchar(1),
  `db_firestore` varchar(1),
  `db_DB2` varchar(1),
  `db_sqlserver` varchar(1),
  `db_mongoDB` varchar(1),
  `db_mysql` varchar(1),
  `db_neo4j` varchar(1),
  `db_oracle` varchar(1),
  `db_pgsql` varchar(1),
  `db_redis` varchar(1),
  `db_sap` varchar(1),
  `dsc_alteryx` varchar(1),
  `dsc_azureml` varchar(1),
  `dsc_dataiku` varchar(1),
  `dsc_domino` varchar(1),
  `dsc_h2o` varchar(1),
  `dsc_watson` varchar(1),
  `dsc_knime` varchar(1),
  `dsc_rapidminer` varchar(1),
  `dsc_sas` varchar(1),
  `dsc_tf` varchar(1),
  `infra_ansible` varchar(1),
  `infra_chef` varchar(1),
  `infra_docker` varchar(1),
  `infra_k8s` varchar(1),
  `infra_oshift` varchar(1),
  `infra_ostack` varchar(1),
  `infra_puppet` varchar(1),
  `infra_terraform` varchar(1),
  `infra_vmware` varchar(1),
  `cert_agile` varchar(1),
  `cert_android` varchar(1),
  `cert_awsdev` varchar(1),
  `cert_awsarch` varchar(1),
  `cert_ba` varchar(1),
  `cert_cisco` varchar(1),
  `cert_cobit` varchar(1),
  `cert_entarch` varchar(1),
  `cert_cgeit` varchar(1),
  `cert_gcloudarch` varchar(1),
  `cert_gdata` varchar(1),
  `cert_gweb` varchar(1),
  `cert_itilint` varchar(1),
  `cert_itilpra` varchar(1),
  `cert_java` varchar(1),
  `cert_linux` varchar(1),
  `cert_msass` varchar(1),
  `cert_msexp` varchar(1),
  `cert_oracle` varchar(1),
  `cert_pmp` varchar(1),
  `cert_sap` varchar(1),
  `cert_scrum` varchar(1),
  `cert_infosec` varchar(1),
  `cert_sixsigma` varchar(1),
  `cert_testing2` varchar(1),
  `cert_testing1` varchar(1),
  `ben_equity` varchar(1),
  `ben_car` varchar(1),
  `ben_family` varchar(1),
  `ben_edu` varchar(1),
  `ben_bonus` varchar(1),
  `ben_housing` varchar(1),
  `ben_parking` varchar(1),
  `ben_gas` varchar(1),
  `ben_gym` varchar(1),
  `ben_flexhours` varchar(1),
  `ben_homeoffice` varchar(1),
  `ben_loan` varchar(1),
  `ben_healthmajor` varchar(1),
  `ben_healthminor` varchar(1),
  `ben_lifeins` varchar(1),
  `ben_cafeteria` varchar(1),
  `ben_cellphone` varchar(1),
  `ben_vouchers` varchar(1),
  PRIMARY KEY (`id`)
);

insert into encuesta_flat_answers 
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
    i.slug = 'activities' AND answer LIKE '%dsc%' ) AS act_dsc,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%spi%' ) AS act_spi,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%cons%' ) AS act_cons,
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
    i.slug = 'activities' AND answer LIKE '%devops%' ) AS act_devops,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%erp%' ) AS act_erp,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%deng%' ) AS act_deng,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%techsales%' ) AS act_techsales,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%prog%' ) AS act_prog,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%front%' ) AS act_front,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'activities' AND answer LIKE '%pm%' ) AS act_pm,
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
    i.slug = 'lang' AND answer LIKE '%bash%' ) AS lang_bash,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%csharp%' ) AS lang_csharp,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%clang%' ) AS lang_clang,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%cobol%' ) AS lang_cobol,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%dart%' ) AS lang_dart,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%delphi%' ) AS lang_delphi,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%elixir%' ) AS lang_elixir,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%assm%' ) AS lang_assm,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%go%' ) AS lang_go,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%groovy%' ) AS lang_groovy,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%java%' ) AS lang_java,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%js%' ) AS lang_js,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%kotlin%' ) AS lang_kotlin,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%objc%' ) AS lang_objc,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%perl%' ) AS lang_perl,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%php%' ) AS lang_php,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%plsql%' ) AS lang_plsql,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%python%' ) AS lang_python,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%rlang%') AS lang_rlang,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%ruby%' ) AS lang_ruby,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%rust%' ) AS lang_rust,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%scala%' ) AS lang_scala,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%swift%' ) AS lang_swift,
  ( SELECT 'Y' FROM encuesta_answeritem i
    WHERE i.answerset_id = s.id AND  
    i.slug = 'lang' AND answer LIKE '%vbnet%' ) AS lang_vbnet,
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
    i.slug = 'benefits' AND answer LIKE '%vouchers%' ) AS ben_vouchers
FROM encuesta_answerset s
ORDER by s.id;