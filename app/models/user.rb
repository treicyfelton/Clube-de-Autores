# encoding: utf-8
require 'digest/sha1'
class User < ActiveRecord::Base

  has_many :histories, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  has_many :rates, :dependent => :destroy

  attr_protected :password, :admin, :moderator
  attr_accessible :born_at, :email, :hobby, :name, :nick, :situation, :plain_password
   validates :name, presence: true, length: {maximum:50}, format: {with: /^[a-zA-ZçÇà-úÀ-Ú ]+$/}
   validates :email, presence: true, uniqueness: true, format: {with:/^[a-zA-ZçÇ0-9_.-]+@([a-zA-ZçÇ0-9_ -]+\.)+[a-zA-Z]{2,4}$/}
   validates :nick, presence: true, uniqueness: true, format: {with:/^\w+([\. -]?\w+)*([a-zA-Z0-9])$/}
   validate :situation, allow_blank: true
   validate :hobby, allow_blank: true


  def plain_password=(password)
    raise StandardError.new("Senha não pode ficar em branco") if password.blank? && self.password.blank?
    raise StandardError.new("Tamanho de senha inválido!") if !(4..15).include?(password.size)    
    self.password = self.class.encrypt_password(password)
  end

  def plain_password
    ""
  end

  def self.encrypt_password(password)
    Digest::SHA1.hexdigest("abc_#{password}_123")
  end

  def self.auth(email,password)
    where(["email=? and password=?",email,encrypt_password(password)]).first
  end

  def allowed_history(history)
    self.born_at < history.classification.min_age.years.ago.to_date 
  end

end
