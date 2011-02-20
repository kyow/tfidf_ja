# coding: utf-8
#
# Copyright:: Copyright (c) kyow, 2011
# Authors:: K.Nishi

module TfIdf
  #
  # 辞書基底クラス
  #
  class Dictionary
    # コンストラクタ
    def initialize
      @map = {}
    end
    
    # 辞書にkeyとvalueを設定する
    # k:: key
    # v:: value
    def set(k, v)
      @map[k] = v
    end
    
    # keyからvalueを取得する
    # k:: key
    # return:: value
    def get(k)
      return @map[k]
    end
  
    # 辞書全体を返却する
    # value:: ハッシュテーブル
    def all
      return @map
    end
    
    # keyが存在するか検査する
    # k:: 検査するkey
    # return:: true=存在する faluse=存在しない
    def exists?(k)
      return @map.key?(k)
    end
  end
  
  #
  # DF辞書クラス
  #
  class DFs < Dictionary
  end
  
  #
  # IDF辞書クラス
  #
  class IDFs < Dictionary
    # 収録形態素数
    attr_accessor :size
    
    # 平均IDF値
    attr_accessor :average
  end
end
