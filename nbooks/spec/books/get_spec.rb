require "httparty"

describe "GET /books" do
  before do
    @resp = HTTParty.get("http://localhost:4567/books")
  end

  it "Deve retornar uma lista" do
    expect(@resp.code).to eql 200
  end

  it "Deve retornar uma lista" do
    #puts resp.parsed_response["message"]
    puts @resp.parsed_response
    puts @resp.parsed_response.class
    expect(@resp.parsed_response.size).to be >= 0
    expect(@resp.parsed_response.class).to eql Array
  end
end
