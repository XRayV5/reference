describe 'String' do

  describe "#titleize" do

    it "capitalizes each word in a string" do
      expect { 'capitalizes each word in a string'.titleize }.to eq('Capitalizes Each Word In A String')
    end

    it "works with single-word strings" do
      expect { 'capitalizes'.titleize }.to eq('Capitalizes')
    end

    it "capitalizes all uppercase strings" do
      expect { 'ALL UPPERCASE'.titleize }.to eq('ALL UPPERCASE')
    end

    it "capitalizes mixed-case strings" do
      expect { 'mIxEd-CaSe sTronG'.titleize }.to eq('MIxEd-CaSe STronG')
    end

  end

  describe '#blank?' do

    it "returns true if string is empty" do
      expect { ''.blank? }.to be_true
    end

    it "returns true if string contains only spaces" do
      expect { '   '.blank? }.to be_true
    end

    it "returns true if string contains only tabs" do
    # Get a tab using a double-quoted string with \t
    # example: "\t\t\t"
      expect { '\t\t\t'.blank? }.to be_true
    end

    it "returns true if string contains only spaces and tabs" do
      expect { '\t\t \t    '.blank? }.to be_true
    end

    it "returns false if string contains a letter" do
      expect { 't'.blank? }.to be_false
    end

    it "returns false if string contains a number" do
      expect { '1'.blank? }.to be_false
    end

  end

end
