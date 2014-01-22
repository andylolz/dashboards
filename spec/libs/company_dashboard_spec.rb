require 'spec_helper'
require 'company_dashboard'

describe CompanyDashboard do
  
  it "should show correct progress for each quarter", :vcr do
    progress = CompanyDashboard.progress(2013)
    
    progress[:q1].should == 97
    progress[:q2].should == 90.2
    progress[:q3].should == 93.1
    progress[:q4].should == 87.3

    progress = CompanyDashboard.progress(2014)
    
    progress[:q1].should == 5.3
    progress[:q2].should == 0
    progress[:q3].should == 0
    progress[:q4].should == 0
  end
  
  it "should show the correct number of published Open Data Certificates", :vcr do
    CompanyDashboard.odcs(2013).should == "629"
  end
  
  it "should show the correct member count", :vcr do
    CompanyDashboard.members(2013).should == 52
    CompanyDashboard.members(2014).should == 56
  end
  
  it "should show the correct reach", :vcr do
    CompanyDashboard.reach(2013).should == "303396"
  end
  
  it "should show the correct bookings value", :vcr do
    CompanyDashboard.bookings(2013).to_i.should == 2191064
  end
  
  it "should show the correct unlocked value", :vcr do
    CompanyDashboard.value(2013).to_i.should == 16924307
  end
  
  it "should show the correct kpi percentage", :vcr do
    CompanyDashboard.kpis(2013).should == 100.0
  end
  
end