-- crear el stream de datos para el topico de item enriquecidos
CREATE STREAM enriched_items_by_department (
    name VARCHAR,
    department VARCHAR,
    barcode VARCHAR,
    amount INT,
    store INT
) WITH (
    KAFKA_TOPIC='enrich-item',
    VALUE_FORMAT='JSON'
);

-- obtener la metrica de ventas por departamento para el stream de datos de item enriquecidos
SELECT department, SUM(amount) FROM enriched_items_by_department
  WINDOW HOPPING (SIZE 120 SECONDS, ADVANCE BY 60 SECONDS)
  WHERE department='Toys' AND store=3
  GROUP BY store, department
  EMIT CHANGES;