CLASS zcl_3_factory_tester DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
         INTERFACES IF_OO_ADT_CLASSRUN.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_3_FACTORY_TESTER IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*     data(direct_instance) = new zcl_3_factory( 'Try without Factory'  ).
     data(factory_instance) = zcl_3_factory=>factory( 'Try with Factory' ).
     out->write( factory_instance->get_stored_stuff(  ) ).
  ENDMETHOD.
ENDCLASS.
