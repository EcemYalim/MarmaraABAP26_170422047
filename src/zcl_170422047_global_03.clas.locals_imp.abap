
*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.
    CLASS-DATA conn_counter TYPE i.

    CLASS-METHODS class_constructor.

    METHODS constructor
      IMPORTING
        i_carrier_id    TYPE /dmo/carrier_id OPTIONAL
        i_connection_id TYPE /dmo/connection_id
        i_status        TYPE int4
        i_flight_date   TYPE dats
      RAISING
        cx_ABAP_INVALID_VALUE.

    METHODS set_attributes
      IMPORTING
        i_carrier_id    TYPE /dmo/carrier_id OPTIONAL
        i_connection_id TYPE /dmo/connection_id
        i_status        TYPE int4
        i_flight_date   TYPE dats.

    METHODS get_attributes
      EXPORTING
        e_carrier_id    TYPE /dmo/carrier_id
        e_connection_id TYPE /dmo/connection_id
        e_status        TYPE int4
        e_flight_date   TYPE dats.


  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    DATA status TYPE int4.
    DATA flight_date TYPE dats.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD class_constructor.
  ENDMETHOD.

  METHOD constructor.
    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.
    me->carrier_id = i_carrier_id.
    me->connection_id = i_connection_id.
    me->status = i_status.
    me->flight_date = i_flight_date.
    conn_counter = conn_counter + 1.
  ENDMETHOD.


  METHOD get_attributes.

    e_carrier_id = carrier_id.
    e_connection_id = connection_id.
    e_status = status.
    e_flight_date = flight_date.

  ENDMETHOD.

  METHOD set_attributes.
    carrier_id = i_carrier_id.
    connection_id = i_connection_id.
    status = i_status.
    flight_date = i_flight_date.
  ENDMETHOD.

ENDCLASS.
