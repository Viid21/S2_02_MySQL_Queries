USE universidad;
-- 1 Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
-- 2 Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
-- 3 Retorna el llistat dels alumnes que van néixer en 1999.
SELECT nombre FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';
-- 4 Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
SELECT nombre FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';
-- 5 Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
-- 6 Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT per.apellido1, per.apellido2, per.nombre, dep.nombre AS nombre_departamento FROM profesor pro JOIN persona per ON pro.id_profesor = per.id JOIN departamento dep ON pro.id_departamento = dep.id ORDER BY apellido1 ASC, nombre ASC;
-- 7 Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
SELECT asi.nombre, cur.anyo_inicio, cur.anyo_fin FROM alumno_se_matricula_asignatura mat JOIN asignatura asi ON mat.id_asignatura = asi.id JOIN curso_escolar cur ON mat.id_curso_escolar = cur.id JOIN persona per ON mat.id_alumno = per.id WHERE per.nif = '26902806M';
-- 8 Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT DISTINCT dep.nombre FROM departamento dep JOIN profesor pro ON dep.id = pro.id_departamento JOIN asignatura asi ON pro.id_profesor = asi.id_profesor JOIN grado gra ON asi.id_grado = gra.id WHERE gra.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
-- 9 Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT DISTINCT per.nombre, per.nif FROM persona per JOIN alumno_se_matricula_asignatura mat ON per.id = mat.id_alumno JOIN curso_escolar cur ON mat.id_curso_escolar = cur.id WHERE cur.anyo_inicio = 2018 AND cur.anyo_fin = 2019; 

-- LEFT JOIN and RIGHT JOIN
-- 1 Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT dep.nombre, per.apellido1, per.apellido2, per.nombre FROM persona per JOIN profesor pro ON pro.id_profesor = per.id LEFT JOIN departamento dep ON pro.id_departamento = dep.id ORDER BY dep.nombre ASC, per.apellido1 ASC, per.apellido2 ASC, per.nombre ASC; 
-- 2 Retorna un llistat amb els professors/es que no estan associats a un departament.
SELECT dep.nombre, per.apellido1, per.apellido2, per.nombre FROM persona per JOIN profesor pro ON pro.id_profesor = per.id LEFT JOIN departamento dep ON pro.id_departamento = dep.id WHERE pro.id_departamento IS NULL ORDER BY dep.nombre ASC, per.apellido1 ASC, per.apellido2 ASC, per.nombre ASC; 
-- 3 Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT dep.nombre, per.apellido1, per.apellido2, per.nombre FROM persona per JOIN profesor pro ON pro.id_profesor = per.id RIGHT JOIN departamento dep ON pro.id_departamento = dep.id ORDER BY dep.nombre ASC, per.apellido1 ASC, per.apellido2 ASC, per.nombre ASC; 
-- 4 Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
SELECT asi.nombre, per.apellido1, per.apellido2, per.nombre FROM persona per JOIN profesor pro ON per.id = pro.id_profesor LEFT JOIN asignatura asi ON pro.id_profesor = asi.id_profesor WHERE asi.id_profesor IS NULL ORDER BY asi.nombre ASC, per.apellido1 ASC, per.apellido2 ASC, per.nombre ASC; 
-- 5 Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT asi.nombre, per.apellido1, per.apellido2, per.nombre FROM persona per JOIN profesor pro ON per.id = pro.id_profesor RIGHT JOIN asignatura asi ON pro.id_profesor = asi.id_profesor WHERE asi.id_profesor IS NULL ORDER BY asi.nombre ASC, per.apellido1 ASC, per.apellido2 ASC, per.nombre ASC; 
-- 6 Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT DISTINCT dep.nombre FROM departamento dep LEFT JOIN profesor pro ON dep.id = pro.id_departamento LEFT JOIN asignatura asi ON pro.id_profesor = asi.id_profesor LEFT JOIN alumno_se_matricula_asignatura mat ON asi.id = mat.id_asignatura WHERE asi.id_profesor IS NULL ORDER BY dep.nombre ASC;

-- Consultes resum
-- 1 Retorna el nombre total d'alumnes que hi ha.
SELECT count(*) AS alumnos FROM persona WHERE tipo = 'alumno';
-- 2 Calcula quants alumnes van néixer en 1999.
SELECT count(*) AS alumnos FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';
-- 3 Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
SELECT dep.nombre, count(pro.id_profesor) AS profesores FROM profesor pro JOIN departamento dep ON pro.id_departamento = dep.id GROUP BY dep.nombre ORDER BY profesores DESC;
-- 4 Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.
SELECT dep.nombre, count(pro.id_profesor) AS profesores FROM profesor pro RIGHT JOIN departamento dep ON pro.id_departamento = dep.id GROUP BY dep.nombre ORDER BY profesores DESC;
-- 5 Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT gra.nombre, count(asi.id) AS asignaturas FROM asignatura asi RIGHT JOIN grado gra ON asi.id_grado = gra.id GROUP BY gra.nombre ORDER BY asignaturas DESC;