# coding: utf-8
#
#Copyright:: Copyright (c) kyow, 2011
#Authors:: K.Nishi

#require '../lib/tfidf_ja'
#require '../lib/tfidf_ja/igo_extension'
require 'rubygems'
require 'tfidf_ja'
require 'tfidf_ja/igo_extension'

def output(h)
  h.each { |item|
    puts "#{item[0]} => #{item[1]}"
  }
end

tfidf = TfIdf::Ja.new
output tfidf.tfidf(['この', '文章', 'から', 'TFIDF', '値', 'を', '取得', 'する'])
output tfidf.tfidf(['文章', 'を', '連続', 'で', '渡す', 'と', 'TFIDF', '値', 'を', '追加', 'で', '算出', 'する'])


# 以下はigo-rubyが必要
dir = '../../ipadic'
tie = TfIdf::IgoExtension.new(dir)
puts s = "この文字列を形態素解析してTFIDF値を取得する"
output tie.tfidf(s)

puts s = "連続してインスタンスを使うと前回解析したTFIDF計算結果を加味する"
output tie.tfidf(s)

tie.reset
puts s = "TfIdf::IgoExtension.resetでリセットする"
output tie.tfidf(s)
