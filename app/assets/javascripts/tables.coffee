$(document).ready ->
  $(".listing").dataTable
    bPaginate: true
    bLengthChange: true
    bFilter: true
    bSort: true
    bInfo: true
    bAutoWidth: true
    oLanguage:
      sSearch: "Busca rápida:"
      sEmptyTable: "Parece que não há nada por aqui, isso é tão triste..."
      sInfoEmpty: "Nada para mostrar"
      sLoadingRecords: "Aguarde... carregando."
      sProcessing: "Esta ação está um pouco lenta"
      sInfo: "Mostrando _START_ de _END_"
      sLengthMenu: 'Mostrar <select>'+
        '<option value="5">5</option>'+
        '<option value="10">10</option>'+
        '<option value="20">20</option>'+
        '<option value="40">40</option>'+
        '<option value="50">50</option>'+
        '<option value="-1">Todos</option>'+
        '</select> dados por página'
      oPaginate:
        sFirst: "Início"
        sLast: "Última"
        sNext: "Próxima"
        sPrevious: "Anterior"

  $(".show").dataTable
    bPaginate: true
    bLengthChange: false
    bFilter: true
    bSort: false
    bInfo: false
    bAutoWidth: false  
    oLanguage:
      sSearch: "Busca rápida:"
      sEmptyTable: "Parece que não há nada por aqui, isso é tão triste..."
      sInfoEmpty: "Nada para mostrar"
      sLoadingRecords: "Aguarde... carregando."
      sProcessing: "Esta ação está um pouco lenta"
      oPaginate:
        sFirst: "Início"
        sLast: "Última"
        sNext: "Próxima"
        sPrevious: "Anterior"

  $(".highlights").dataTable
    bPaginate: false
    bLengthChange: false
    bFilter: false
    bSort: false
    bInfo: false
    bAutoWidth: false
    oLanguage:
      sSearch: "Busca rápida:"
      sEmptyTable: "Parece que não há nada por aqui, isso é tão triste..."
      sInfoEmpty: "Nada para mostrar"
      sLoadingRecords: "Aguarde... carregando."
      sProcessing: "Esta ação está um pouco lenta"

  $(".favoriteList").dataTable
    bPaginate: false
    bLengthChange: false
    bFilter: false
    bSort: false
    bInfo: false
    bAutoWidth: false 
    oLanguage:
      sSearch: "Busca rápida:"
      sEmptyTable: "Parece que não há nada por aqui, isso é tão triste..."
      sInfoEmpty: "Nada para mostrar"
      sLoadingRecords: "Aguarde... carregando."
      sProcessing: "Esta ação está um pouco lenta"

  $(".categoriesList").dataTable
    bPaginate: false
    bLengthChange: false
    bFilter: false
    bSort: false
    bInfo: false
    bAutoWidth: false 
    oLanguage:
      sSearch: "Busca rápida:"
      sEmptyTable: "Parece que não há nada por aqui, isso é tão triste..."
      sInfoEmpty: "Nada para mostrar"
      sLoadingRecords: "Aguarde... carregando."
      sProcessing: "Esta ação está um pouco lenta"
      sInfo: "Mostrando _START_ de _END_"   

  $(".homeTables").dataTable
    bPaginate: true
    bLengthChange: true
    bFilter: true
    bSort: true
    bInfo: true
    bAutoWidth: true
    oLanguage:
      sSearch: "Busca rápida:"
      sEmptyTable: "Parece que não há nada por aqui, isso é tão triste..."
      sInfoEmpty: "Nada para mostrar"
      sLoadingRecords: "Aguarde... carregando."
      sProcessing: "Esta ação está um pouco lenta"
      sInfo: "Mostrando _START_ de _END_"
      sLengthMenu: 'Mostrar <select>'+
        '<option value="5">5</option>'+
        '<option value="10">10</option>'+
        '<option value="20">20</option>'+
        '<option value="40">40</option>'+
        '<option value="50">50</option>'+
        '<option value="-1">Todos</option>'+
        '</select> histórias por página'
      oPaginate:
        sFirst: "Início"
        sLast: "Última"
        sNext: "Próxima"
        sPrevious: "Anterior"    