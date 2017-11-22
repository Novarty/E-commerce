require 'rails_helper'

RSpec.describe Product, type: :model do
  before {@product = Product.new(name: "Example Product", amount: "100")}

  subject {@product}
  
  it { should respond_to(:name) }
  it { should respond_to(:amount) }

  it { should be_valid }

  describe "when name is not present" do
    before { @product.name = " "}
    it { should_not be_valid }
  end
  describe "when amount is not present" do
    before {@product.amount = " "}
    it { should_not be_valid }
  end
end
