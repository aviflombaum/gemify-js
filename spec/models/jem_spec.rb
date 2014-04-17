require 'spec_helper'

describe Jem do

  let(:jem) { Jem.create(
    name: 'Test-gem', 
    author: 'sunwooz', 
    version_number: '1.2.3', 
    description: 'Description', 
    email: 'yangsunwoo@gmail.com', 
    summary: 'Summary here', 
    homepage: 'http://www.github.com') 
  }
  
  describe "#create_gem_directory" do
    it "creates the correct folders" do
      pending
    end
  end

  describe ".rubygem_login" do
    it "should log into rubygem" do
      pending "don't know how to test this yet!"
      Jem.rubygem_login.should eq('wontae.yang@flatironschool.com')
    end
  end

  describe "#find_directory" do
    it "should return the jem's directory in jems_tmp folder" do
      correct_directory = Dir.pwd + "/jems_tmp/#{jem.name}"
      correct_directory.should eq(jem.send(:find_directory))
    end
  end

end