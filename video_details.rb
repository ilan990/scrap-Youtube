#!/usr/bin/env ruby

# frozen_string_literal: true

require "pry"
require "csv"
require "fileutils"
require "json"
require "httparty"

# API KEYS
AIRTABLE_API_KEY = ""
YT_API_KEY = ""

# JSON FILES
BEST_VIDEOS_FILE = "best_videos.json"
CHANNELS_FILE = "channels.json"
LAST_5_VIDEOS = JSON.parse(File.read("last_5_videos.json"))
VIDEOS_FILE = "videos.json"

def extract_video_details(video_id)
end

def save_video_details_for_all_channels
end
