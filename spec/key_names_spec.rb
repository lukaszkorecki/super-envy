require 'spec_helper'

describe 'Key names and acessor methods' do
  let(:hash_with_mixed_keys)  {
    {
      :lol => 1,
      'ARGH' => 2,
      'wOOt' => 3,
      'something-long' => 4,
      'i am a Key' => 5
    }
  }

  subject { SuperEnvy::Extender.new hash_with_mixed_keys}

  it 'creates lower case method names for mixed and upper case keys' do
    subject.lol.should == 1
    subject.argh.should == 2
    subject.woot.should == 3
  end

  it 'normalizes dashes and spaces in key names' do
    subject.something_long.should == 4
    subject.i_am_a_key.should == 5
  end

  it 'adds query methods for normalized names' do
    subject.lol?.should == true
    subject.argh?.should == true
    subject.woot?.should == true
    subject.something_long?.should == true
    subject.i_am_a_key?.should == true
    subject.has_lol?.should == true
    subject.has_argh?.should == true
    subject.has_woot?.should == true
    subject.has_something_long?.should == true
    subject.has_i_am_a_key?.should == true
  end
end
