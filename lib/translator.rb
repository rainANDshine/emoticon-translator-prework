require "yaml"

def load_library(path)
  file = YAML.load_file(path)
  hash = {"get_meaning" => {}, "get_emoticon" => {}}
  
  file.each do |key, value|
    hash["get_emoticon"][value.first] = value.last
  end
  
  file.each do |key, value|
    hash["get_meaning"][value.last] = key
  end
  
  hash
end

def get_japanese_emoticon(path, emo)
  hash = load_library(path)
  
  hash["get_emoticon"].each do |key, value|
    if key == emo
      return value
    end
  end
  
  "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emo)
  hash = load_library(path)
  
  hash["get_meaning"].each do |key, value|
    if key == emo
      return value
    end
  end
  
  "Sorry, that emoticon was not found"
end