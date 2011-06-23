# -*- encoding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../lib/tfidf_ja')

describe TfIdf::Ja do
  subject { TfIdf::Ja.new.instance_variable_get(:@idfs) }
  it {
    subject.exists?("この").should == true
    subject.exists?("文章").should == true
    subject.exists?("から").should == true
    subject.exists?("値").should   == true
    subject.exists?("を").should   == true
    subject.exists?("取得").should == true
    subject.exists?("する").should == true
  }
  it {
    subject.get("この").should_not == nil
    subject.get("文章").should_not == nil
    subject.get("から").should_not == nil
    subject.get("値").should_not   == nil
    subject.get("を").should_not   == nil
    subject.get("取得").should_not == nil
    subject.get("する").should_not == nil
  }
  it {
    subject.exists?("TFIDF").should == false
    subject.get("TFIDF").should     == nil
  }
end
