require 'spec_helper'
require 'jenkins_builds'

describe JenkinsBuilds do
  
  describe "update" do
    
    before :all do
      VCR.use_cassette("JenkinsBuilds/update") do
        @result = JenkinsBuilds.update
      end
    end
    
    it "should return the five latest builds and create a list", :vcr do
      @result[:latest].count.should == 5
      @result[:latest].first[:job].should == "master-builder"
      @result[:latest].first[:date].should == "2013-08-16 13:00:46"
      @result[:latest].first[:status].should == "success"
    end
        
  end
  
  describe "build_images" do
    
    before :all do
      VCR.use_cassette("JenkinsBuilds/build_images") do
        @result = JenkinsBuilds.build_images
      end
    end
    
    it "should return a fail image, a state and a sad trombone", :vcr do
      @result[:image].should == "https://buildmemes.herokuapp.com/f"
      @result[:state].should == "fail"
      @result[:trombone].should include('<source src="/sadtrombone.mp3" type="audio/mpeg; codecs=\'mp3\'">')
      @result[:trombone].should include('<source src="/sadtrombone.ogg" type="audio/ogg; codecs=\'vorbis\'">')
    end
    
  end
  
end