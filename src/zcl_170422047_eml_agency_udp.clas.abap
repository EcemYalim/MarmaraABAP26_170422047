CLASS zcl_170422047_eml_agency_udp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_170422047_eml_agency_udp IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA agencies_upd TYPE TABLE FOR UPDATE /dmo/i_agencytp.
    agencies_upd = VALUE #(  ( agencyid = '070035'
                                   name = 'Hello New Name' ) ).
    MODIFY ENTITIES OF /dmo/i_agencytp
        ENTITY /dmo/agency
        UPDATE FIELDS ( name )
         WITH agencies_upd.
    COMMIT ENTITIES.

    out->write( 'Method execution finished!'  ).
  ENDMETHOD.
ENDCLASS.
