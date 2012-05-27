require 'spec_helper'

describe 'Top-level wrapper' do

  it 'can be attached to any hash instance' do
    h = {:hi => 'how are you'}

    e = SuperEnvy::Extender.new h

    e.should respond_to :hi

  end


  it 'throws an exception if it doesnt receive a hash' do
    expect { SuperEnvy::Extender.new "lol"}.should raise_error
  end
end
