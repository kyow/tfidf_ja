# coding: utf-8
#
#Copyright:: Copyright (c) kyow, 2011
#Authors:: K.Nishi

require 'rubygems'
require 'tfidf_ja'
require 'tfidf_ja/igo_extension'

def output(h)
  h.each { |item|
    puts "#{item[0]} => #{item[1]}"
  }
end

tfidf = TfIdf::Ja.new
puts "-->1回目"
output tfidf.tfidf(['この', '文章', 'から', 'TFIDF', '値', 'を', '取得', 'する'])
puts "-->2回目"
output tfidf.tfidf(['文章', 'を', '連続', 'で', '渡す', 'と', 'TFIDF', '値', 'を', '追加', 'で', '算出', 'する'])

puts "-->リセット"
tfidf.reset
output tfidf.tfidf(['TFIDF', '#', 'rest', 'で', 'リセット', 'する'])
