RSpec.describe Dig::Block do
  it "has a version number" do
    expect(Dig::Block::VERSION).not_to be nil
  end

  context Array do
    it "Extracts the nested value specified by the sequence of idx objects by calling dig at each step." do
      expect([1, [2]].dig(1, 0)).to eq(2)
    end

    it "Returning nil if any intermediate step is nil." do
      expect([1, [2]].dig(1, 1)).to eq(nil)
    end

    it "If the optional code block is specified, then that will be run and its result returned." do
      expect([1, [2]].dig(1, 1) { 2 }).to eq(2)
    end
  end

  context Hash do
    it "Extracts the nested value specified by the sequence of idx objects by calling dig at each step." do
      expect({ a: 1, b: { c: 2 }}.dig(:b, :c)).to eq(2)
    end

    it "Returning nil if any intermediate step is nil." do
      expect({ a: 1}.dig(:b, 1)).to eq(nil)
    end

    it "If the optional code block is specified, then that will be run and its result returned." do
      expect({ a: 1 }.dig(:b) { 2 }).to eq(2)
    end
  end

  context Struct do
    let(:nested_object) { Struct.new(:value).new(2) }
    let(:object) { Struct.new(:nested_object).new(nested_object) }

    it "Extracts the nested value specified by the sequence of idx objects by calling dig at each step." do
      expect(object.dig(:nested_object, :value)).to eq(2)
    end

    it "Returning nil if any intermediate step is nil." do
      expect(object.dig(:nested_object, :foo)).to eq(nil)
    end

    it "If the optional code block is specified, then that will be run and its result returned." do
      expect(object.dig(:nested_object, :foo) { 2 }).to eq(2)
    end
  end

  context OpenStruct do
    let(:nested_object) { OpenStruct.new(value: 2) }
    let(:object) { OpenStruct.new(nested_object: nested_object) }

    it "Extracts the nested value specified by the sequence of idx objects by calling dig at each step." do
      expect(object.dig(:nested_object, :value)).to eq(2)
    end

    it "Returning nil if any intermediate step is nil." do
      expect(object.dig(:nested_object, :foo)).to eq(nil)
    end

    it "If the optional code block is specified, then that will be run and its result returned." do
      expect(object.dig(:nested_object, :foo) { 2 }).to eq(2)
    end
  end
end
