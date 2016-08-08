require 'mida/datatype'

describe Mida::DataType::Boolean do

  it '#parse should raise an exception if a invalid text passed' do
    test = lambda {Mida::DataType::Boolean.parse('example')}
    expect(test).to raise_error(ArgumentError)
  end

  it '#parse should raise an exception if value is empty' do
    test = lambda {Mida::DataType::Boolean.parse('')}
    expect(test).to raise_error(ArgumentError)
  end

  it '#parse should return true for "True" whatever the case' do
    ['true', 'True', 'TRUE', 'tRUE'].each do |true_text|
      expect(Mida::DataType::Boolean.parse(true_text)).to be_truthy
    end
  end

  it '#parse should return false for "False" whatever the case' do
    ['false', 'False', 'FALSE', 'fALSE'].each do |false_text|
      expect(Mida::DataType::Boolean.parse(false_text)).to be_falsey
    end
  end

  it '#to_s should return proper string representation of boolean' do
    expect(Mida::DataType::Boolean.parse('fALSE').to_s).to eq('False')
    expect(Mida::DataType::Boolean.parse('tRUE').to_s).to eq('True')
  end

  it '! should negate as if a TrueClass/FalseClass' do
    true_boolean = Mida::DataType::Boolean.parse('true')
    false_boolean = Mida::DataType::Boolean.parse('false')

    expect(!true_boolean).to be_falsey
    expect(!false_boolean).to be_truthy
  end

end
