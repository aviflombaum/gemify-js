require 'spec_helper'

describe ScriptController do

  describe "GET 'file:string'" do
    it "returns http success" do
      get 'file:string'
      response.should be_success
    end
  end

end
