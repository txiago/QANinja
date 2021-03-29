require "httparty"

describe "GET /" do
  before do
    @resp = HTTParty.get("http://localhost:4567/")
  end

  it "Deve retornar 200" do
    expect(@resp.code).to eql 200
  end

  it "Deve retornar welcome" do
    #puts resp.parsed_response["message"]
    expect(@resp.parsed_response["message"]).to eql "Welcome to Book Api from QA Ninja!"
  end
end
