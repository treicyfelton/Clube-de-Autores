class ContactMailer < ActionMailer::Base 
	default :from => 'treicyfelton@gmail.com'   

	def contact_message(contact) 
		@contact = contact 
		mail(:to => 'treicy.bootcamp@clickjogos.com.br', :subject => 'Mensagem de Contato') 
	end 
end