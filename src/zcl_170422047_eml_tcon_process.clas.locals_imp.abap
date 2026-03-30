*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_connection_eml DEFINITION.

  PUBLIC SECTION.

    CLASS-METHODS:
      insert_data,
      read_data,
      update_data,
      delete_data.
ENDCLASS.

CLASS lcl_connection_eml IMPLEMENTATION.

  METHOD insert_data.

    DATA: lt_create TYPE TABLE FOR CREATE zr_tcon_170422047.
    lt_create = VALUE #(
       ( %cid     = 'C1'
         Carrid   = 'LH'
         Connid   = '0400'
         AirportFrom = 'FRA'
         CityFrom  = 'Frankfurt'
         CountryFrom = 'DE'
         AirportTo = 'JFK'
         CityTo = 'New York'
         CountryTo = 'US' )

         ( %cid     = 'C2'
         Carrid   = 'AH'
         Connid   = '0600'
         AirportFrom = 'RA'
         CityFrom  = 'Frafurt'
         CountryFrom = 'DAE'
         AirportTo = 'JOK'
         CityTo = 'New AYork'
         CountryTo = 'USA' )

         ( %cid     = 'C5'
         Carrid   = 'HH'
         Connid   = '9400'
         AirportFrom = 'RAN'
         CityFrom  = 'Franfurt'
         CountryFrom = 'DYE'
         AirportTo = 'JFK'
         CityTo = 'NewA York'
         CountryTo = 'UAS' ) ).

    MODIFY ENTITIES OF zr_tcon_170422047
      ENTITY ZrTcon170422047
        CREATE FIELDS (
                 Carrid
                 Connid
                 AirportFrom
                 CityFrom
                 CountryFrom
                 AirportTo
                 CityTo
                 CountryTo
                 ) WITH lt_create
      FAILED    DATA(ls_failed).

    IF ls_failed IS INITIAL.
      COMMIT ENTITIES.
    ENDIF.
  ENDMETHOD.

  METHOD read_data.
    DATA read_keys TYPE TABLE FOR READ IMPORT zr_tcon_170422047.
    DATA connection     TYPE TABLE FOR READ RESULT zr_tcon_170422047.

    read_keys = VALUE #( ( uuid = '763C8701C43C1FE18B85F64746010DE0' ) ).


    READ ENTITIES OF zr_tcon_170422047
      ENTITY ZrTcon170422047
      ALL FIELDS
      WITH CORRESPONDING #( read_keys )
      RESULT connection.
  ENDMETHOD.

  METHOD update_data.
    DATA  lt_update TYPE TABLE FOR UPDATE zr_tcon_170422047.

    SELECT uuid
      FROM ztcon_170422047
      WHERE uuid = '763C8701C43C1FE18B85F64746010DE0'
      INTO TABLE @DATA(lt_keys)
      UP TO 1 ROWS.

    LOOP AT lt_keys INTO DATA(ls_key).
      lt_update = VALUE #( (
         uuid = ls_key-uuid
         CityTo = 'Paris'
         %control-CityTo = if_abap_behv=>mk-on ) ).
    ENDLOOP.

    MODIFY ENTITIES OF zr_tcon_170422047
      ENTITY ZrTcon170422047
      UPDATE FROM lt_update
      FAILED   DATA(ls_failed).

    IF ls_failed IS INITIAL.
      COMMIT ENTITIES.
    ENDIF.
  ENDMETHOD.

  METHOD delete_data.
    DATA lt_delete TYPE TABLE FOR DELETE zr_tcon_170422047.

    lt_delete = VALUE #( ( uuid = '763C8701C43C1FE18B85F64746010DE0'  )  ).

    MODIFY ENTITIES OF zr_tcon_170422047
        ENTITY ZrTcon170422047
        DELETE FROM lt_delete
        FAILED   DATA(ls_failed).

    IF ls_failed IS INITIAL.
      COMMIT ENTITIES.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
