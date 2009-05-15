require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe AppDiagram do
  describe 'extracting filenames' do
    describe 'without namespaces' do
      it 'should work with a simple name' do
        ad = AppDiagram.new
        ad.extract_class_name('app/models/test_this.rb').should == 'TestThis'
      end
    end
  end
end
