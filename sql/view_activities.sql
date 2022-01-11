create or replace view view_activities as 
SELECT 'Administración de bases de datos' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_dba= 'Y' UNION 
SELECT 'Análisis de requerimientos' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_req= 'Y' UNION 
SELECT 'Arquitectura y diseño de sistemas' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_arq= 'Y' UNION 
SELECT 'Business Intelligence' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_bi= 'Y' UNION 
SELECT 'Capacitación y evangelización' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_cap= 'Y' UNION 
SELECT 'Ciencia de datos' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_dsc= 'Y' UNION 
SELECT 'Gestión de infraestructura (SysOps, DevOps)' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_devops= 'Y' UNION 
SELECT 'Ingeniería de datos' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_deng= 'Y' UNION 
SELECT 'Coaching y mejora de procesos' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_spi= 'Y' UNION 
SELECT 'Consultoría de negocio' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_cons= 'Y' UNION 
SELECT 'Dirección / Estrategia' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_dir= 'Y' UNION 
SELECT 'Docencia' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_doc= 'Y' UNION 
SELECT 'User Experience Design' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_uxd= 'Y' UNION 
SELECT 'Implantación de sistemas empresariales (ERPs y similar)' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_erp= 'Y' UNION 
SELECT 'Programación back-end (procesamiento, lógica, datos)' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_prog= 'Y' UNION 
SELECT 'Programación front-end' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_front= 'Y' UNION 
SELECT 'Project management / Coordinación' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_pm= 'Y' UNION 
SELECT 'Preventa / tech Sales' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_techsales= 'Y' UNION 
SELECT 'Seguridad de información' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_infosec= 'Y' UNION 
SELECT 'Soporte técnico' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_soporte= 'Y' UNION 
SELECT 'Testing' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_test= 'Y' UNION 
SELECT 'Venta y desarrollo de negocios' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_ventas= 'Y' UNION 
SELECT 'Documentación (technical writing)' as lang, count(*) as n, round(avg(salarymx)) as salario_mensual_pesos from encuesta_flat_answers v where act_techwrite= 'Y'
;