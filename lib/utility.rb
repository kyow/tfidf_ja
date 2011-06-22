# -*- encoding: utf-8 -*-
#
# Copyright:: Copyright (c) kyow, 2011
# Authors:: K.Nishi

$:.unshift(File.dirname(__FILE__))
require 'dictionary'

module TfIdf
  #
  # ユーティリティクラス
  #
  class Utility
    # (仮の)インデックス数
    N = 20000000000
    
    # df.dicからidf.dicを生成する
    def self.create_dic
      dfs = self.df_load()
      idfs = self.create_idf(dfs)
      self.idf_save(idfs)
      puts "complete."
      puts "size=#{idfs.size} average=#{idfs.average}"
    end
    
    # DF値からiDF値を取得する
    # IDF = log(N / DF)
    # df_value:: DF値
    def self.get_inverse(df_value)
      return df_value > 0 ? Math::log(N / df_value) : 0
    end
    
    private
    
    # DFsオブジェクトからIDFsオブジェクトを生成する
    # dfs:: DFsオブジェクト
    def self.create_idf(dfs)
      idfs = IDFs.new
      total = 0
      dfs.all.each_pair { |k, v|
        idf = TfIdf::Utility.get_inverse(v)
        idfs.set(k, idf)
        total += idf
      }
      idfs.size = dfs.all.size
      idfs.average = total / idfs.size
      return idfs
    end
    
    # df.dicを読み込む
    def self.df_load()
      df_dic  = File.dirname(__FILE__) + '/../dic/#{Version.ruby}/df.dic'
      unless File::exists?(df_dic)
        raise
      end
      File::open(df_dic) { |f|
        return Marshal.load(f)
      }
    end
    
    # idf.dicを保存する
    def self.idf_save(idfs)
      idf_dic  = File.dirname(__FILE__) + '/../dic/#{Version.ruby}/idf.dic'
      File::open(idf_dic, 'wb') { |f|
        Marshal.dump(idfs, f)
      }
    end
  end
end