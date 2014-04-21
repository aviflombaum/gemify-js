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
    it "uses the correct gem id" do
      jem_id = jem.create_gem_directory
      jem.delete_jem_from_directory
      expect(jem_id).to eq(jem.id)
    end

    it "creates a folder in the jems_tmp directory with the folder name being the name of the jem" do
      pending
    end
  end

  describe ".rubygem_login" do
    it "should log into rubygem" do
      pending "don't know how to test this yet!"
      Jem.rubygem_login.should eq('wontae.yang@flatironschool.com')
    end
  end

  describe "#create_github_repository" do
    it "returns the correct repository" do
      repository = jem.create_github_repository
      expect(repository.full_name).to eq("gemify-js/#{jem.name}")
      #delete repository
      pending
    end
  end

  describe "#find_directory" do
    it "should return the jem's directory in jems_tmp folder" do
      correct_directory = Dir.pwd + "/jems_tmp/#{jem.name}"
      correct_directory.should eq(jem.send(:find_directory))
    end
  end

end