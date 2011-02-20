# coding: utf-8
#
# Copyright:: Copyright (c) kyow, 2011
# Authors:: K.Nishi

$:.unshift(File.dirname(__FILE__))

require 'dictionary'
require 'version.rb'

module TfIdf
  #
  # 日本語辞書を使用してTFIDFを算出するクラス
  #
  class Ja
    # コンストラクタ
    def initialize
      @idfs = load_dic
      reset
    end
    
    # インスタンスのリセット
    def reset
      @tfs = {}
    end
    
    # TF-IDFを算出する
    # words:: 形態素配列
    # return:: key = 形態素、value = TF-IDF値のハッシュテーブル
    def tfidf(words)
      tfidfs = {}
      set_tf_map(words)
      @tfs.each_pair { |word, tf|
        tfidfs[word] = tf * idf(word)
      }
      return tfidfs
    end
    
    # IDFを取得する
    # word:: 形態素
    # return:: IDF
    def idf(word)
      idf = @idfs.get(word)
      if(idf.nil?)
        idf = @idfs.average
      end
      return idf
    end
    
    private
    
    #辞書ファイルを読み込む
    def load_dic
      idf_dic = File.dirname(__FILE__) + '/../dic/idf.dic'
      File.open(idf_dic) { |f|
        return Marshal.load(f)
      }
    end
    
    # TF値を計算する
    #words:: 形態素配列
    #return:: keyが形態素、valueがTF値のハッシュテーブル
    def set_tf_map(words)
      words.each { |word|
        if(@tfs.key?(word))
          @tfs[word] += 1
        else
          @tfs[word] = 1
        end
      }
    end
  end
end