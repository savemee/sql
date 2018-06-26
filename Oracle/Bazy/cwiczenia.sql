
SELECT id, SDO_GEOM.SDO_AREA(geometria, 0.1) "POLE POWIERZCHNI"
FROM zielen
ORDER BY id;

SELECT id, SDO_GEOM.SDO_AREA(geometria, 0.1) "POLE POWIERZCHNI"
FROM budynki
where SYMBOL='S'
ORDER BY id;

SELECT SUM(SDO_GEOM.SDO_AREA(geometria, 0.1)) "POLE POWIERZCHNI"
FROM budynki
ORDER BY id;


SELECT id, SDO_GEOM.SDO_LENGTH(w.geometria, m.diminfo) L
FROM DROGI_CHODNIKI w, USER_SDO_GEOM_METADATA m
WHERE m.table_name = 'DROGI_CHODNIKI' 
AND m.column_name = 'GEOMETRIA'
ORDER BY id;

SELECT id, SDO_GEOM.SDO_LENGTH(w.geometria, m.diminfo) L
FROM DROGI_CHODNIKI w, USER_SDO_GEOM_METADATA m
WHERE m.table_name = 'DROGI_CHODNIKI' 
AND m.column_name = 'GEOMETRIA' AND w.id=5
ORDER BY id;


SELECT w1.id, w2.id, SDO_GEOM.SDO_DISTANCE(w1.geometria, w2.geometria, 0.1) ODLEG�O�� 
FROM budynki w1, budynki w2 
WHERE w2.symbol='S'AND w1.symbol='BL_A'
ORDER BY w1.id, w2.id;

SELECT SDO_AGGR_MBR(geometria)
FROM zielen;

SELECT SDO_GEOM.SDO_CONVEXHULL(w.geometria, m.diminfo)
FROM budynki w, USER_SDO_GEOM_METADATA m
WHERE m.table_name = 'BUDYNKI' AND m.column_name = 'GEOMETRIA'
AND w.id=2;

SELECT SDO_GEOMETRY(
2003,
NULL,
NULL,
SDO_ELEM_INFO_ARRAY(1,1003,3), 
SDO_ORDINATE_ARRAY(13, 6, 15, 9))
FROM DUAL;

drop index drogi_chodniki_spatial_index;
CREATE INDEX drogi_chodniki_spatial_index
ON drogi_chodniki (geometria)
INDEXTYPE IS MDSYS.SPATIAL_INDEX;

drop index zielen_spatial_index;
CREATE INDEX zielen_spatial_index
ON zielen (geometria)
INDEXTYPE IS MDSYS.SPATIAL_INDEX;
select * from drogi_chodniki;

INSERT INTO USER_SDO_GEOM_METADATA VALUES(
'DROGI_CHOODNIKI',
'GEOMETRIA',
SDO_DIM_ARRAY(
SDO_DIM_ELEMENT('X', 0, 29, 0.1),
SDO_DIM_ELEMENT('Y', 0, 19, 0.1)
),
NULL -- SRID
);

SELECT id,symbol
FROM DROGI_CHODNIKI
WHERE SDO_FILTER(geometria, SDO_GEOMETRY(
2003,
NULL,
NULL,
SDO_ELEM_INFO_ARRAY(1,1003,3), 
SDO_ORDINATE_ARRAY(13, 6, 15, 9))
) = 'TRUE';
select
 SDO_GEOMETRY(
2003,
NULL,
NULL,
SDO_ELEM_INFO_ARRAY(1,1003,3), 
SDO_ORDINATE_ARRAY(13, 6, 15, 9))
from dual;

SELECT id
FROM DROGI_CHODNIKI
WHERE SDO_RELATE(geometria, 
SDO_GEOMETRY(
2003,
NULL,
NULL,
SDO_ELEM_INFO_ARRAY(1,1003,3), 
SDO_ORDINATE_ARRAY(13, 6, 15, 9)
),
'mask=anyinteract') = 'TRUE';

SELECT id
FROM ZIELEN
WHERE SDO_RELATE(geometria, 
SDO_GEOMETRY(
2003,
NULL,
NULL,
SDO_ELEM_INFO_ARRAY(1,1003,3), 
SDO_ORDINATE_ARRAY(4, 6, 14, 17)
),
'mask=anyinteract') = 'TRUE';

SELECT id
FROM zielen
WHERE SDO_RELATE(geometria, 
SDO_GEOMETRY(
2003,
NULL,
NULL,
SDO_ELEM_INFO_ARRAY(1,1003,3), 
SDO_ORDINATE_ARRAY(4, 1, 14, 4)
),
'mask=inside') = 'TRUE';

SELECT id 
FROM ZIELEN
WHERE SDO_WITHIN_DISTANCE(geometria, SDO_GEOMETRY(
2001,
NULL, 
SDO_POINT_TYPE(13,4, NULL),
NULL,
NULL)
,'distance<=2') = 'TRUE'; 
