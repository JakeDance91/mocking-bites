require "CatFacts"

RSpec.describe CatFacts do
  it "returns a cat fact when provide method is called" do
    requester_double = double :requester
    allow(requester_double).to receive(:get)
    .with(URI("https://catfact.ninja/fact"))
    .and_return('{"fact":"Cats can be taught to walk on a leash, but a lot of time and patience is required to teach them. The younger the cat is, the easier it will be for them to learn.","length":161}')

    catfact = CatFacts.new(requester_double)
    expect(catfact.provide).to eq "Cat fact: Cats can be taught to walk on a leash, but a lot of time and patience is required to teach them. The younger the cat is, the easier it will be for them to learn."
  end
end

