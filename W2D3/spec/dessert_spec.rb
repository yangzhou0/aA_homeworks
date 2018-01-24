require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  #-------------------ask question about this-------------#  what does the name:"TOm do?" can we delete it? because it wont affect
  let(:chef) { double("chef"), name: 'Tom'}
  subject (:dessert) {Dessert.new('cake', 10, chef)}
  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('cake')
    end

    it "sets a quantity" do
    expect(dessert.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
    expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new('cake', 'hi', chef}.to raise_error(ArgumentError)

    end


  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array"do
      expect(dessert.ingredients).to_not include('flour')
      dessert.add_ingredient('flour')
      expect(desert.ingredients).to include('flour')
    end
  end

#-------------------ask question about this-------------#
  describe "#mix!" do
    it "shuffles the ingredient array" do
      INGREDIENTS = ['chocolate','flour','sugar','oil']
      expect(dessert).to_not eq(dessert.mix!)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(5)
      expect(dessert.quantity).to eq(5)
    end


    it "raises an error if the amount is greater than the quantity" do
      expect{dessert.eat(20)}.to raise_error("not enough left!")
    end

  end
# ask a question here: why this still retunrs 10 instead of 5 because we call dessert(5) earlier?
  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow (chef).to receive(:titleize).and_return("Chef Tom the Great Baker")
      expect(dessert.serve).to eq("Chef Tom the Great Baker has made 10 cakes")
    end

  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
