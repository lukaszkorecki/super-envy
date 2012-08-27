require 'spec_helper'

describe 'Data types' do
  context 'Arrays'  do
    let(:hash_with_array) {
      {
        'yo' => 'yo,yo',
        'list_a' => '1,2,3,4',
        'count_i' => '200',
        'fract_f' => '304.501'
      }
    }

    subject { SuperEnvy::Extender.new hash_with_array}

    it 'creates acessors and "casts" values according to data type prefix' do
      subject.yo.should == 'yo,yo'
      subject.list.should == %w{1 2 3 4}
      subject.count.should == 200
      subject.fract.should == 304.501
    end

  end
end
