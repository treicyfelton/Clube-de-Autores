$(document).ready ->  
  images = ['http://img.submarino.com.br/imagens/homeinterna/kits-gifts-cool-books-fulltop.jpg', 'http://img.submarino.com.br/imagens/homeinterna/150bestsellers-70desc-full.png', 'http://img.submarino.com.br/imagens/homeinterna/500-livros-editora-record-full.png', 'http://img.submarino.com.br/imagens/homeinterna/geracao-nerd-70desc-full3.png']
  i = Math.floor(Math.random() * images.length)
  $('#advertising_horizontal').css({'background-image': 'url('+images[i]+')'})