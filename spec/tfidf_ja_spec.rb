# -*- encoding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../lib/tfidf_ja')

describe TfIdf::Ja do
  subject { TfIdf::Ja.new.instance_variable_get(:@idfs) }
  context "when word in dictionary" do
    it "exist should returns true" do
      subject.exists?("この").should == true
      subject.exists?("文章").should == true
      subject.exists?("から").should == true
      subject.exists?("値").should   == true
      subject.exists?("を").should   == true
      subject.exists?("取得").should == true
      subject.exists?("する").should == true
    end
    it "get should not returns nil" do
      subject.get("この").should_not == nil
      subject.get("文章").should_not == nil
      subject.get("から").should_not == nil
      subject.get("値").should_not   == nil
      subject.get("を").should_not   == nil
      subject.get("取得").should_not == nil
      subject.get("する").should_not == nil
    end
    context "with mock" do
      before do
        dic = TfIdf::Dictionary.new
        stub(dic).get { 1234.5678 }
        @subject = TfIdf::Ja.new
        @subject.instance_variable_set(:@idfs, dic)
      end
      subject { @subject }
      it "returns word and ifidf hash" do
        subject.tfidf(["dictinary_word"]).should ==
          {"dictinary_word" => 1234.5678}
      end
    end
  end
  context "when word not in dictionary" do
    it "exist should not returns true" do
      subject.exists?("TFIDF").should_not == true
      subject.get("TFIDF").should       == nil
    end
    context "with mock" do
      before do
        dic = TfIdf::Dictionary.new
        stub(dic).get { nil }
        stub(dic).average { 8765.4321 }
        @subject = TfIdf::Ja.new
        @subject.instance_variable_set(:@idfs, dic)
      end
      subject { @subject }
      it "returns word and ifidf average hash" do
          subject.tfidf(["not_dictinary_word"]).should ==
          { "not_dictinary_word" => 8765.4321 }
      end
    end
  end
end
