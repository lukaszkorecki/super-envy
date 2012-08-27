require 'spec_helper'

describe 'Extender' do

  context 'Base' do
    it 'throws an exception if it doesnt receive a hash' do
      expect { SuperEnvy::Extender.new "lol"}.should raise_error
    end

    it 'can be attached to any hash instance' do
      h = {:hi => 'how are you'}
      e = SuperEnvy::Extender.new h
      e.should respond_to :hi
    end
  end



  context 'Dynamicaly created methods' do
    let(:hash) { {:oi => 'yo', :foo => 'bar', :empty_bar => ''} }
    subject  { SuperEnvy::Extender.new hash }

    context 'Accessors' do
      it 'defines accessor method' do
        subject.oi.should == 'yo'
      end

      it 'defines accesor method which accepts a block and returns result of that block' do
        subject.foo { |val| val.reverse }.should == 'rab'
      end

      context 'Query methods' do
        it 'defines query method which checks if variable is blank' do
          subject.oi?.should == true
          subject.empty_bar?.should == false
        end

        it 'defines has_<vname>? method which checks variable existence' do
          subject.has_oi?.should == true
          subject.has_empty_bar?.should == true
          subject.has_missing_var?.should == false
        end
      end
    end
  end
end
