require "sinatra"
require "sinatra/namespace"
require "mongoid"

# DB Cnnect
Mongoid.load! "mongoid.yml"

# Model
class Book
  include Mongoid::Document

  field :title, type: String
  field :author, type: String
  field :isbn, type: String
end

get "/" do
  content_type "application/json"
  return {
           message: "Welcome to Book Api from QA Ninjaa!",
         }.to_json
end

namespace "/books" do
  before do
    content_type "application/json"
  end

  get do
    return Book.all.to_json
  end

  post do
    payload = JSON.parse(request.body.read)
    book = Book.new(payload)
    book.save
    status 201
    return book.to_json
  end
end

# Dados hardcoded da API
#books = [
#  { title: "Dom Casmurro", author: "Machado de Assis", isbn: "abc2001" },
#  { title: "A marca de uma lágrima", author: "Pedro Bandeira", isbn: "abc2002" },
#  { title: "Moby Dick", author: "Herman Melville", isbn: "abc2003" },
#]
#return books.to_json
