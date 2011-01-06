# coding: utf-8
#
#Copyright:: Copyright (c) kyow, 2011
#Authors:: K.Nishi

$:.unshift(File.dirname(__FILE__))
require 'dictionary'

#
#
#
module TfIdf
  #
  # ユーティリティ
  #
  class Utility
  N = 20000000000
    # df.dicからidf.dicを生成する
    def self.create_dic
      dfs = self.df_load()
      idfs = self.create_idf(dfs)
      self.idf_save(idfs)
      puts "complete."
      puts "size=#{idfs.size} average=#{idfs.average}"
    end
    
    def self.get_inverse(df_value)
      return df_value > 0 ? Math::log(N / df_value) : 0
    end
    
    private
    
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
    
    def self.df_load()
      df_dic  = File.dirname(__FILE__) + '/../dic/df.dic'
      unless File::exists?(df_dic)
        raise
      end
      File::open(df_dic) { |f|
        return Marshal.load(f)
      }
    end
    
    def self.idf_save(idfs)
      idf_dic  = File.dirname(__FILE__) + '/../dic/idf.dic'
      File::open(idf_dic, 'wb') { |f|
        Marshal.dump(idfs, f)
      }
    end
  end
end