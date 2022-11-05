#!/usr/bin/env ruby

# frozen_string_literal: true

require "pry"
require "csv"
require "fileutils"
require "json"
require "httparty"
require "nokogiri"
require "open-uri"
require "uri"
require 'rubygems'


CHANNELS_FILE = "channels.json"

def get_last_5_videos(channel_id)
  @doc = Nokogiri::HTML(URI.open("#{channel_id}.html"))
  inline_script = @doc.xpath('//script[not(@src)]')
  liste=[]
  i=0
  inline_script.each do |script|
    if (i==22)
      liste<<script.text
    end
    i=i+1
  end
  i=7
  max_videos=0
  id = []
  listeMusique=[]
  (0..7).each do |j|
    id<<liste[0][j]
  end
  while i<liste[0].length
    id<<liste[0][i]
    id.shift
    if id.join == "watch?v="
      id.clear
      n=i+1
      (n..n+10).each do |n|
        id << liste[0][n]
      end
      listeMusique<<id.join
      id.shift(3)
      max_videos = max_videos+1
      if max_videos==5
        break
      end
    end
    i=i+1

  end

  return listeMusique
end

def save_last_5_videos(id,nom)
  raw_data = File.read('last_5_videos.json')
  hash = JSON.parse raw_data

  hash[id]["videos"]=get_last_5_videos(nom)
  hash.to_json
  File.open("last_5_videos.json", "w") { |f| f.write hash.to_json }

end


save_last_5_videos(1,'AlanWalker')

save_last_5_videos(0,'Sia')