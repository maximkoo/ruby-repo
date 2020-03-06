--
--
SET DEFINE OFF

ALTER TABLE liability_payment ADD (alt_payment_type_id NUMBER(10));

COMMENT ON COLUMN liability_payment.alt_payment_type_id IS 'Идентификатор вида альтернативного платежа по таблице ALT_PAYMENT_TYPE';

ALTER TABLE xls_alterpay ADD (alt_payment_type_id NUMBER(10),alt_payment_type_name VARCHAR2(255 BYTE));

COMMENT ON COLUMN xls_alterpay.alt_payment_type_id IS 'Идентификатор вида альтернативного платежа по таблице ALT_PAYMENT_TYPE';

COMMENT ON COLUMN xls_alterpay.alt_payment_type_name IS 'Наименование вида альтернативного платежа';

CREATE TABLE alt_payment_type (
  alt_payment_type_id NUMBER(10) NOT NULL,
  full_name VARCHAR2(80 BYTE),
  short_name VARCHAR2(80 BYTE),
  "TAG" VARCHAR2(16 BYTE),
  sort_no VARCHAR2(10 BYTE),
  CONSTRAINT pk_alt_payment_type PRIMARY KEY (alt_payment_type_id)
);

COMMENT ON TABLE alt_payment_type IS 'Виды альтернативных платежей [DICT]';

COMMENT ON COLUMN alt_payment_type.sort_no IS 'Номер для сортировки в формах';

ALTER TABLE all_payment ADD (alt_payment_type_id NUMBER(10));

COMMENT ON COLUMN all_payment.alt_payment_type_id IS 'Идентификатор вида альтернативного платежа по таблице ALT_PAYMENT_TYPE';

SET DEFINE ON